<%-- 
    Document   : index , main
    Created on : 29.06.2014, 09:45:59
    Author     : MaHi
    Version    : 0.1 - 29.06.2014 - Initialisierung 
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%-- Import Class to access via EL --%>
<jsp:useBean id="service" scope="page" class="org.mhi.persistence.ImgService" />

<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/main.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/typografie.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/input.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/listen.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/form-admin.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/font-awesome-4.0.3/css/font-awesome.css"> 

        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.js" ></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/jquery.validate.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/upload_cat.js" ></script> 
    </jsp:attribute>  
    <jsp:body>
        <main>
            <h3>Neue Kategorie anlegen</h3>
            <hr/>
            <form action="${pageContext.servletContext.contextPath}/admin/category/create" enctype="multipart/form-data" method="POST">
                <select name="gallery" onchange="this.className = this.options[this.selectedIndex].className" class="light" required>
                    <option selected>Gallery wählen</option>
                    <c:forEach items="${service.imageGalleries}" var="gal">
                        <option class="dark" value="${gal.imgGalleryID}">${gal.name}</option>
                    </c:forEach>
                </select>
                <input type="button" name="add" value="Bild hinzufügen">
                <!-- The file uploads will be shown here -->
                <div id="prevUpload"></div>
                <div id="uploadMessage"></div>
                <input id="fileInput" type="file" name="files" required/>
                <input type="text" size="20" name="newCategory" placeholder="Neue Kategorie" required>
                <input type="text" size="55" name="newDescription" placeholder="Beschreibung" required>
                <input type="submit" name="upload" value="speichern">  
            </form>
            <script>
                $(document).ready(function() {
                    /* ToDo image is Reserved Word */
                    // Own Rule
                    $.validator.addMethod("valueNotEquals", function(value, element, arg) {
                        return arg !== value;
                    }, "Value must not equal arg.");

                    $("form").validate({
                        // Ignore for Hidden Fields
                        ignore: [],
                        // All Image Files Possible
                        rules: {
                            files: {
                                required: true,
                                extension: "png|jpe?g|gif"
                            },
                            gallery: {
                                valueNotEquals: "Gallery wählen"
                            }
                        }, 
                        errorPlacement: function(error,element) {
                            if (element.attr("name") === "files"){
                                $("input[name='add']").addClass("error");
                            }else{
                                return false;
                            }
                        }
                    });
                });
            </script>
            <h3>Übersicht aller Kategorien</h3>
            <c:choose>
                <c:when test="${not empty service.imageCategories}">
                    <p class="intro">Achtung! Beim löschen einer Kategorie werden alle zugeordneten Bilder gelöscht.</p>
                    <hr/>
                    <table class="output">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Beschreibung</th>
                                <th class="center">Löschen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${service.imageCategories}" var="cat">
                                <tr>
                                    <td>${cat.name}</td>
                                    <td>${cat.description}</td>
                                    <td class="center"><a href="${pageContext.servletContext.contextPath}/admin/category/delete?id=${cat.imgCatID}"><i class="fa fa-times-circle"/></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p>Keine Kategorie vorhanden.</p>
                </c:otherwise>
            </c:choose>
            <p>&nbsp;</p>
        </main> 
    </jsp:body>
</t:genericPage>

