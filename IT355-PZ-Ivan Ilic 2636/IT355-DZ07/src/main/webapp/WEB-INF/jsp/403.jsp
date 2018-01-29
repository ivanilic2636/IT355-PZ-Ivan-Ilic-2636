<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>
    <head>
        <%@ include file="header.jsp" %>
         <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
         
           <link href="css/bootstrap.min.css" rel="stylesheet">

           
            
         <spring:url value="/css/style.css" var="styleCSS" />


<link href="${styleCSS}" rel="stylesheet" />
</head>
    <body class="glavna" background="https://i.ytimg.com/vi/bJ3v6MWep58/maxresdefault.jpg">
         <div class="container text-left">
        <c:choose>
            <c:when test="${empty username}">
                <h2>Login</h2>
            </c:when>
            <c:otherwise>
                <h2>User ${username} <br/> you aren't allowed here!</h2>
               
                </c:otherwise>
            </c:choose>
                </div>
    </body>
</html>
