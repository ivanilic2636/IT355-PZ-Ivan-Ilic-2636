<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<body>
<div class="container">
    <div class="col-md-6 col-md-offset-3  " style = "margin-left: 10%;" >
        <c:url var="addMarka" value="/addMarka" ></c:url>
        <form:form method="POST" modelAttribute="marka">
            <% String success = (String) request.getAttribute("successMsg");%>
            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
            <div class="form-group">
                <form:label path="markanaziv">Naziv marke</form:label>
                <form:input type="markanaziv" class="form-control" id="markanaziv" placeholder="markanaziv" path="markanaziv" />
                
                
                <form:label path="markaopis">Opis marke</form:label>
                <form:input type="markaopis" class="form-control" id="markaopis" placeholder="markaopis" path="markaopis" />
                
            </div>
            <button type="submit" class="btn btn-primary">Add marka</button>
        </form:form>
    </div>
</div>
            
<%@include file="footer.jsp" %>
</body>