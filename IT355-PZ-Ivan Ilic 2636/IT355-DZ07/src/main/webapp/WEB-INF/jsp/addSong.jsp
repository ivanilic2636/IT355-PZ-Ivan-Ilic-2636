<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>





<body  background="https://i.ytimg.com/vi/bJ3v6MWep58/maxresdefault.jpg" >
<c:url var="addSong" value="/addSong" ></c:url>
    <div class="container">
        <div class="col-md-6 col-md-offset-3  " style = "margin-left: 0%;" >

        <c:url var="post_url"  value="/addSong/" />
        <form:form method="POST" action="${post_url}" modelAttribute="song">
            <% String success = (String) request.getAttribute("successMsg"); %>
            <%= (success != null) ? "<div class=\"alert alert-success\">"+success+"</div>" : "" %>
            <div class="form-group">
                <form:input type="hidden" id="id" class="form-control" placeholder="id" path="id" />
                <form:label path="name">Name</form:label>
                <form:input type="name" id="name" class="form-control" placeholder="name" path="name" />
            </div>
            <div class="form-group">
                <form:label path="artist">Artist</form:label>
                <form:input type="artist" id="artist" class="form-control" placeholder="artist" path="artist" />
            </div>
            <div class="form-group">
                <form:label path="length">Length</form:label>
                <form:input type="length" id="length" class="form-control" placeholder="length" path="length" />
            </div>
            <div class="form-group">
                <form:label for="genre" path="genre">Genres</form:label>
                <form:select id="slcRole" class="form-control" path="genre">
                    <form:option value="">SELECT</form:option>
                    <form:options items="${genres}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>
            <button type="submit" class="btn btn-primary">Add Song</button>
        </form:form>
    </div>
</div>
        
<%@include file="footer.jsp" %>
</body>