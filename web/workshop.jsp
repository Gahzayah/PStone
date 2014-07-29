<%-- 
    Document   : workshop
    Created on : 29.07.2014, 12:16:40
    Author     : MaHi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="service" scope="page" class="org.mhi.persistence.ImgService" />


<t:genericPage titlepage="Title der Page">
    <jsp:attribute name="head">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/typografie.css"/>" > 
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/input.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/calendar.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/listen.css"/>" >
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/font-awesome-4.0.3/css/font-awesome.css"/>" >
    </jsp:attribute>
    <jsp:body>
        <main>
            <section>
                <h3>Workshop</h3>
                <hr>
            </section>
            <section>
                <p>Falls du Unterstützung benötigst, die gesuchten Informationen nicht findest oder einen Fehler entdeckt hast.
                    Falls du Informationen zu einzelnen Austellungsstücken hast, Fragen zu Workshops und Terminen.
                </p>  
                <h3>Alle Termine im Überblick</h3>
                <hr>
            </section>
            <section class="calendar">
                <table class="cal">
                    <thead>
                        <tr>
                            <th><a href="index.html"><i class="fa fa-arrow-circle-left" ></i></a></th>
                            <th colspan="5">January 2012</th>  
                            <th><a href="index.html"><i class="fa fa-arrow-circle-right" ></i></a></th>                     
                        </tr>
                        <tr>
                            <th>Mon</th>
                            <th>Tue</th>
                            <th>Wed</th>
                            <th>Thu</th>
                            <th>Fri</th>
                            <th>Sat</th>
                            <th>Sun</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="off"><a href="index.html">26</a></td>
                            <td class="off"><a href="index.html">27</a></td>
                            <td class="off"><a href="index.html">28</a></td>
                            <td class="off"><a href="index.html">29</a></td>
                            <td class="off"><a href="index.html">30</a></td>
                            <td class="off"><a href="index.html">31</a></td>
                            <td><a href="index.html">1</a></td>
                        </tr>
                        <tr>
                            <td><a href="index.html">2</a></td>
                            <td><a href="index.html">3</a></td>
                            <td><a href="index.html">4</a></td>
                            <td><a href="index.html">5</a></td>
                            <td><a href="index.html">6</a></td>
                            <td><a href="index.html">7</a></td>
                            <td><a href="index.html">8</a></td>
                        </tr>
                        <tr>
                            <td><a href="index.html">9</a></td>
                            <td><a href="index.html">10</a></td>
                            <td><a href="index.html">11</a></td>
                            <td class="entry"><a href="index.html">12</a></td>
                            <td><a href="index.html">13</a></td>
                            <td><a href="index.html">14</a></td>
                            <td><a href="index.html">15</a></td>
                        </tr>
                        <tr>
                            <td><a href="index.html">16</a></td>
                            <td><a href="index.html">17</a></td>
                            <td><a href="index.html">18</a></td>
                            <td><a href="index.html">19</a></td>
                            <td><a href="index.html">20</a></td>
                            <td><a href="index.html">21</a></td>
                            <td><a href="index.html">22</a></td>
                        </tr>
                        <tr>
                            <td><a href="index.html">23</a></td>
                            <td><a href="index.html">24</a></td>
                            <td><a href="index.html">25</a></td>
                            <td><a href="index.html">26</a></td>
                            <td><a href="index.html">27</a></td>
                            <td class="active"><a href="index.html">28</a></td>
                            <td><a href="index.html">29</a></td>
                        </tr>
                        <tr>
                            <td><a href="index.html">30</a></td>
                            <td><a href="index.html">31</a></td>
                            <td class="off"><a href="index.html">1</a></td>
                            <td class="off"><a href="index.html">2</a></td>
                            <td class="off"><a href="index.html">3</a></td>
                            <td class="off"><a href="index.html">4</a></td>
                            <td class="off"><a href="index.html">5</a></td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main> 
    </jsp:body>
</t:genericPage>

