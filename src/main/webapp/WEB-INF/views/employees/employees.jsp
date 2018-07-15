<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

	<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Customers <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
              <form:form method = "GET" action = "/classicmodels/employees/register.html">
		      	<input type = "submit" value = "Create New Employee" class="btn btn-lg btn-block btn-primary btn-h1-spacing" style="width: 250px;" />		        
		      </form:form>           
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      
      <datatables:table id="employeesTable" data="${employees}" row="employee" >
		<datatables:column title="employeeNumber" property="employeeNumber" />
		<datatables:column title="lastName" property="lastName" />
		<datatables:column title="firstName" property="firstName" />
		<datatables:column title="extension" property="extension" />
		<datatables:column title="email" property="email" />
		<datatables:column title="officeCode" property="officeCode" />	
		<datatables:column title="jobTitle" property="jobTitle" />				    
		<datatables:column title="show" sortable="false" >
			<a href="<spring:url value="/employees/employee/show/${employee.employeeNumber}.html" />" class="btn btn-default btn-sm">View</a> 
		</datatables:column>datatables:column>
		<datatables:column title="edit" sortable="false" >
			<a href="<spring:url value="/employees/employee/update/${employee.employeeNumber}.html" />" class="btn btn-default btn-sm">Update</a>
		</datatables:column>datatables:column>
	</datatables:table>
      
      <!-- <div class="row">
        <div class="col-md-12">
          <table class="table">
            <thead>
              <th>#</th>
              <th>lastName</th>
              <th>firstName</th>
              <th>extension</th>
              <th>email</th>
              <th>officeCode</th>
              <th>jobTitle</th>
            </thead>

            <tbody>

              <c:forEach items="${employees}" var="employee">

                <tr>
                  <th><c:out value="${employee.employeeNumber}" /></th>
                  <td><c:out value="${employee.lastName}" /></td>
                  <td><c:out value="${employee.firstName}" /></td>
                  <td><c:out value="${employee.extension}" /></td>
                  <td><c:out value="${employee.email}" /></td>
                  <td><c:out value="${employee.officeCode}" /></td>
                  <td><c:out value="${employee.jobTitle}" /></td>
                  <td><a href="<spring:url value="/employees/employee/show/${employee.employeeNumber}.html" />" class="btn btn-default btn-sm">View</a></td>
                  <td><a href="<spring:url value="/employees/employee/update/${employee.employeeNumber}.html" />" class="btn btn-default btn-sm">Update</a></td>
                 
                </tr>

              </c:forEach>

            </tbody>
          </table>

        </div>
      </div>
    </div> -->

    <br /> 
    
    <form:form method = "GET" action = "/classicmodels/employees/register.html">
		<input type = "submit" value = "Create New Employee" class="btn btn-lg btn-block btn-primary btn-h1-spacing" style="width: 250px;" />		        
	</form:form>  
	
	</div>
	