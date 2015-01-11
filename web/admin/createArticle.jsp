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
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.validate.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/tinymce/tinymce.min.js"></script>
        <script type="text/javascript">
            tinymce.init({
                selector: "textarea"
            });
        </script>

    </jsp:attribute>  
    <jsp:body>
        <main>
            <h2>Artikel schreiben und einer Gruppe zuordnen.</h2>
            <hr/>
            <form action="${pageContext.servletContext.contextPath}/admin/article/action?create=article" enctype="multipart/form-data" method="POST">
                <select name="selectCategory" onchange="this.className = this.options[this.selectedIndex].className" class="light" required>
                    <option selected>Untergruppe wählen</option>
                    <c:forEach items="${galx.catAList}" var="cat">
                        <option class="dark" value="${cat.artCatID}">${cat.name}</option>
                    </c:forEach>
                </select>
                <div class="checkbox"><input type="checkbox" name="osp" id="nur"><label for="nur">Nur Auf Startseite anzeigen</label></div>
                <div class="checkbox"><input type="checkbox" name="wsp" id="mit"><label for="mit">Mit Auf Startseite anzeigen</label></div>
                <input type="text" name="title" placeholder="Titel für diesen Artikel" />
                <textarea name="article">Meine Textarea</textarea>
                <hr/>
                <input type="checkbox" class="checkbox" name="startpage" value="2"/>
                <input type="submit" name="commit" value="speichern">
            </form>
        </main>
    </jsp:body>
</t:genericPage>

