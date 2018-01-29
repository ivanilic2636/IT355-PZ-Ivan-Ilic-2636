<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<body  background="https://i.ytimg.com/vi/bJ3v6MWep58/maxresdefault.jpg" >
<div class="container">
    <div class="col-md-6 col-md-offset-3  " style = "margin-left: 10%;" >
        <c:url var="addGenre" value="/addGenre" ></c:url>
        <form:form method="POST" modelAttribute="genre">
            <% String success = (String) request.getAttribute("successMsg");%>
            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
            <div class="form-group">
                <form:label path="name">Name</form:label>
                <form:input type="name" class="form-control" id="name" placeholder="name" path="name" />
            </div>
            <button type="submit" class="btn btn-primary">Add genre</button>
        </form:form>
    </div>
</div>
            
<%@include file="footer.jsp" %>
</body>