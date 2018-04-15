<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<spring:url value="/css/style.css" var="styleCSS" />


<link href="${styleCSS}" rel="stylesheet" />

    

<body id="pozadina" background="https://wallpapercave.com/wp/8l3J3Iu.jpg">
   
<c:if test="${!empty marke}">

    <table class="table table-boarded table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Naziv marke</th>
                <th>Opis marke</th>
               
                 
                <th>Edit</th>
                
                <th>Delete</th>
                 
                
            </tr>
        </thead>
        <tbody> 
            <c:forEach items="${marke}" var="marka">
                <tr>
                    <td>${marka.markanaziv}</td>
                    <td>${marka.markaopis}</td>
                    
                   
                    <td><a href="<c:url value='/editMarka/${marka.markaid}' />">edit</a></td>
                    <td><a href="<c:url value='/deleteMarka/${marka.markaid}' />">delete</a></td>
                  
                   
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
   
<%@include file="footer.jsp" %>
</body>