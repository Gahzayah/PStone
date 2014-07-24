<%-- 
    Document   : gallery
    Created on : 03.07.2014, 04:08:10
    Author     : MaHi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="service" scope="page" class="org.mhi.persistence.ImgService" />

<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/main.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/typografie.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/gallery.css">
    </jsp:attribute>
    <jsp:body>
        <main>
            <section class='pix200'>
                <ul>
                    <c:choose>
                        <c:when test="${not empty service.imageGalleries}">
                            <c:forEach items="${service.imageGalleries}" var="gal">
                                <a href="${pageContext.servletContext.contextPath}/gallery/category?id=${gal.imgGalleryID}"><h3>${gal.name}</h3></a>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3>(Leer)</h3>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </section>
            <section class='pix600 borderLefto'>
                <c:choose>
                    <c:when test="${not empty requestScope.CatByGalID}">
                        <c:forEach items="${requestScope.CatByGalID}" var="cat">
                            <div class="gallery">
                                <div class="pix95">
                                    <img src="${pageContext.servletContext.contextPath}/gallery/image?id=${cat.imgCatID}" alt="${cat.name}" title="${cat.description}"/>
                                </div>
                                <div class="pix200 galleryinfo">
                                    <a href="#"><h4>${cat.name}</h4></a>
                                    <p >15 Photos</p>
                                    <p >2x angesehen</p>
                                </div>
                            </div>
                        </c:forEach> 
                    </c:when>
                    <c:otherwise>
                        <div class="gallery">
                            <div class="pix95">
                                <img src="${pageContext.servletContext.contextPath}/images/gridrotator/1.jpg" alt="bild.bild" title="Titel für diesen Qua"/>
                            </div>
                            <div class="pix200 galleryinfo">
                                <h4>Keine Category vorhanden</h4>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>            
            </section>
        </main>  
    </jsp:body>
</t:genericPage>
