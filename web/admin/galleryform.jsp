<%-- 
    Document   : index , main
    Created on : 29.06.2014, 09:45:59
    Author     : MaHi
    Version    : 0.1 - 29.06.2014 - Initialisierung 
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%-- Import Class to access via EL --%>
<jsp:useBean id="service" scope="page" class="org.mhi.persistence.ImgService" />

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
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/upload.js" ></script> 

    </jsp:attribute>  
    <jsp:body>
        <main>
            <h3>Übersicht aller Gallerien</h3>
            <c:choose>
                <c:when test="${not empty service.imageGalleries}">
                    <p class="intro">Achtung! Beim löschen einer Gallerie werden alle zugeordneten Kategorie sowie deren Bilder gelöscht.</p>
                    <table class="output">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Beschreibung</th>
                                <th>Erstellt am</th>
                                <th class="center">Löschen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${service.imageGalleries}" var="gal">
                                <tr><td>${gal.name}</td>
                                    <td>${gal.description}</td>
                                    <td>${gal.timestmp}</td>
                                    <td class="center"><a href="${pageContext.servletContext.contextPath}/admin/gallery/delete?id=${gal.imgGalleryID}"><i class="fa fa-times-circle"/></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p>Keine Gallery vorhanden.</p>
                </c:otherwise>
            </c:choose>

            <h3>Gallerie anlegen</h3>
            <hr/>
            <form action="${pageContext.servletContext.contextPath}/admin/gallery/create" enctype="multipart/form-data" method="POST">
                <input type="text" name="newGallery" placeholder="Neue Gallery" size="20">
                <input type="text" name="newDescription" placeholder="Beschreibung" size="55">
                <input type="submit" name="commit" value="speichern">
            </form>
        </main> 
    </jsp:body>
</t:genericPage>

