<%-- 
    Document   : login
    Created on : 25.07.2014, 10:29:21
    Author     : MaHi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>

<head>
    <!-- Basics -->
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/input.css">
</head>

<body style="background: #444">

    <!-- Begin Page Content -->
    <div class="login-container">
       <form method="POST" action="j_security_check">
            <label for="j_username">Username:</label>
            <input type="text" name="j_username" /><br/>
            <label for="j_password">Password:</label>
            <input type="password" name="j_password" />
            <input type="submit" value="Login" />
        </form>
    </div>
    <!-- End Page Content -->

</body>

</html>