<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Collections, com.app.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="StudentHub registration dashboard built with JSP.">
    <title>StudentHub | JSP Registration</title>
    <style>
        :root { --ink: #17233c; --muted: #68748b; --paper: #f6f8fb; --line: #e3e8f0; --accent: #f26b4f; --accent-dark: #d9563d; --teal: #1b9a91; }
        * { box-sizing: border-box; }
        body { margin: 0; color: var(--ink); background: var(--paper); font-family: Georgia, 'Times New Roman', serif; }
        .site-header { background: var(--ink); color: white; }
        .nav { width: min(1180px, calc(100% - 40px)); margin: auto; min-height: 76px; display: flex; align-items: center; justify-content: space-between; gap: 24px; }
        .brand { display: flex; align-items: center; gap: 12px; color: white; text-decoration: none; }
        .brand-mark { width: 38px; height: 38px; display: grid; place-items: center; color: var(--ink); background: var(--accent); font-family: Arial, sans-serif; font-weight: 800; border-radius: 10px; }
        .brand strong { display: block; font-size: 20px; letter-spacing: .2px; }
        .brand small { color: #aebbd0; font: 11px Arial, sans-serif; letter-spacing: 1.4px; text-transform: uppercase; }
        .nav-note { color: #c8d1df; font: 13px Arial, sans-serif; }
        .hero { background: var(--ink); color: white; padding: 62px 20px 76px; position: relative; overflow: hidden; }
        .hero:after { content: ''; position: absolute; width: 340px; height: 340px; right: 8%; top: -190px; border: 1px solid rgba(242,107,79,.45); border-radius: 50%; box-shadow: 0 0 0 32px rgba(242,107,79,.08), 0 0 0 64px rgba(242,107,79,.04); }
        .hero-inner { width: min(1180px, 100%); margin: auto; position: relative; z-index: 1; }
        .eyebrow { color: #ffab97; font: 700 12px Arial, sans-serif; letter-spacing: 2px; text-transform: uppercase; }
        h1 { max-width: 680px; margin: 14px 0 16px; font-size: clamp(38px, 6vw, 70px); line-height: .98; font-weight: 500; letter-spacing: -1.5px; }
        .hero p { max-width: 580px; margin: 0; color: #c8d1df; font: 16px/1.7 Arial, sans-serif; }
        main { width: min(1180px, calc(100% - 40px)); margin: -38px auto 0; position: relative; z-index: 2; }
        .workspace { display: grid; grid-template-columns: minmax(280px, .78fr) minmax(0, 1.22fr); gap: 22px; }
        .panel { background: white; border: 1px solid var(--line); border-radius: 16px; box-shadow: 0 16px 40px rgba(23,35,60,.08); }
        .form-panel { padding: 30px; }
        .panel-kicker { color: var(--teal); font: 700 11px Arial, sans-serif; letter-spacing: 1.6px; text-transform: uppercase; }
        h2 { margin: 9px 0 8px; font-size: 28px; font-weight: 500; }
        .intro { color: var(--muted); font: 14px/1.6 Arial, sans-serif; margin: 0 0 26px; }
        label { display: block; margin: 17px 0 7px; font: 700 12px Arial, sans-serif; letter-spacing: .4px; text-transform: uppercase; }
        input { width: 100%; border: 1px solid var(--line); border-radius: 8px; padding: 13px 14px; color: var(--ink); background: #fbfcfe; font: 15px Arial, sans-serif; outline: none; transition: border-color .2s, box-shadow .2s; }
        input:focus { border-color: var(--teal); box-shadow: 0 0 0 3px rgba(27,154,145,.14); }
        .submit { width: 100%; margin-top: 24px; padding: 14px 18px; border: 0; border-radius: 8px; color: white; background: var(--accent); cursor: pointer; font: 700 14px Arial, sans-serif; transition: background .2s, transform .2s; }
        .submit:hover { background: var(--accent-dark); transform: translateY(-1px); }
        .table-panel { padding: 30px; min-width: 0; }
        .table-heading { display: flex; justify-content: space-between; align-items: start; gap: 16px; }
        .count { min-width: 42px; padding: 8px 10px; color: var(--teal); background: #e9f7f5; border-radius: 20px; text-align: center; font: 700 14px Arial, sans-serif; }
        .table-wrap { overflow-x: auto; margin-top: 24px; }
        table { width: 100%; border-collapse: collapse; font: 14px Arial, sans-serif; }
        th { padding: 12px 14px; color: var(--muted); border-bottom: 2px solid var(--line); text-align: left; font-size: 11px; letter-spacing: 1px; text-transform: uppercase; }
        td { padding: 16px 14px; border-bottom: 1px solid var(--line); }
        tbody tr:hover { background: #fbfcfe; }
        .empty { color: var(--muted); text-align: center; }
        .site-footer { width: min(1180px, calc(100% - 40px)); margin: 54px auto 0; padding: 28px 0 32px; border-top: 1px solid var(--line); display: flex; justify-content: space-between; gap: 28px; color: var(--muted); font: 13px/1.6 Arial, sans-serif; }
        .site-footer strong { color: var(--ink); }
        .footer-label { margin-bottom: 5px; color: var(--accent-dark); font-size: 10px; font-weight: 700; letter-spacing: 1.4px; text-transform: uppercase; }
        @media (max-width: 760px) { .nav, main, .site-footer { width: min(100% - 28px, 560px); } .nav-note { display: none; } .hero { padding: 48px 14px 70px; } h1 { font-size: 46px; } .workspace { grid-template-columns: 1fr; } .form-panel, .table-panel { padding: 24px; } .site-footer { display: block; } .site-footer > div + div { margin-top: 18px; } }
    </style>
</head>
<body>
<%
    String name = request.getParameter("studentName");
    String email = request.getParameter("email");
    String course = request.getParameter("course");

    List<Student> students = (List<Student>) application.getAttribute("studentList");
    if (students == null) {
        students = Collections.synchronizedList(new java.util.ArrayList<Student>());
        application.setAttribute("studentList", students);
    }

    if (name != null && email != null && course != null) {
        students.add(new Student(name, email, course));
    }
%>
<header class="site-header">
    <nav class="nav" aria-label="Primary navigation">
        <a class="brand" href="registration.jsp"><span class="brand-mark">S</span><span><strong>StudentHub</strong><small>Registration portal</small></span></a>
        <span class="nav-note"><a href="/jsp-vs-servlet-tradeoff/" style="color:#c8d1df;text-decoration:none">Portal home</a> · JSP implementation · Spring intake 2026</span>
    </nav>
</header>
<section class="hero">
    <div class="hero-inner"><div class="eyebrow">Student success starts here</div><h1>Build your next chapter.</h1><p>A focused registration workspace for keeping student information organized, clear and ready for the next opportunity.</p></div>
</section>
<main>
<div class="workspace">
    <section class="panel form-panel" aria-labelledby="registration-title">
        <div class="panel-kicker">New entry</div><h2 id="registration-title">Register a student</h2><p class="intro">Add a student to the active enrollment list. All fields are required.</p>
    <form action="registration.jsp" method="POST">
        <label for="studentName">Student name</label><input id="studentName" type="text" name="studentName" placeholder="e.g. Aanya Sharma" required>
        <label for="email">Email address</label><input id="email" type="email" name="email" placeholder="student@example.com" required>
        <label for="course">Enrolled course</label><input id="course" type="text" name="course" placeholder="e.g. Computer Science" required>
        <button class="submit" type="submit">Add to student list &rarr;</button>
    </form>
    </section>
    <section class="panel table-panel" aria-labelledby="students-title">
        <div class="table-heading"><div><div class="panel-kicker">Live directory</div><h2 id="students-title">Registered students</h2><p class="intro">A quick view of the current enrollment records.</p></div><span class="count"><%= students.size() %></span></div>
    <div class="table-wrap"><table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
        </tr>
        <% if (students.isEmpty()) { %>
            <tr><td class="empty" colspan="3">No students registered yet.</td></tr>
        <% } else { 
            for (Student s : students) { %>
            <tr>
                <td><%= escapeHtml(s.getName()) %></td>
                <td><%= escapeHtml(s.getEmail()) %></td>
                <td><%= escapeHtml(s.getCourse()) %></td>
            </tr>
        <%  } 
           } %>
    </table></div></section>
</div>
</main>
<footer class="site-footer"><div><div class="footer-label">StudentHub</div><strong>Simple tools for meaningful learning.</strong><br>Built for the JSP vs Servlet peer-review project.</div><div><div class="footer-label">Developer</div><strong>Nitish Dubey</strong><br>Registration No: 251fd01003<br><a href="mailto:dubeynitish1308@gmail.com">dubeynitish1308@gmail.com</a></div></footer>
</body>
</html>
<%!
    private String escapeHtml(String value) {
        return value.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>