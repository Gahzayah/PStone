<%-- 
    Document   : gallery
    Created on : 03.07.2014, 04:08:10
    Author     : MaHi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="about" scope="page" class="org.mhi.database.ServiceQuery" />


<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/typografie.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/input.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/contact.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/about.css"/>" >
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/lib/tinymce/tinymce.min.js"></script>
                <script type="text/javascript">
            tinymce.init({
                selector: "textarea"
            });
            var content = null;
            
            function setData(data){
                this.content = data;
            }
            
            function setContent(){
                tinyMCE.get('article').setContent(content);
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <main>
            <section>
                <h3>About</h3>
                <hr>
            </section>
            <c:choose>
                <c:when test="${not empty requestScope.firstArticle}" >
                    <section class="pix600">
                        <h2>${requestScope.firstArticle.titel}</h2>
                        ${requestScope.firstArticle.text}
                    </section>
                </c:when>
                <c:otherwise>
                    <section class="pix600">
                        <h2>${requestScope.selectArticle.titel}</h2>
                        <%-- Article Inhalt --%>
                        ${requestScope.selectArticle.text}
                        <%-- Edit Inhalt im Admin-Mode --%>
                        <c:if test="${sessionScope.isAuthenticated}">
                            <%-- Lade Inhalt ---%>
                            <form action="${pageContext.servletContext.contextPath}/admin/article/action?update=${requestScope.selectArticle.articleID}" enctype="multipart/form-data" method="POST">
                                <textarea name="article">${requestScope.selectArticle.text}</textarea>
                                <input type="submit" value="speichern"/>  
                            </form>
                        </c:if>
                    </section>
                </c:otherwise>
            </c:choose>
            <%-- Jede Gruppe ausgeben ausser 'Administration" - Gruppe --%>
            <section class="pix200 abnav">
                <ul>
                    <c:forEach items="${about.groupList}" var="grp">
                        <c:if test="${grp.name != 'Administration'}">
                            <h3>${grp.name}</h3>
                            <c:forEach items="${about.catAList}" var="cat">
                                <c:if test="${grp.name == cat.main.name}">
                                    <a href="<c:url value="/about/${cat.name}?id=${cat.artCatID}"/>"><li>${cat.name}</li></a>

                                        </c:if>
                                    </c:forEach>
                            <hr />
                        </c:if>
                    </c:forEach>
                </ul>
            </section>
        </main> 
    </jsp:body>
</t:genericPage>
