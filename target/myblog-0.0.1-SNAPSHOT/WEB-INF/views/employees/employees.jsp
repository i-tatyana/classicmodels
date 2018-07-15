<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

	<h1>Employees Table</h1>	

	<br />

    <datatables:table id="employeesTable" data="${employees}">
		<datatables:column title="id" property="id" />
		<datatables:column title="employeeLastName" property="employeeLastName" />
		<datatables:column title="employeeFirstName" property="employeeFirstName" />
		<datatables:column title="extension" property="extension" />
		<datatables:column title="email" property="email" />
		<datatables:column title="reportsTo" property="reportsTo" />
		<datatables:column title="jobTitle" property="jobTitle" />				    
	</datatables:table>

    <br /> 
    
    <form:form method = "GET" action = "/myblog/employees/register.html">
		<input type = "submit" value = "Create New Employee" class="btn btn-lg btn-block btn-primary btn-h1-spacing" style="width: 250px;" />		        
	</form:form>  
	