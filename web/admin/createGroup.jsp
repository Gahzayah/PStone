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


    </jsp:attribute>  
    <jsp:body>
        <main>
            <h2>Gruppe anlegen</h2>
            <hr/>
            <form action="${pageContext.servletContext.contextPath}/admin/group/action?create=group" enctype="multipart/form-data" method="POST">
                <input type="text" name="group" placeholder="Neue Gruppe" size="20" required>
                <input type="submit" name="commit" value="speichern">
            </form>
            <h3>Alle erstellten Gruppen</h3>
            <c:choose>
                <c:when test="${not empty galx.groupList}">
                    <p class="warning">Achtung! Beim löschen einer Gruppe werden alle zugeordneten Inhalt gelöscht.</p>
                    <table class="output">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Beschreibung</th>
                                <th class="center">Löschen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${galx.groupList}" var="gal">
                                <tr><td><b>${gal.name}</b></td>
                                    <td>Hauptgruppe</td>
                                    <td class="center"><a href="${pageContext.servletContext.contextPath}/admin/group/action?delete=${gal.artMainID}"><i class="fa fa-times-circle"/></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p>Keine Gallery vorhanden.</p>
                </c:otherwise>
            </c:choose>
            <h2>Untergruppe anlegen</h2>
            <hr/>
            <form action="${pageContext.servletContext.contextPath}/admin/group/action?create=ugroup" enctype="multipart/form-data" method="POST">
                <select name="mainGroup" onchange="this.className = this.options[this.selectedIndex].className" class="light" required>
                    <option selected>Gruppe wählen</option>
                    <c:forEach items="${galx.groupList}" var="gal">
                        <option class="dark" value="${gal.artMainID}">${gal.name}</option>
                    </c:forEach>
                </select>
                <input type="text" name="ugroup" placeholder="Neue Untergruppe" size="20" required>
                <input type="submit" name="commit" value="speichern">
            </form>
            <h3>Alle erstellten Untergruppen</h3>
            <c:choose>
                <c:when test="${not empty galx.catAList}">
                    <p class="warning">Achtung! Beim löschen einer Gruppe werden alle zugeordneten Inhalt gelöscht.</p>
                    <table class="output">
                        <thead>
                            <tr>
                                <th>Hauptgruppe</th>
                                <th>Untergruppe</th>
                                <th class="center">Löschen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${galx.catAList}" var="ugal">
                                <tr>
                                    <td>${ugal.main.name}</td>
                                    <td><b>${ugal.name}</b></td>
                                    <td class="center"><a href="${pageContext.servletContext.contextPath}/admin/group/action?delete=${ugal.artCatID}&ugrp=FA43"><i class="fa fa-times-circle"/></a></td>
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

