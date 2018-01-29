<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<body background="https://wallpapercave.com/wp/8l3J3Iu.jpg">


    <table class="table table-striped table-dark">
        <thead>
            <tr>
                <th>Name</th>
                <th>Artist</th>
                <th>Length</th>
                <th>Genre</th>
                <th>Delete</th>
                
            </tr>
        </thead>
        <tbody> 
            <c:forEach items="${list}" var="songs">
                <tr>
                    <td>${songs.song.name}</td>
                    <td>${songs.song.artist}</td>
                    <td>${songs.song.length}</td>
                    <td>${songs.song.genre}</td>
                    <td><a href="<c:url value='/deleteSongFromPlaylist/${songs.id}' />">delete</a></td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>


<%@include file="footer.jsp" %>
</body>