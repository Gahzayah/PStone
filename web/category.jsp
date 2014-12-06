<%-- 
    Document   : category
    Created on : 26.07.2014, 13:26:28
    Author     : MaHi
--%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="galx" scope="page" class="org.mhi.database.ServiceQuery" />

<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/typografie.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/typografie.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/gallery.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/lightbox/lightbox.css"/>" >
        <link rel="stylesheet"  type="text/css" href="<c:url value="/css/nailthumb/jquery.nailthumb.1.1.css"/>" />
        <script type="text/javascript" src="<c:url value="/js/lib/jquery.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/lib/jquery.nailthumb.1.1.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/lightbox.js"/>"></script>
        <script type="text/javascript">
        jQuery(document).ready(function() {
            jQuery('.nailthumb-container').nailthumb();
        });
        </script>
        <style type="text/css" media="screen">
        .square-thumb {
            display: inline-block;
            width: 120px;
            height: 120px;
            margin-right: 10px;
        }
        </style>
    </jsp:attribute>
    <jsp:body>
        <main>
             <section>
                <h3>Gallery</h3>
                <hr>
            </section>
            <section class='pix200'>
                <ul class="gallery-nav">
                    <%-- Ebene 1 - Galleryliste--%>
                    <c:forEach items="${galx.galleryList}" var="gallery">
                        <a href="<c:url value="/gallery?id=${gallery.imgGalleryID}"/>"><h4>${gallery.name}</h4></a>
                            <%-- Ebene 2 - Kategorieliste--%>                        
                            <c:forEach items="${requestScope.servxGallery}" var="cat">
                                    <c:if test="${cat.gallery.name == gallery.name}"> 
                                        <%-- Leere Kategorieliste behandeln --%>
                                        <c:choose>
                                            <c:when test="${fn:length(cat.images) < 1}">
                                                <a href="#" class="zero"><li>${cat.name}</li></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="<c:url value="/gallery/${cat.name}?id=${cat.imgCatID}"/>"><li>${cat.name}</li> </a> 
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                            </c:forEach>
                    </c:forEach>
                </ul>              
            </section>
            <section class='pix600 borderLefto'>
                <%-- Kategorie-Images--%>
                <c:forEach items="${requestScope.imagesByCat}" var="img">
                    <div class="nailthumb-container square-thumb">
                        <a href="<c:url value="/gallery/${img.category.name}?img=${img.imageID}"/>" data-lightbox="${img.category.name}" data-title="${img.description}" class="link-image">
                            <img src="<c:url value="/gallery/${img.category.name}?img=${img.imageID}"/>" alt="${img.name}" title="${img.description}" />
                        </a>
                    </div>
                </c:forEach>            
            </section>
        </main> 
    </jsp:body>
</t:genericPage>
