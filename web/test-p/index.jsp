<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--
@autor: Martin Hinrichs
-->
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/base.css">
        <script type="text/javascript" src="js/lib/jquery.js"></script>
        <script type="text/javascript" src="js/lib/jquery-ui.js" ></script>
        <script type="text/javascript" src="js/lib/jquery.fileupload.js" ></script>
        <script type="text/javascript" src="js/lib/jquery.iframe-transport.js" ></script>
        <script type="text/javascript" src="js/upload.js" ></script>

        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    </head>

    <body>

        <div style="width:50% ;margin:0 auto">
            <h2>Headline - Elements</h2>
            <h1>Verdana H1</h1>
            <p>Most pages of continuous prose pulse with a particular vertical rhythm, established by the lines of its main words, sentences, and paragraphs. If a subheading is set in a di?erent size than the rest of the main text, it needs to be o?set in a way that ?ows with the page’s intrinsic rhythm.</p>
            <h2>Verdana H2</h2>
            <p>Most pages of continuous prose pulse with a particular vertical rhythm, established by the lines of its main words, sentences, and paragraphs. If a subheading is set in a di?erent size than the rest of the main text, it needs to be o?set in a way that ?ows with the page’s intrinsic rhythm.</p>
            <h3>Verdana H3</h3>
            <p>Most pages of continuous prose pulse with a particular vertical rhythm, established by the lines of its main words, sentences, and paragraphs. If a subheading is set in a di?erent size than the rest of the main text, it needs to be o?set in a way that ?ows with the page’s intrinsic rhythm.</p>
            <h4>Verdana H4</h4>
            <p>Most pages of continuous prose pulse with a particular vertical rhythm, established by the lines of its main words, sentences, and paragraphs. If a subheading is set in a di?erent size than the rest of the main text, it needs to be o?set in a way that ?ows with the page’s intrinsic rhythm.</p>
            <h5>Verdana H5</h5>
            <p>Most pages of continuous prose pulse with a particular vertical rhythm, established by the lines of its main words, sentences, and paragraphs. If a subheading is set in a di?erent size than the rest of the main text, it needs to be o?set in a way that ?ows with the page’s intrinsic rhythm.</p>
            <h6>Verdana H6</h6>
            <p>Most pages of continuous prose pulse with a particular vertical rhythm, established by the lines of its main words, sentences, and paragraphs. If a subheading is set in a di?erent size than the rest of the main text, it needs to be o?set in a way that ?ows with the page’s intrinsic rhythm.</p>
            <h2>HR-Element</h2>
            <hr>
            <h2>Listen-Element ul</h2>
            <ul>
                <li>Element 1</li>
                <li>Element 2</li>
                <li>Element 3</li>
                <li>Element 1</li>
                <li>Element 2</li>
                <li>Element 3</li>
            </ul>
            <h2>Tabelle</h2>
            <table>
                <thead>
                    <tr>
                        <th>Januar</th>
                        <th>Februar</th>
                        <th>März</th>
                        <th>April</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td>Mike</td>
                        <td>Peter</td>
                        <td>Lucia</td>
                        <td>Anne</td>
                    </tr>
                </tfoot>
                <tbody>
                    <tr>
                        <td>Mike</td>
                        <td>Peter</td>
                        <td>Lucia</td>
                        <td>Anne</td>
                    </tr>
                    <tr>
                        <td>Sieger</td>
                        <td>Verlierer</td>
                        <td>Verlierer</td>
                        <td>Verlierer</td>
                    </tr>
                </tbody>
            </table>
            <div class="warning"><i class="fa fa-exclamation-triangle"></i>Vorsicht , sind dabei von der Kante zu stürzen</div>
            <div class="validate"><i class="fa fa-exclamation-triangle"></i>Sie haben erfolgreich ihre Kredikarten-Daten übertragen</div>
            <div class="error"><i class="fa fa-exclamation-triangle"></i>Der Server ist abgestürzt und vorrübergehend nicht zu erreichen</div>
            <h2>Input Typen</h2>
            <div class="inputblock">
                <br>
                <label for="anmeldung">Füllen sie die Email ab und Schreiben einen Kommentar!</label>
                <form name="anmeldung" action="test.json">
                    <input type="email" name="email" placeholder="deine@email.de">
                    <input type="text" name="text" placeholder="Kommentar">
                    <input type="submit" formaction="test.json" formmethod="GET" value="OK" style="display: inline"><input class="button" style="display: inline" type="submit" formmethod="POST" formaction="test.json" formtarget="_blank" value="NewTab">
                </form> 
                <br>
                <label>File-Upload</label>
                <hr>
                <form id="upload" enctype="multipart/form-data" method="POST"> 
                    <label>Tragen sie eine neue Kategorie ein</label>
                    <input type="text" name="categorie1">
                    <input type="button" name="add" value="add">
                    <input type="hidden" name="upload"  value="upload">
                    <input type="file" name="files" multiple/>
                    <div id="prevUpload">
                        <!-- The file uploads will be shown here -->
                    </div>
                    <div id="uploadMessage"></div>
                </form>
                <div><a href="http://localhost:8084/Sandbox/cate?start=true">Init ImageList & Category</a></div>
                
                <div>
                    <select onchange="location.href='/Sandbox/cate?category=' + this.options[this.selectedIndex].value;">
                        <c:forEach items="${requestScope.category}" var="category">
                            <option value="${category.cat}">${category.cat}</option>
                        </c:forEach>   
                        <option class="select-hr" disabled="disabled">--------------</option>
                        <option value="Neue Kategorie" style="color:green;font-weight: bold">Neue Kategorie (todo) </option>
                        <option value="Glasbilder">Start</option>
                    </select>
                    <table>                  
                        <c:forEach items="${requestScope.images}" var="img">
                            <tr>
                                <td>${img.id}</td>
                                <td>${img.name}</td>
                                <td>${img.cTyp}</td>
                                <td>${img.size}</td>
                                <td>${img.desc}</td>
                                <td><img src="/Sandbox/upload?id=${img.id}&ctyp=${img.cTyp}}" ></td>
                            </tr>
                        </c:forEach>      
                    </table>
                </div>
                <hr>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </body>
</html>