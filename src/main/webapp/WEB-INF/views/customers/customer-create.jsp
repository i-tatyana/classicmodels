<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Create New Customer <small>Fill inputs</small></h1>
 	</div>

 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">

			<form:form commandName="customer" method="POST" action="/classicmodels/customers/customer/create.html" cssClass="form-horizontal" >

				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Registration was successfull!</div>
				</c:if>
				
			    <div class="form-row">	
					<div class="form-group col-md-12">
						<label for="customerName" >Organization Name:</label>
						<form:input path="customerName" cssClass="form-control" />
						<form:errors path="customerName" />						
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="contactFirstName" >First Name:</label>
						<form:input path="contactFirstName" cssClass="form-control" />
						<form:errors path="contactFirstName" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="contactLastName" >Last Name:</label>
						<form:input path="contactLastName" cssClass="form-control" />
						<form:errors path="contactLastName" />
					</div>
				</div>	
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="phone" >Telephone Number:</label>
						<form:input path="phone" cssClass="form-control" />
						<form:errors path="phone" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="addressLine1" >AddressLine1:</label>
						<form:input path="addressLine1" cssClass="form-control" />
						<form:errors path="addressLine1" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="addressLine2" >AddressLine2:</label>
						<form:input path="addressLine2" cssClass="form-control" />
						<form:errors path="addressLine2" />
					</div>
				</div>
				<div class="form-row">
			    	<div class="form-group col-md-12">
				        <label for="country">Country:</label>
				        <select name="country" class="form-control" />
					        <option selected></option>
					        <option>Urkraine</option>
					        <option>Greece</option>
					        <option>Poland</option>
					        <option>UK</option>
					        <option>USA</option>
					        <option></option>
				        </select>
			        </div>
			    </div>
			    <div class="form-row">
				    <div class="form-group col-md-12">
						<label for="city">City:</label>
							<form:input path="city" cssClass="form-control" />
							<form:errors path="city" />
					</div>
				</div>
				<div class="form-row">
				    <div class="form-group col-md-12">
				    	<label for="state">State:</label>
					    <select name="state" class="form-control" />
						    <option selected></option>
						    <option>Kyiv</option>
						    <option>Rivne</option>
						    <option>Poltava</option>
						    <option>Odesa</option>
						    <option>Vinnytsya</option>
						    <option></option>
					    </select>
				    </div>
				</div>
				<div class="form-row">
				    <div class="form-group col-md-12">
				    	<label for="postalCode">ZIP:</label>
						<form:input path="postalCode" cssClass="form-control" />
						<form:errors path="postalCode" />
				    </div>
				</div>
				<div class="form-row">
				    <div class="form-group col-md-12">
				    	<label for="salesRepEmployeeNumber">Employee Number:</label>
					    <select name="salesRepEmployeeNumber" class="form-control" />
					    	<c:forEach items="${employees}" var="employee">
					    		<option><c:out value="${employee.employeeNumber}" /></option>
						    </c:forEach>
					    </select>
				    </div>
				</div>
				<div class="form-row">
				    <div class="form-group col-md-12">
				     	<label for="creditLimit">Credit Limit:</label>
						<form:input path="creditLimit" cssClass="form-control" />
						<form:errors path="creditLimit" />
				    </div>
				</div>
			    <div class="form-row">
			    	<input type="submit" value="Create Customer" class="btn btn-lg btn-success btn-block" />			    	
			    </div>
			</form:form>
			
			</div>
         </div>
       </div>
    </div>