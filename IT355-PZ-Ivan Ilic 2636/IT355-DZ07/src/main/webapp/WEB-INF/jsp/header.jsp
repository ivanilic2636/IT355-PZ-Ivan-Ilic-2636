<%-- 
    Document   : header
    Created on : Oct 23, 2017, 5:57:35 PM
    Author     : student
--%>
 

<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <script src="https://code.jquery.com/jquery-3.1.1.js" integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA=" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"/>

        <script>
            $(document).ready(function () {
                $("table").DataTable();
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
         
           <link href="css/bootstrap.min.css" rel="stylesheet">

           
            
         <spring:url value="/css/style.css" var="styleCSS" />


<link href="${styleCSS}" rel="stylesheet" />
    </head>
    
        
      <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="http://localhost:8084/IT/"">MusicAndMe</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li><a class="navbar-brand" href="http://localhost:8084/IT/addSong">Add song</a></li>
         <li><a class="navbar-brand" href="http://localhost:8084/IT/addGenre">Add genre</a></li>
      </sec:authorize>
        <li><a class="navbar-brand" href="http://localhost:8084/IT/seeSongs">Songs</a></li>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
        <li><a class="navbar-brand" href="http://localhost:8084/IT/seePlaylist">Playlist</a></li>
        </sec:authorize>
       </ul>
      
      <ul class="nav navbar-nav navbar-right">
          <c:if test="${pageContext.request.userPrincipal.name== null}">
          <li><a href="http://localhost:8084/IT/login"><span class="glyphicon glyphicon-log-in"></span> </a></li>
           
          <li><a href="http://localhost:8084/IT/adduser"><span class="glyphicon glyphicon-user"></span> </a></li>
           </c:if>
      </ul>
          <ul class="nav navbar-nav navbar-right">
          
          <li> <c:if test="${pageContext.request.userPrincipal.name != null}">
                <c:url value="/j_spring_security_logout" var="logoutUrl" />
                <form action="${logoutUrl}" method="post" id="logoutForm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
             <script>
                    function formSubmit() {
                        document.getElementById("logoutForm").submit();
                    }
                </script><c:if test="${pageContext.request.userPrincipal.name
                              != null}">
                    
                         
                           <a href="javascript:formSubmit()">LOGOUT -> ${pageContext.request.userPrincipal.name}</a>
                      
                </c:if>
                   </c:if>           
        </li>
      </ul>
       
      
    </div>
  </div>
</nav>
    <br/>
   

