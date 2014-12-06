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
<jsp:useBean id="galx" scope="page" class="org.mhi.database.ServiceQuery" />

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
                    <c:forEach items="${galx.galleryList}" var="gal">
                        <option class="dark" value="${gal.imgGalleryID}">${gal.name}</option>
                    </c:forEach>
                </select>
                <input type="button" name="add" value="Bild hinzufügen">
                <!-- The file uploads will be shown here -->
                <div id="prevUpload"></div>
                <input id="fileInput" type="file" name="files" required/>
                <label for="newCategory">Neue Kategorie</label>
                <input type="text"  name="newCategory" required>
                <label for="newDescription">Beschreibung</label>
                <input type="text" name="newDescription"  required>
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
                        errorPlacement: function(error, element) {
                            if (element.attr("name") === "files") {
                                $("input[name='add']").addClass("error");
                            } else {
                                return false;
                            }
                        }
                    });
                });
            </script>
            <hr>
            <h3>Übersicht aller Kategorien</h3>
            <c:choose>
                <c:when test="${not empty galx.categoryList}">
                    <p class="intro">Achtung! Beim löschen einer Kategorie werden alle zugeordneten Bilder gelöscht.</p>
                    <hr/>
                    <table class="output">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Beschreibung</th>
                                <th>Gallerie</th>
                                <th class="center">Löschen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${galx.categoryList}" var="cat">
                                <tr>
                                    <td>${cat.name}</td>
                                    <td>${cat.description}</td>
                                    <td>${cat.gallery.name}</td>
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

