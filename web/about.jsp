<%-- 
    Document   : gallery
    Created on : 03.07.2014, 04:08:10
    Author     : MaHi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="service" scope="page" class="org.mhi.database.ServiceQuery" />


<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/typografie.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/input.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/contact.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/about.css"/>" >
    </jsp:attribute>
    <jsp:body>
        <main>
            <section>
                <h3>About</h3>
                <hr>
            </section>
            <section class="pix600">
                <h2>Fusing</h2>
                <p class="intro">
                   Glasfusing das Zusammenschmelzen verschiedener Glasstücke im Spezialofen, ist eine seit 200 v. Ch. bekannte Technik. 
                </p>
                <p>
                  Schon damals wurden Glasstangen zu Schalen verschmolzen. Die Beschäftigung mit Glas als kunsthandwerklichem Material allerdings, kam erst sehr viel später. In den letzten Jahrzehnten wurde das Verfahren weiterentwickelt und um neue Möglichkeiten bereichert. Hinter dieser Technik verbirgt sich nicht nur der Schmelzvorgang von Glasstücken als erster sondern auch das Formen der Glasstücke als zweiter Arbeitsschritt.  
                </p>
            </section>
            <section class="pix200 abnav">
                <ul>
                    <h3>Übermich</h3>
                    <a href="#"><li>Barbara Steiner</li></a>
                    <hr>
                    <h3>Werkstatt</h3>
                    <a href="#"><li>Fusing</li></a>
                    <a href="#"><li>Brennvorgang</li></a>
                    <a href="#"><li>Verformung</li></a>
                    <hr>
                    <h3>Partner</h3>
                    <a href="#"><li>Jochen Eilert</li></a>
                    <a href="#"><li>Fiona Ransom</li></a>
                    <hr>
                    <h3>Austellungen</h3>
                    <a href="#"><li>Festival Romont</li></a>
                </ul>
            </section>
        </main> 
    </jsp:body>
</t:genericPage>
