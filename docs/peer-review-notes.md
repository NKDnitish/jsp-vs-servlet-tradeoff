# Peer Review & Comparison Analysis

## 1. Code Readability
- **Servlet:** Extremely hard to read. Combining HTML tags (`<div>`, `<table>`) inside Java string quotes `out.println("")` leads to syntax errors and bad formatting.
- **JSP:** Easy to read. HTML code remains native, making CSS styling and template design straightforward. This example uses scriptlets rather than EL/JSTL so the dynamic-content mechanism remains easy to compare with the servlet version.

## 2. Maintainability
- **Servlet:** Changing even a single CSS property requires re-compiling the `.java` class file using `javac`.
- **JSP:** Frontend changes can be done directly inside `.jsp`; the container translates and compiles the JSP on its first request.

## 3. Compilation & Lifecycle
- **Servlet Pipeline:** `Source Code (.java)` ➔ `javac` ➔ `Bytecode (.class)` ➔ `Run`
- **JSP Pipeline:** `JSP Page (.jsp)` ➔ `Translation to Java Servlet` ➔ `javac` ➔ `Bytecode (.class)` ➔ `Run`
  *(JSP has a translation overhead during its first request execution.)*

## Review Verdict

Both implementations render the same student registration workflow and retain registrations in memory for the lifetime of the application. The servlet is a better fit for request handling and routing, while the JSP is easier to read and update when the primary concern is HTML presentation. Neither implementation uses a database, authentication, or production-grade validation; those are intentionally outside this comparison.