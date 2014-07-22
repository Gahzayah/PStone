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
            <h3>Übersicht aller Kategorien</h3>
            <c:choose>
                <c:when test="${not empty service.imageCategories}">
                    <p class="intro">Achtung! Beim löschen einer Kategorie werden alle zugeordneten Bilder gelöscht.</p>
                    <hr/>
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
                            <c:forEach items="${service.imageCategories}" var="cat">
                                <tr><td>${cat.name}</td>
                                    <td>${cat.description}</td>
                                    <td>${cat.timeStmp}</td>
                                    <td class="center"><a href="${pageContext.servletContext.contextPath}/admin/category/delete?id=${cat.imgCatID}"><i class="fa fa-times-circle"/></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p>Keine Kategorie vorhanden.</p>
                </c:otherwise>
            </c:choose>
                      <p>&nbsp;</p>
            <h3>Neue Kategorie anlegen</h3>
            <hr/>
            <form action="${pageContext.servletContext.contextPath}/admin/update" method="POST">
                <select name="gallery">
                    <option selected>Gallery wählen</option>
                    <c:forEach items="${service.imageGalleries}" var="gal">
                        <option value="${gal.imgGalleryID}">${gal.name}</option>
                    </c:forEach>
                </select>
                <input type="text" size="20" name="newCategory" placeholder="Neue Kategorie">
                <input type="text" size="55" name="newCDescription" placeholder="Beschreibung">
                <input type="submit" value="speichern">     
            </form>
        </main> 
    </jsp:body>
</t:genericPage>

