<%-- 
    Document   : index , main
    Created on : 29.06.2014, 09:45:59
    Author     : MaHi
    Version    : 0.1 - 29.06.2014 - Initialisierung 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css" />"> 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/typografie.css" />"> 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/gridrotator/custom.grid.css" />"  >

        <script type="text/javascript" src="<c:url value="/js/lib/jquery.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/js/lib/modernizr.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/js/lib/jquery.gridrotator.js" />" ></script>

        <noscript>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/gridrotator/custom.gridnojs.css" />"> 
        </noscript>
    </jsp:attribute>
    <jsp:body>
        <main>
            <section class='pix400 blue'>
                <h2>Hello I am Heading</h2>
                <p class='intro light'> Hello i am Subtext <span> 11.04.2007</span> <span>Stat Haris</span></p>
                <div id="ri-grid" class="ri-grid" >
                    <img class="ri-loading-image" src="<c:url value="images/system/loading.gif" />"/>
                    <ul> 
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/1.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/2.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/3.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/4.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/5.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/6.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/7.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/8.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/9.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/10.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/11.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/12.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/13.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/14.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/15.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/16.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/17.jpg" />"/></a></li>
                        <li><a href="http://www.google.de"><img src="<c:url value="images/gridrotator/18.jpg" />"/></a></li>
                    </ul>
                </div> 
            </section>
            <section class='pix400 borderLeft'>
                <h3>Fusing</h3>
                <p class="intro light">12.04.2014</p>
                <p> Glasfusing das Zusammenschmelzen verschiedener Glasstücke im Spezialofen [..]</p> 
                <h3>Fancy Glasschalen</h3><p class="intro light">12.07.2014</p>
                <p> Neue Glasschalen in neuer Formtechnik erstellt, die herrausragende [..]</p> 
            </section>
        </main>  
        <script type="text/javascript" >
            $(function() {

                $('#ri-grid').gridrotator({
                    rows: 3,
                    columns: 3,
                    animType: 'fadeInOut', // "random" möglich
                    animSpeed: 1500, // Animation-speed 1,5s
                    interval: 3500, // Intervall for automatic change 3,5s
                    onhover: true,
                    slideshow: true
                });

            });
        </script>
    </jsp:body>
</t:genericPage>

