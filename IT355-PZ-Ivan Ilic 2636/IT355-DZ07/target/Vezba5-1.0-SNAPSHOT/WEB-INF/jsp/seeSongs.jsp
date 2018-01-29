<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<spring:url value="/css/style.css" var="styleCSS" />


<link href="${styleCSS}" rel="stylesheet" />

    

<body id="pozadina" background="https://wallpapercave.com/wp/8l3J3Iu.jpg">
   
<c:if test="${!empty songs}">

    <table class="table table-boarded table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Name</th>
                <th>Artist</th>
                <th>Length</th>
                <th>Genre</th>
                 <sec:authorize access="hasRole('ROLE_ADMIN')">
                <th>Edit</th>
                
                <th>Delete</th>
                 </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
                <th>Add to playlist</th>
               </sec:authorize>
            </tr>
        </thead>
        <tbody> 
            <c:forEach items="${songs}" var="song">
                <tr>
                    <td>${song.name}</td>
                    <td>${song.artist}</td>
                    <td>${song.length}</td>
                    <td>${song.genre}</td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <td><a href="<c:url value='/editSong/${song.id}' />">edit</a></td>
                    <td><a href="<c:url value='/deleteSong/${song.id}' />">delete</a></td>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
                    <td><a href="<c:url value='/addToPlaylist/${song.id}' />">Playlist</a></td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
   
<%@include file="footer.jsp" %>
</body>