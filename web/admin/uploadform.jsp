<%-- 
    Document   : index , main
    Created on : 29.06.2014, 09:45:59
    Author     : MaHi
    Version    : 0.1 - 29.06.2014 - Initialisierung 
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=utf-8" 
        pageEncoding="utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%-- Import Class to access via EL --%>
<jsp:useBean id="galx" scope="page" class="org.mhi.database.ServiceQuery" />

<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/main.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/typografie.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/input.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/listen.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/form-admin.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome-4.0.3/css/font-awesome.css"> 

        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.js" ></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery-ui.js" ></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.fileupload.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/upload_cat_1.js" ></script> 

    </jsp:attribute>  
    <jsp:body>
        <main>
            <h2>Bilder hochladen</h2>
            <hr/>
            <form action="${pageContext.servletContext.contextPath}/admin/images/upload" enctype="multipart/form-data" method="POST"> 
                <%-- Image Categorie auswählen --%>
                <select name="category">
                    <c:forEach items="${galx.categoryList}" var="cat">
                        <option value="${cat.imgCatID}">${cat.name}</option>
                    </c:forEach>
                </select>
                <%-- Images hinzufügen --%>
                <input type="button" name="add" value="Bilder hinzufügen" style="margin-bottom:15px">

                <input id="fileInput" type="file" name="files" />
                <!-- The file uploads will be shown here -->
                <div id="prevUpload"></div>

                <input type="hidden" name="upload"  value="speichern">
            </form>
        </main> 
    </jsp:body>
</t:genericPage>

