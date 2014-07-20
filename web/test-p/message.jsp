<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Upload</title>
    </head>
    <body>
        <h2> ${requestScope.name}</h2>
        <ul>
            <li>Name         = ${requestScope.name}</li>
            <li>Size         = ${requestScope.size}</li>
            <li>ContentType  = ${requestScope.contenttype}</li>
            <li>Header         = ${requestScope.header}</li>
            <li>HeaderNames         = ${requestScope.headernames}</li>
            <li>Requested Url   = ${requestScope.requesturl}      </li>
            <li>servletpath   = ${requestScope.servletpath}      </li>
        </ul>
        <h2>${requestScope.message2}</h2>
    </body>
</html>

