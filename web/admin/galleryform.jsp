<%-- 
    Document   : index , main
    Created on : 29.06.2014, 09:45:59
    Author     : MaHi
    Version    : 0.1 - 29.06.2014 - Initialisierung 
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.validate.js"></script>


    </jsp:attribute>  
    <jsp:body>
        <main>
            <h2>Gallerie anlegen</h2>
            <hr/>
            <form action="${pageContext.servletContext.contextPath}/admin/gallery/create" enctype="multipart/form-data" method="POST">
                <input type="text" name="newGallery" placeholder="Neue Gallery" size="20" required>
                <input type="text" name="newDescription" placeholder="Beschreibung" size="55" required>
                <input type="submit" name="commit" value="speichern">
            </form>
            <script>
                $(document).ready(function() {
                    $("form").validate({
                        errorPlacement: function() {
                            /* Max 14 Charakters newGallery */
                            return false;
                        }
                    });
                });
            </script>
            <h3>Alle erstellten Gallerien</h3>
            <c:choose>
                <c:when test="${not empty service.imageGalleries}">
                    <p class="warning">Achtung! Beim löschen einer Gallerie werden alle zugeordneten Kategorie sowie deren Bilder gelöscht.</p>
                    <table class="output">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Beschreibung</th>
                                <th class="center">Löschen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${service.imageGalleries}" var="gal">
                                <tr><td><b>${gal.name}</b></td>
                                    <td>${gal.description}</td>
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
        </main> 
    </jsp:body>
</t:genericPage>

