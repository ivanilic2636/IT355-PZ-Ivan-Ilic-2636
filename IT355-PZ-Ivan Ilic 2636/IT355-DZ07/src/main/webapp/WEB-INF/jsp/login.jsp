<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
    <head>
        <meta charset="utf-8">
        <%@ include file="header.jsp" %>
            <meta name="viewport" content="width=device-width, initial-scale=1">
         
           <link href="css/bootstrap.min.css" rel="stylesheet">

           
            
         <spring:url value="/css/style.css" var="styleCSS" />


<link href="${styleCSS}" rel="stylesheet" />


    <title>Login Page</title>
</head>
<body onload='document.loginForm.username.focus();' class="glavna" background="https://i.ytimg.com/vi/bJ3v6MWep58/maxresdefault.jpg">
    <div class="container text-left">
        <h1>Login here:</h1>


        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
        </c:if>

        <form name='loginForm' action="<c:url value='/j_spring_security_check' />"
              method='POST'>
            <table>
                <tr>
                    <td>User:</td>
                    <td><input type='text' name='username'></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type='password' name='password'/></td>
                </tr>
                <tr>
                    <td colspan='2'>
                        <button class="btn danger" type="submit" value="Submit" />Submit</button>
                      
                    </td>
                </tr>
            </table>
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
        </form>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <script src="js/bootstrap.min.js"></script>
    </div>
</body>
</html>