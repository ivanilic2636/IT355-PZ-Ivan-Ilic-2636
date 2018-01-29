<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>Main page</title>
            <%@ include file="header.jsp" %>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
         
           <link href="css/bootstrap.min.css" rel="stylesheet">

           
            
         <spring:url value="/css/style.css" var="styleCSS" />


<link href="${styleCSS}" rel="stylesheet" />



        </head>
        <body class="glavna" background="https://i.ytimg.com/vi/bJ3v6MWep58/maxresdefault.jpg">
          <div class="container text-left">
              <div class ="prva">
            <h1>Hello user!</h1>
            <h2 class = "podnaslov"> ${message}</h2>
          
   
    <script src="js/bootstrap.min.js"></script>
  
            </div>
          </div>
        </body>
    </html>
