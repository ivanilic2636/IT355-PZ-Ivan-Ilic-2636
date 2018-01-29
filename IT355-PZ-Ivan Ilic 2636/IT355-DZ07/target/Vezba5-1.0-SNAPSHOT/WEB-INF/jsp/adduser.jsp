<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <%@ include file="header.jsp" %>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="css/bootstrap.min.css" rel="stylesheet">



        <spring:url value="/css/style.css" var="styleCSS" />


        <link href="${styleCSS}" rel="stylesheet" />




    </head>
   
        
    <body class="glavna" background="https://i.ytimg.com/vi/bJ3v6MWep58/maxresdefault.jpg">
       
        <div class="container text-left">
  <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
   <% String success = (String) request.getAttribute("successMsg"); %>
            <%= (success != null) ? "<div class=\"alert alert-success\">"+success+"</div>" : "" %>
            <form:form method="POST" modelAttribute="user" value='/j_spring_security_check'>
                <div  class="form-group">

                    <form:label path="username">Username: </form:label>
                    <form:input id="username" type="text" path="username" class="form-control"/>

                </div>
                <div class="form-group">
                    <form:label path="password">Password: </form:label>
                    <form:input id="password" path="password" class="form-control" type="password"/>
                </div>

                <button class = "btn danger" type="submit">Register</button>



            </form:form>

        </div>
    </body>
</html>