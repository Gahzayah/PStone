<%-- 
    Document   : index , main
    Created on : 29.06.2014, 09:45:59
    Author     : MaHi
    Version    : 0.1 - 29.06.2014 - Initialisierung 
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%-- Import Class to access via EL --%>
<jsp:useBean id="service" scope="page" class="org.mhi.persistence.ImgService" />

<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/main.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/typografie.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/input.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/form-admin.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome-4.0.3/css/font-awesome.css"> 

        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.js" ></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery-ui.js" ></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.fileupload.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/upload.js" ></script> 

    </jsp:attribute>  
    <jsp:body>
        <main>
            <h2>Bilder hochladen</h2>
            <hr/>
            <form id="upload" enctype="multipart/form-data" method="POST"> 
                <%-- Image Categorie auswählen --%>
                <select name="category">
                    <c:forEach items="${service.imageCategories}" var="cat">
                        <option value="${cat.imgCatID}">${cat.name}</option>
                    </c:forEach>
                </select>
                <br/><br/>
                <%-- Images hinzufügen --%>
                <input type="button" name="add" value="add">
                <input type="button" name="upload"  value="upload">
                <input type="file" name="files" multiple/>
                <div id="prevUpload">
                    <!-- The file uploads will be shown here -->
                </div>
                <div id="uploadMessage"></div>
            </form>
        </main> 
    </jsp:body>
</t:genericPage>

