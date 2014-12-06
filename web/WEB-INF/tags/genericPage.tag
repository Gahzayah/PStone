<%-- 
    Document   : genericPage
    Created on : 29.06.2014, 09:06:23
    Author     : MaHi
    Version    : 0.1 - 29.06.2014 - Initialisierung 
--%>

<%@tag description="Generic Template" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@attribute name="titlepage"%>                     <%-- Be Careful to get Conflict JavaBeans capitalization rules - TitlePage will not work --%>
<%@attribute name="head" fragment="true" %>         <%-- fragment attributes - Standartmässige werden die Aufrufe  durch <jsp:invoke> direkt in den Response geschrieben --%>       
<%@attribute name="header" fragment="true" %>       <%-- Alternativ kann der Output des Fragments in eine Variable gespeichert werden. Dazu wird muss das var-Attribut von <jsp:invoke> gesetzt werden. --%>     
<%@attribute name="footer" fragment="true" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <%-- Titel der Seite --%>
        <title>${titlepage}</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%-- Suchmaschinen Configuration --%>
        <meta name="robots" content="noindex, nofollow"/>
        <meta name="google" content="notranslate" />
        <meta name="keywords" content="Glas, Kunst, Herstellung, Fusing, Workshops , Schulung, Objekte , schmelzen , Ofen " />
        <%-- HTTP Status 408 - The time allowed for the login process has been exceeded HAVE TO CHECK http://readlist.com/lists/tomcat.apache.org/users/7/35987.html --%>
        <meta http-equiv="Cache-Control" content="no-store,no-cache,must-revalidate"> 
        <meta http-equiv="Pragma" content="no-cache"> 
        <meta http-equiv="Expires" content="-1"> 
        <link href='http://fonts.googleapis.com/css?family=Swanky+and+Moo+Moo' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>

        <c:choose>
            <c:when test="${sessionScope.isAuthenticated}">
                <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/header-admin.css"> 
                <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome-4.0.3/css/font-awesome.min.css"> 
            </c:when>
            <c:otherwise>
                <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/header.css">   
            </c:otherwise>
        </c:choose>
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/footer.css"> 
        <%-- Specfified new Ressources --%>
        <jsp:invoke fragment="head"/>
    </head>
    <body>
        <div class="wrapper">
            <%-- Titel - Adresse - Kontakt --%>
            <header>
                <%-- Admin-Menü wenn eingeloggt --%>
                <c:choose>
                    <c:when test="${sessionScope.isAuthenticated}">
                        <p class="adminHeader">Administrations-Bereich</p>
                        <section class="adminConsole">
                            <div class="w800">
                                <p style="float:left;">Sie sind eingeloggt als:  <span><c:out value="${sessionScope.User}"/></span></p>  
                                <p style="float:right;"><a href="${pageContext.servletContext.contextPath}/admin/logout">Logout</a>&nbsp;<i class="fa fa-share"></i></p>
                            </div>
                        </section>
                        <div>                       
                            <div class="adminMenu">
                                <ul>
                                    <h4>Bilder verwalten</h4>
                                    <a href="${pageContext.servletContext.contextPath}/admin/gallery"> <li>Gallery bearbeiten</li></a>
                                    <a href="${pageContext.servletContext.contextPath}/admin/category"><li>Kategorien bearbeiten</li></a>
                                    <a href="${pageContext.servletContext.contextPath}/admin/upload">  <li>Bilder hochladen</li></a>
                                </ul>
                                <ul>
                                    <h4>Artikel verwalten</h4>
                                    <a href="${pageContext.servletContext.contextPath}/admin/group"><li>Gruppe bearbeiten</li></a>
                                    <a href="#"><li>durchsuchen</li></a>
                                </ul>
                                <ul>
                                    <h4>Statistik</h4>
                                    <a href="#"><li>Besucher</li></a>
                                </ul>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="shadow">
                            <h1>Stonys Glas</h1>
                            <h2>Glaswerkstatt am See</h2>
                            <div class="AdressContainer">
                            <p class='Autor'>Barbara Steiner</p>
                            <p>Seestr. 52a , 6375 Beckenried</p>
                            </div>
                        </div
                    </c:otherwise>
                </c:choose>
            </header>
            <%-- Navigation --%>            
            <nav>
                <ul>
                    <a href="<c:url value="/index.jsp" />"><li>Start</li></a>
                    <a href="<c:url value="/about.jsp" />"><li>About</li></a>
                    <a href="<c:url value="/gallery" />"><li>Gallery</li></a>
                    <a href="<c:url value="/workshop.jsp" />"><li>Workshop</li></a>
                    <a href="<c:url value="/contact.jsp" />"><li>Contact</li></a>
                </ul>
            </nav></div>
            <jsp:invoke fragment="header"/>
            <jsp:doBody/>
        <footer>
            <div>
                <%-- ToDo --%>
            </div> 
        </footer>
        <jsp:invoke fragment="footer"/>
    </body>
</html>