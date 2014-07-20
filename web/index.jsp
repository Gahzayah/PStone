<%-- 
    Document   : index , main
    Created on : 29.06.2014, 09:45:59
    Author     : MaHi
    Version    : 0.1 - 29.06.2014 - Initialisierung 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>

<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/main.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/typografie.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/gridrotator/custom.grid.css"  >

        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.js" ></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/modernizr.js" ></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.gridrotator.js" ></script>

        <noscript>
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/gridrotator/custom.gridnojs.css"> 
        </noscript>
    </jsp:attribute>
    <jsp:body>
        <main>
            <section class='pix400 blue'>
                <h2>Hello I am Heading</h2>
                <p class='intro'> Hello i am Subtext <span> 11.04.2007</span> <span>Stat Haris</span></p>
        <!--        <div id="ri-grid" class="ri-grid" >
                    <img class="ri-loading-image" src="/images/system/loading.gif"/>
                    <ul>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/1.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/2.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/3.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/4.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/5.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/6.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/7.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/8.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/9.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/10.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/11.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/12.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/13.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/14.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/15.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/16.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/17.jpg"/></a></li>
                        <li><a href="http://www.google.de"><img src="/images/gridrotator/18.jpg"/></a></li>
                    </ul>
              </div>-->  
            </section>
            <section class='pix400 borderLeft'>
                <h3>Hello I am Heading</h3>
                <p class="intro">12.04.2014</p>
                <p> At daybreak the wind began to blow hard again, and the heavens seemed to predict a gale. more [..]</p> 
                <h3>Hello I am Heading</h3><p class="intro">12.04.2014</p>
                <p> At daybreak the wind began to blow hard again, and the heavens seemed to predict a gale. more [..]</p> 
                <h3>Hello I am Heading</h3><p class="intro">12.04.2014</p>
                <p> At daybreak the wind began to blow hard again, and the heavens seemed to predict a gale. more [..]</p> 
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
                    slideshow : true 
                });

            });
        </script>
    </jsp:body>
</t:genericPage>

