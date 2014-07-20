<%-- 
    Document   : gallery
    Created on : 03.07.2014, 04:08:10
    Author     : MaHi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>

<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="css/main.css"> 
        <link rel="stylesheet" type="text/css" href="css/typografie.css"> 
        <link rel="stylesheet" type="text/css" href="css/gallery.css">
    </jsp:attribute>
    <jsp:body>
        <main>
            <section class='pix200'>
                <ul>
                    <h3>Objekte</h3>
                    <h3>Workshops</h3>
                </ul>
            </section>
            <section class='pix600 borderLefto'>
                <div class="gallery">
                    <div class="pix95">
                        <img src="${pageContext.servletContext.contextPath}/images/gridrotator/1.jpg" alt="bild.bild" title="Titel für diesen Qua"/>
                    </div>
                    <div class="pix200 galleryinfo">
                        <h4>Gallery</h4>
                        <p >15 Photos</p>
                        <p >2x angesehen</p>
                    </div>
                </div>
                <div class="gallery">
                    <div class="pix95">
                        <img src="${pageContext.servletContext.contextPath}/images/gridrotator/2.jpg" alt="bild.bild" title="Titel für diesen Qua"/>
                    </div>
                    <div class="pix200 galleryinfo">
                        <h4>Galleryname</h4>
                        <p>13 Photos</p>
                        <p>12x views</p>
                    </div>
                </div>   
                <div class="gallery">
                    <div class="pix95">
                        <img src="${pageContext.servletContext.contextPath}/images/gridrotator/3.jpg" alt="bild.bild" title="Titel für diesen Qua"/>
                    </div>
                    <div class="pix200 galleryinfo">
                        <h4>Galleryname</h4>
                        <p>13 Photos</p>
                        <p>12x views</p>
                    </div>
                </div> 
                <div class="gallery">
                    <div class="pix95">
                        <img src="${pageContext.servletContext.contextPath}/images/gridrotator/4.jpg" alt="bild.bild" title="Titel für diesen Qua"/>
                    </div>
                    <div class="pix200 galleryinfo">
                        <h4>Galleryname</h4>
                        <p>13 Photos</p>
                        <p>12x views</p>
                    </div>
                </div> 
                <div class="gallery">
                    <div class="pix95">
                        <img src="${pageContext.servletContext.contextPath}/images/gridrotator/5.jpg" alt="bild.bild" title="Titel für diesen Qua"/>
                    </div>
                    <div class="pix200 galleryinfo">
                        <h4>Galleryname</h4>
                        <p>13 Photos</p>
                        <p>12x views</p>
                    </div>
                </div> 
            </section>
        </main>  
    </jsp:body>
</t:genericPage>
