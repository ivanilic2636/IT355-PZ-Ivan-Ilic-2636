<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<spring:url value="/css/style.css" var="styleCSS" />


<link href="${styleCSS}" rel="stylesheet" />

    

<body id="pozadina" background="https://wallpapercave.com/wp/8l3J3Iu.jpg">
   
<c:if test="${!empty telefoni}">

    <table class="table table-boarded table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Naziv telefona</th>
                <th>Opis telefona</th>
                <th>Memorija telefona</th>
                <th>Brzina procesora</th>
                  <th>Jacina kamere</th>
                  <th>Vodootpornost</th>
                  <th>Marka</th>
               
            </tr>
        </thead>
        <tbody> 
            <c:forEach items="${telefoni}" var="telefon">
                <tr>
                    <td>${telefon.telefonnaziv}</td>
                    <td>${telefon.telefonopis}</td>
                    <td>${telefon.telefonmemorija}</td>
                    <td>${telefon.telefonbrzinaprocesora}</td>
                     <td>${telefon.telefonjacinakamere}</td>
                     <td>${telefon.telefonvodootporan}</td>
                     <td>${telefon.marka}</td>
                     
                     
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
   
<%@include file="footer.jsp" %>
</body>