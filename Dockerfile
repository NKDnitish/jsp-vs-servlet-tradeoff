# Build both WAR files with Maven.
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /workspace

COPY pom.xml .
COPY servlet-implementation/pom.xml servlet-implementation/pom.xml
COPY jsp-implementation/pom.xml jsp-implementation/pom.xml
RUN mvn -B -q dependency:go-offline

COPY servlet-implementation/src servlet-implementation/src
COPY jsp-implementation/src jsp-implementation/src
COPY jsp-implementation/webapp jsp-implementation/webapp
RUN mvn -B -q clean package

# Run the portal and both implementations in one Tomcat container.
FROM tomcat:11-jdk17-temurin

RUN rm -rf webapps/ROOT webapps/examples webapps/docs webapps/host-manager webapps/manager
COPY index.html webapps/ROOT/index.html
COPY --from=build /workspace/servlet-implementation/target/servlet-implementation.war webapps/servlet-implementation.war
COPY --from=build /workspace/jsp-implementation/target/jsp-implementation.war webapps/jsp-implementation.war
COPY docker/entrypoint.sh /usr/local/bin/studenthub-entrypoint.sh
RUN chmod +x /usr/local/bin/studenthub-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/studenthub-entrypoint.sh"]
