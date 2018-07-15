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

			<form:form commandName="employee" method="POST" action="/myblog/employees/employee/create.html" cssClass="form-horizontal" >
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Employee added successfully!</div>
				</c:if>
						 
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="employeeFirstName" >First Name:</label>
						<form:input path="employeeFirstName" cssClass="form-control" />
						<form:errors path="employeeFirstName" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="employeeLastName" >Last Name:</label>
						<form:input path="employeeLastName" cssClass="form-control" />
						<form:errors path="employeeLastName" />
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
						<label for="reportsTo" >Reports To:</label>
						<form:input path="reportsTo" cssClass="form-control" />
						<form:errors path="reportsTo" />
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
			    	<input type="submit" value="Create Employee" class="btn btn-lg btn-success btn-block" />			    	
			    </div>
			</form:form>
			
			</div>
         </div>
         
         <div class="col-md-4 col-md-offset-1">
           <div class="form-row">
             <form:form method = "GET" action = "/myblog/employyes/register.html">
             <!-- 
		      	<input type = "submit" value = "Delete" class="btn btn-lg btn-block btn-danger btn-h1-spacing" style="margin-left: 15px;margin-top: 20px;" />		        
		      	<input type = "submit" value = "Update" class="btn btn-lg btn-block btn-warning btn-h1-spacing" style="margin-left: 15px;margin-top: 20px;" />
		      	<input type = "submit" value = "Get All" class="btn btn-lg btn-block btn-info btn-h1-spacing" style="margin-left: 15px;margin-top: 20px;" />
		      	 -->
		      	 
		     </form:form>   
           </div>
         </div>
       </div>
    </div>