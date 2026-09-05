# StudentHub: JSP vs Servlet Registration Portal

StudentHub is a student registration project created for a collaborative peer review. It implements the same registration workflow in two ways: a pure Java Servlet that generates HTML with `PrintWriter`, and a JSP page that combines native HTML with server-side Java logic.

The unified portal lets users choose either implementation and compare readability, maintainability, request handling, and compilation behavior.

## Live Entry Points

**Live Link** :- https://jsp-vs-servlet-tradeoff.onrender.com

When running locally with Tomcat:

| Page | URL |
| --- | --- |
| Unified portal | http://localhost:8080/jsp-vs-servlet-tradeoff/ |
| JSP registration | http://localhost:8080/jsp-implementation/registration.jsp |
| Servlet registration | http://localhost:8080/servlet-implementation/StudentServlet |

Start at the unified portal. It provides links to both registration experiences and explains the project workflow.

## Features

- Responsive StudentHub landing page and registration interface
- User choice between JSP and Servlet registration
- Student name, email, and course registration
- Required-field and email validation in the browser
- Live registered-student directory and count
- Safe HTML escaping for submitted values
- Mobile-friendly layout with shared branding
- Peer-review comparison of both implementation styles

## Project Structure

```text
jsp-vs-servlet-tradeoff/
├── index.html
├── pom.xml
├── README.md
├── .gitignore
├── .dockerignore
├── Dockerfile
├── render.yaml
├── docker/
│   └── entrypoint.sh
├── docs/
│   └── peer-review-notes.md
├── servlet-implementation/
│   ├── pom.xml
│   └── src/com/app/servlet/
│       └── StudentRegistrationServlet.java
└── jsp-implementation/
    ├── pom.xml
    ├── src/com/app/model/
    │   └── Student.java
    └── webapp/
        └── registration.jsp
```

## Requirements

- JDK 17 or later
- Apache Tomcat 11.x
- Maven 3.8 or later for WAR packaging (optional for manual `javac` deployment)
- A browser

Tomcat 11 uses the Jakarta Servlet API. The Servlet implementation therefore imports `jakarta.servlet.*`.

## Build With Maven

From the project root:

```bash
mvn clean package
```

This builds both WAR files:

```text
servlet-implementation/target/servlet-implementation.war
jsp-implementation/target/jsp-implementation.war
```

Copy both WAR files to Tomcat's `webapps` directory and copy `index.html` to a root context named `jsp-vs-servlet-tradeoff`, or deploy the project files using the exploded layout shown above. Restart Tomcat and open the unified portal URL.

## Run Without Maven

Maven is not required to understand or demonstrate the assignment. Tomcat already provides the Servlet API JAR.

Compile the Java classes manually:

```powershell
$tomcat = "C:\Program Files\Apache Software Foundation\Tomcat 11.0"
javac -encoding UTF-8 `
  -cp "$tomcat\lib\servlet-api.jar" `
  -d "$tomcat\webapps\servlet-implementation\WEB-INF\classes" `
  "servlet-implementation\src\com\app\servlet\StudentRegistrationServlet.java"

javac -encoding UTF-8 `
  -cp "$tomcat\lib\servlet-api.jar" `
  -d "$tomcat\webapps\jsp-implementation\WEB-INF\classes" `
  "jsp-implementation\src\com\app\model\Student.java"
```

Copy `jsp-implementation/webapp/registration.jsp` to the JSP context, copy `index.html` to the unified portal context, start Tomcat, and open the URLs above.

## JSP and Servlet Comparison

| Area | Servlet implementation | JSP implementation |
| --- | --- | --- |
| Presentation | HTML is written through `PrintWriter` calls | HTML remains directly readable in the JSP file |
| Readability | Lower for large pages | Higher for page layout and styling |
| Maintainability | UI changes require Java source changes and recompilation | Markup changes stay in the JSP view |
| Request handling | Direct `doGet` and `doPost` methods | JSP request and scriptlet processing |
| First request | Uses already-compiled Java bytecode | JSP is translated and compiled by Tomcat on first use |
| Best role | Request handling, routing, and controller logic | Server-rendered presentation |

The project intentionally keeps presentation logic close to each implementation so the difference is easy to observe. In a production application, request handling and presentation should normally be separated using MVC principles.

## Data and Security Notes

- Student records are stored in application memory only.
- Data is lost when the application or Tomcat restarts.
- This project does not include a database, login system, role management, or persistent audit history.
- Submitted values are HTML-escaped before being displayed.
- A production deployment should add a database, server-side validation, authentication, HTTPS, CSRF protection, logging, and backup procedures.

## Public Deployment

`localhost` is accessible only on the computer running Tomcat. To share the project publicly, deploy it to an internet-accessible Java server or cloud VM, configure a domain name and HTTPS, and expose only the required web port. Deploy the unified portal together with both implementation contexts:

```text
/jsp-vs-servlet-tradeoff/
/jsp-implementation/registration.jsp
/servlet-implementation/StudentServlet
```

Do not expose a development Tomcat installation directly to the public internet without server hardening, HTTPS, authentication, validation, and persistent storage.

## Deploy With GitHub and Render

This project includes a multi-stage `Dockerfile`, a Render Blueprint file, and a dynamic-port entrypoint. The Docker image builds both WAR files and deploys them with the unified portal in one Tomcat container.

### 1. Push the project to GitHub

Create an empty GitHub repository, then run these commands from the project root:

```bash
git init
git add .
git commit -m "Prepare StudentHub for deployment"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
git push -u origin main
```

Replace `YOUR-USERNAME` and `YOUR-REPOSITORY` with your GitHub values. Do not commit passwords, API keys, or database credentials.

### 2. Create the Render service

1. Open [Render](https://render.com/) and sign in with GitHub.
2. Select **New**, then **Blueprint**.
3. Choose the GitHub repository containing this project.
4. Render reads `render.yaml` and selects the Docker runtime and free plan.
5. Confirm the service name and click **Apply**.
6. Wait for the build and deployment to finish.

Render automatically provides the `PORT` environment variable. The Docker entrypoint updates Tomcat to use that port, so no manual port setting is required.

### 3. Open the deployed website

Use the public Render URL shown on the service page:

```text
https://YOUR-SERVICE-NAME.onrender.com/
```

The unified portal is at `/`. The two registration pages remain available at:

```text
/jsp-implementation/registration.jsp
/servlet-implementation/StudentServlet
```

### Render Free Plan Notes

- Free services can sleep after inactivity, so the first request may be slow.
- The service can restart or be redeployed at any time.
- Current student records are stored in memory and will be lost after a restart.
- Add a hosted PostgreSQL or MySQL database before using this for real student data.
- Add authentication and server-side validation before collecting sensitive information.

Docker is not installed on the current development computer, so the image cannot be built locally here. Render will perform the Docker build from `Dockerfile` during deployment. If a local Docker installation is available, validate it with:

```bash
docker build -t studenthub .
docker run --rm -p 8080:8080 -e PORT=8080 studenthub
```

## Peer-Review Conclusion

JSP is easier to read and maintain when the main task is server-rendered HTML. Servlets provide direct control over HTTP requests and are a better fit for controllers and routing. The strongest real-world design combines these roles instead of placing all business logic inside either a Servlet or a JSP page.

## Developer

**Nitish Dubey**  
Registration No: **251fd01003**  
Email: **dubeynitish1308@gmail.com**
