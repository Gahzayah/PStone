<%-- 
    Document   : gallery
    Created on : 03.07.2014, 04:08:10
    Author     : MaHi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/typografie.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/input.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/contact.css"/>" >
    </jsp:attribute>
    <jsp:body>
        <main>
            <section>
                <h3>Kontakt</h3>
                <hr>
            </section>
            <section>
            <p>Falls du Unterstützung benötigst, die gesuchten Informationen nicht findest oder einen Fehler entdeckt hast.
                Falls du Informationen zu einzelnen Austellungsstücken hast, Fragen zu Workshops und Terminen.
            </p>  
            <h3>Kontaktieren sie mich!</h3>
            <hr>
            <form>
                <input type="text" name="Name" size="25" placeholder="Name" required>
                <input type="email" name="Email" size="25" placeholder="meine@email.ch" required>
                <textarea title="Nachricht" rows="10" cols="35" placeholder="Schreiben sie ihre Nachricht..." required ></textarea>
                <input type="submit" name="submit" >
            </form>
            </section>
        </main> 
    </jsp:body>
</t:genericPage>
