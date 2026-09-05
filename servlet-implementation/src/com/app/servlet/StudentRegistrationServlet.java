package com.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentServlet")
public class StudentRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // In-memory list to simulate database storage
    private final List<String[]> studentList = new CopyOnWriteArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<meta name='description' content='StudentHub registration dashboard built with Servlets.'>");
        out.println("<title>StudentHub | Servlet Registration</title>");
        out.println("<style>");
        out.println(":root { --ink:#17233c; --muted:#68748b; --paper:#f6f8fb; --line:#e3e8f0; --accent:#f26b4f; --accent-dark:#d9563d; --teal:#1b9a91; } *{box-sizing:border-box} body{margin:0;color:var(--ink);background:var(--paper);font-family:Georgia,'Times New Roman',serif}.site-header{background:var(--ink);color:white}.nav{width:min(1180px,calc(100% - 40px));margin:auto;min-height:76px;display:flex;align-items:center;justify-content:space-between;gap:24px}.brand{display:flex;align-items:center;gap:12px;color:white;text-decoration:none}.brand-mark{width:38px;height:38px;display:grid;place-items:center;color:var(--ink);background:var(--accent);font-family:Arial,sans-serif;font-weight:800;border-radius:10px}.brand strong{display:block;font-size:20px}.brand small{color:#aebbd0;font:11px Arial,sans-serif;letter-spacing:1.4px;text-transform:uppercase}.nav-note{color:#c8d1df;font:13px Arial,sans-serif}.hero{background:var(--ink);color:white;padding:62px 20px 76px;position:relative;overflow:hidden}.hero:after{content:'';position:absolute;width:340px;height:340px;right:8%;top:-190px;border:1px solid rgba(242,107,79,.45);border-radius:50%;box-shadow:0 0 0 32px rgba(242,107,79,.08),0 0 0 64px rgba(242,107,79,.04)}.hero-inner{width:min(1180px,100%);margin:auto;position:relative;z-index:1}.eyebrow,.panel-kicker,.footer-label{font-family:Arial,sans-serif;text-transform:uppercase}.eyebrow{color:#ffab97;font-size:12px;font-weight:700;letter-spacing:2px}h1{max-width:680px;margin:14px 0 16px;font-size:clamp(38px,6vw,70px);line-height:.98;font-weight:500;letter-spacing:-1.5px}.hero p{max-width:580px;margin:0;color:#c8d1df;font:16px/1.7 Arial,sans-serif}main{width:min(1180px,calc(100% - 40px));margin:-38px auto 0;position:relative;z-index:2}.workspace{display:grid;grid-template-columns:minmax(280px,.78fr) minmax(0,1.22fr);gap:22px}.panel{background:white;border:1px solid var(--line);border-radius:16px;box-shadow:0 16px 40px rgba(23,35,60,.08)}.form-panel,.table-panel{padding:30px}.panel-kicker{color:var(--teal);font-size:11px;font-weight:700;letter-spacing:1.6px}.panel h2{margin:9px 0 8px;font-size:28px;font-weight:500}.intro{color:var(--muted);font:14px/1.6 Arial,sans-serif;margin:0 0 26px}label{display:block;margin:17px 0 7px;font:700 12px Arial,sans-serif;letter-spacing:.4px;text-transform:uppercase}input{width:100%;border:1px solid var(--line);border-radius:8px;padding:13px 14px;color:var(--ink);background:#fbfcfe;font:15px Arial,sans-serif;outline:none}input:focus{border-color:var(--teal);box-shadow:0 0 0 3px rgba(27,154,145,.14)}.submit{width:100%;margin-top:24px;padding:14px 18px;border:0;border-radius:8px;color:white;background:var(--accent);cursor:pointer;font:700 14px Arial,sans-serif}.submit:hover{background:var(--accent-dark)}.table-heading{display:flex;justify-content:space-between;align-items:start;gap:16px}.count{min-width:42px;padding:8px 10px;color:var(--teal);background:#e9f7f5;border-radius:20px;text-align:center;font:700 14px Arial,sans-serif}.table-wrap{overflow-x:auto;margin-top:24px}table{width:100%;border-collapse:collapse;font:14px Arial,sans-serif}th{padding:12px 14px;color:var(--muted);border-bottom:2px solid var(--line);text-align:left;font-size:11px;letter-spacing:1px;text-transform:uppercase}td{padding:16px 14px;border-bottom:1px solid var(--line)}tbody tr:hover{background:#fbfcfe}.empty{color:var(--muted);text-align:center}.site-footer{width:min(1180px,calc(100% - 40px));margin:54px auto 0;padding:28px 0 32px;border-top:1px solid var(--line);display:flex;justify-content:space-between;gap:28px;color:var(--muted);font:13px/1.6 Arial,sans-serif}.site-footer strong{color:var(--ink)}.footer-label{margin-bottom:5px;color:var(--accent-dark);font-size:10px;font-weight:700;letter-spacing:1.4px}@media(max-width:760px){.nav,main,.site-footer{width:min(100% - 28px,560px)}.nav-note{display:none}.hero{padding:48px 14px 70px}h1{font-size:46px}.workspace{grid-template-columns:1fr}.form-panel,.table-panel{padding:24px}.site-footer{display:block}.site-footer>div+div{margin-top:18px}}");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        
        out.println("<header class='site-header'><nav class='nav'><a class='brand' href='StudentServlet'><span class='brand-mark'>S</span><span><strong>StudentHub</strong><small>Registration portal</small></span></a><span class='nav-note'><a href='/jsp-vs-servlet-tradeoff/' style='color:#c8d1df;text-decoration:none'>Portal home</a> · Servlet implementation · Spring intake 2026</span></nav></header>");
        out.println("<section class='hero'><div class='hero-inner'><div class='eyebrow'>Student success starts here</div><h1>Build your next chapter.</h1><p>A focused registration workspace for keeping student information organized, clear and ready for the next opportunity.</p></div></section>");
        out.println("<main><div class='workspace'><section class='panel form-panel'><div class='panel-kicker'>New entry</div><h2>Register a student</h2><p class='intro'>Add a student to the active enrollment list. All fields are required.</p>");
        out.println("<form action='StudentServlet' method='POST'>");
        out.println("<label for='studentName'>Student name</label><input id='studentName' type='text' name='studentName' placeholder='e.g. Aanya Sharma' required>");
        out.println("<label for='email'>Email address</label><input id='email' type='email' name='email' placeholder='student@example.com' required>");
        out.println("<label for='course'>Enrolled course</label><input id='course' type='text' name='course' placeholder='e.g. Computer Science' required>");
        out.println("<button class='submit' type='submit'>Add to student list &rarr;</button>");
        out.println("</form>");
        out.println("</section><section class='panel table-panel'><div class='table-heading'><div><div class='panel-kicker'>Live directory</div><h2>Registered students</h2><p class='intro'>A quick view of the current enrollment records.</p></div><span class='count'>" + studentList.size() + "</span></div><div class='table-wrap'><table>");
        out.println("<tr><th>Name</th><th>Email</th><th>Course</th></tr>");

        if (studentList.isEmpty()) {
            out.println("<tr><td class='empty' colspan='3'>No students registered yet.</td></tr>");
        } else {
            for (String[] student : studentList) {
                out.println("<tr>");
                out.println("<td>" + escapeHtml(student[0]) + "</td>");
                out.println("<td>" + escapeHtml(student[1]) + "</td>");
                out.println("<td>" + escapeHtml(student[2]) + "</td>");
                out.println("</tr>");
            }
        }
        out.println("</table></div></section></div></main>");
        out.println("<footer class='site-footer'><div><div class='footer-label'>StudentHub</div><strong>Simple tools for meaningful learning.</strong><br>Built for the JSP vs Servlet peer-review project.</div><div><div class='footer-label'>Developer</div><strong>Nitish Dubey</strong><br>Registration No: 251fd01003<br><a href='mailto:dubeynitish1308@gmail.com'>dubeynitish1308@gmail.com</a></div></footer>");
        out.println("</body>");
        out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("studentName");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        if (name != null && email != null && course != null) {
            studentList.add(new String[]{name, email, course});
        }

        // Re-render the form with updated list
        doGet(request, response);
    }

    private String escapeHtml(String value) {
        return value.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
}