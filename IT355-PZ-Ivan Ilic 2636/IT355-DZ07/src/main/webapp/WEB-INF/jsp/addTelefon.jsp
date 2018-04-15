<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>





<body  background="https://i.ytimg.com/vi/bJ3v6MWep58/maxresdefault.jpg" >
<c:url var="addTelefon" value="/addTelefon" ></c:url>
    <div class="container">
        <div class="col-md-6 col-md-offset-3  " style = "margin-left: 0%;" >

        <c:url var="post_url"  value="/addTelefon/" />
        <form:form method="POST" action="${post_url}" modelAttribute="telefon">
            <% String success = (String) request.getAttribute("successMsg"); %>
            <%= (success != null) ? "<div class=\"alert alert-success\">"+success+"</div>" : "" %>
            <div class="form-group">
              
                <form:label path="telefonnaziv">Naziv telefona</form:label>
                <form:input type="telefonnaziv" id="telefonnaziv" class="form-control" placeholder="telefonnaziv" path="telefonnaziv" />
            </div>
            
            <div class="form-group">
              
                <form:label path="telefonopis">Opis telefona</form:label>
                <form:input type="telefonopis" id="telefonopis" class="form-control" placeholder="telefonopis" path="telefonopis" />
            </div>
            
            <div class="form-group">
                <form:label path="telefonmemorija">Memorija telefona</form:label>
                <form:input type="telefonmemorija" id="telefonmemorija" class="form-control" placeholder="telefonmemorija" path="telefonmemorija" />
            </div>
            <div class="form-group">
                <form:label path="telefonbrzinaprocesora">Brzina procesora telefona</form:label>
                <form:input type="telefonbrzinaprocesora" id="telefonbrzinaprocesora" class="form-control" placeholder="telefonbrzinaprocesora" path="telefonbrzinaprocesora" />
            </div>
            
             <div class="form-group">
                <form:label path="telefonjacinakamere">Jacina kamere u pikselima</form:label>
                <form:input type="telefonjacinakamere" id="telefonjacinakamere" class="form-control" placeholder="telefonjacinakamere" path="telefonjacinakamere" />
            </div>
            
       
            
           <div class="form-group">
                <form:label path="telefonvodootporan">Da li je telefon vodootporan(da/ne)</form:label>
                <form:input type="telefonvodootporan" id="telefonvodootporan" class="form-control" placeholder="telefonvodootporan" path="telefonvodootporan" />
            </div>
            
            
            <div class="form-group">
                <form:label for="marka" path="marka">Marke</form:label>
                <form:select id="slcRole" class="form-control" path="marka">
                    <form:option value="">SELECT</form:option>
                    <form:options items="${marke}" itemValue="markaid" itemLabel="markanaziv" />
                </form:select>
            </div>
            <button type="submit" class="btn btn-primary">Add Telefon</button>
        </form:form>
    </div>
</div>
        
<%@include file="footer.jsp" %>
</body>