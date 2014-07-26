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
                                    <h4>Article</h4>
                                    <a href="#"><li>schreiben</li></a>
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
                        <div>
                            <h1>Titel der Page</h1>
                            <h2>Subtitle of Page</h2>
                            <p class='Autor'>Max Mustermann</p>
                            <p>Musterstr.111 , 1231 Musterhausen</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </header>
            <%-- Navigation --%>            
            <nav>
                <ul>
                    <a href="${pageContext.servletContext.contextPath}/index.jsp"><li>Start</li></a>
                    <a href="#"><li>About</li></a>
                    <a href="${pageContext.servletContext.contextPath}/gallery"><li>Gallery</li></a>
                    <a href="#"><li>Workshop</li></a>
                    <a href="#"><li>Contact</li></a>
                </ul>
            </nav></div>
            <jsp:invoke fragment="header"/>
            <jsp:doBody/>
        <footer>
            <div>
                <p><a href="#">Impressum</a></p>
                <p> Copyright All Rights reserverd.</p>
            </div> 
        </footer>
        <jsp:invoke fragment="footer"/>
    </body>
</html>