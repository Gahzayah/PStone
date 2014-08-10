<%-- 
    Document   : tiput
    Created on : 10.08.2014, 11:06:15
    Author     : MaHi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/input.css">
        <!--   <script type="text/javascript" src="fileupload.js"></script>
           <script type="text/javascript" src="validation.js"></script>-->
        <title>JSP Page</title>
    </head>
    <body>    
        <form>
            <label for="name">Name</label>
            <input type="text" placeholder="text">
            <label for="email">Email</label>
            <input type="email" placeholder="email@deine.de">
            <select>
                <option>Default</option>
                <option>Option 1 </option>
                <option>Option 2 </option>
            </select>
            <input type="file" >
            <input type="button" value="new File">
            <!-- Radio Buttons -->
            <div class="radiobox">  
                <input id="male" type="radio" name="gender" value="male">  
                <label for="male">Male</label> 
                <br>
                <input id="female" type="radio" name="gender" value="female">  
                <label for="female">Female</label>  
            </div>  
            <!-- Checkbox Buttons -->
            <div class="checkbox">  
                <input id="check1" type="checkbox" name="check1" value="check1">  
                <label for="check1">Checkbox No. 1</label>  
                <br>
                <input id="check2" type="checkbox" name="check2" value="check2">  
                <label for="check2">Checkbox No. 2</label>  
            </div> 
            <label for="bday" >Datum</label>
            <input type="date" name="bday">
            <input type="month" name="bdaymonth">
            <input type="number" name="quantity" min="1" max="5">
            <input type="submit" value="submit">
            <textarea></textarea>
        </form>
    </body>
</html>
