<%-- 
    Document   : gallery
    Created on : 03.07.2014, 04:08:10
    Author     : MaHi
--%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="service" scope="page" class="org.mhi.persistence.ImgService" />


<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/typografie.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/gallery.css"/>" >
    </jsp:attribute>
    <jsp:body>
        <main>
            <section>
            <h3>Gallery</h3>
            <hr>
            </section>
            <section class='pix200'>
                <ul class="gallery-nav">
                    <%-- Gallery-Liste--%>
                    <c:forEach items="${requestScope.GalleryList}" var="gallery">
                        <a href="<c:url value="/gallery?id=${gallery.imgGalleryID}"/>"><h4>${gallery.name}</h4></a>
                        <%-- Kategorie-Liste--%>
                        <c:forEach items="${requestScope.CatByGalID}" var="cat">
                            <c:if test="${cat.gallery.name == gallery.name}"> 
                                <a href="<c:url value="/gallery/${cat.name}?id=${cat.imgCatID}"/>"><li>${cat.name}</li> </a>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </ul>
            </section>
            <section class='pix600 borderLefto'>
                <%-- Kategorie-Objekte--%>
                <c:forEach items="${requestScope.CatByGalID}" var="cat">
                    <div class="gallery">
                        <div class="pix95">
                            <img src="<c:url value="/gallery/${cat.name}?imgCat=${cat.imgCatID}"/>" alt="${cat.name}" title="${cat.description}"/>
                        </div>
                        <div class="pix200 galleryinfo">
                            <a href="<c:url value="/gallery/${cat.name}?id=${cat.imgCatID}"/>"><h4>${cat.name}</h4></a>
                            <p>${fn:length(cat.images)}&nbsp;Photos</p>
                        </div>
                    </div>
                </c:forEach>            
            </section>
        </main> 
    </jsp:body>
</t:genericPage>
  