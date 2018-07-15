<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Offices <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
              <form:form method = "GET" action = "/classicmodels/offices/register.html">
		      	<input type = "submit" value = "Create New Office" class="btn btn-lg btn-block btn-primary btn-h1-spacing" style="width: 250px;" />		        
		      </form:form>           
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      
      <datatables:table id="officesTable" data="${offices}" row="office" >
		<datatables:column title="officeCode" property="officeCode" />
		<datatables:column title="city" property="city" />
		<datatables:column title="phone" property="phone" />
		<datatables:column title="addressLine1" property="addressLine1" />
		<datatables:column title="addressLine2" property="addressLine2" />
		<datatables:column title="state" property="state" />	
		<datatables:column title="country" property="country" />		    
		<datatables:column title="postalCode" property="postalCode" />		
		<datatables:column title="territory" property="territory" />
		<datatables:column title="view" sortable="false" >	
			<a href="<spring:url value="/offices/office/show/${office.officeCode}.html" />" class="btn btn-default btn-sm">View</a> 
		</datatables:column>
		<datatables:column title="edit" sortable="false" >
			<a href="<spring:url value="/offices/office/update/${office.officeCode}.html" />" class="btn btn-default btn-sm">Update</a>
		</datatables:column>
	  </datatables:table>
      
      <!-- <div class="row">
        <div class="col-md-12">
          <table class="table">
            <thead>
              <th>#</th>
              <th>city</th>
              <th>phone</th>
              <th>addressLine1</th>
              <th>addressLine2</th>
              <th>state</th>
              <th>country</th>              
              <th>postalCode</th>
              <th>territory</th>
            </thead>

            <tbody>

              <c:forEach items="${offices}" var="office">

                <tr>
                  <th><c:out value="${office.officeCode}" /></th>
                  <td><c:out value="${office.city}" /></td>
                  <td><c:out value="${office.phone}" /></td>
                  <td><c:out value="${office.addressLine1}" /></td>
                  <td><c:out value="${office.addressLine2}" /></td>
                  <td><c:out value="${office.state}" /></td>
                  <td><c:out value="${office.country}" /></td>                 
                  <td><c:out value="${office.postalCode}" /></td>
                  <td><c:out value="${office.territory}" /></td>
                 
                  <td>
                  	<a href="<spring:url value="/offices/office/show/${office.officeCode}.html" />" class="btn btn-default btn-sm">View</a>
                  	<a href="<spring:url value="/offices/office/update/${office.officeCode}.html" />" class="btn btn-default btn-sm">Edit</a>
                  </td>
                </tr>

              </c:forEach>

            </tbody>
          </table>

        </div>
      </div> -->
	
</div>