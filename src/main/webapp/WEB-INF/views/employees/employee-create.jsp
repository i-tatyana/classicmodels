<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Create New Employee <small>Fill inputs</small></h1>
 	</div>
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">

			<form:form commandName="employee" method="POST" action="/classicmodels/employees/employee/create.html" cssClass="form-horizontal" >
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Employee added successfully!</div>
				</c:if>
						 
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="firstName" >First Name:</label>
						<form:input path="firstName" cssClass="form-control" />
						<form:errors path="firstName" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="lastName" >Last Name:</label>
						<form:input path="lastName" cssClass="form-control" />
						<form:errors path="lastName" />
					</div>
				</div>	
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="extension" >Extension:</label>
						<form:input path="extension" cssClass="form-control" />
						<form:errors path="extension" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="email">Email:</label>
						<form:input path="email" cssClass="form-control" />
						<form:errors path="email" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="officeCode">Office Code:</label>
						<select name="officeCode" class="form-control" />
					    	<c:forEach items="${offices}" var="office">
					    		<option><c:out value="${office.officeCode}" /></option>
						    </c:forEach>
					    </select>
						<form:errors path="officeCode" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="jobTitle" >Job Title:</label>
						<form:input path="jobTitle" cssClass="form-control" />
						<form:errors path="jobTitle" />
					</div>
				</div>
			    <div class="form-row">
			    	<input type="submit" value="Create Employee" class="btn btn-lg btn-success btn-block" style="width: 484px;"/>			    	
			    </div>
			</form:form>
			
			</div>
         </div>
       </div>
    </div>