<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Edit The Customer <small>Change inputs</small></h1>
 	</div>
 	
 	<form:form commandName="customer" method="POST" action="/myblog/customers/customer/edit/${customer.customerNumber}.html" cssClass="form-horizontal editorialForm" >
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Customer added successfully!</div>
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
						<label for="email">Email:</label>
						<form:input path="email" cssClass="form-control" />
						<form:errors path="email" />
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
				     	<label for="salesRepEmployeeNumber">Employee ID Number:</label>
						<form:input path="salesRepEmployeeNumber" cssClass="form-control" />
						<form:errors path="salesRepEmployeeNumber" />
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
			    	<input type="submit" value="Save Changes" class="btn btn-lg btn-success btn-block" />			    	
			    </div>
			
	   	</div>
       </div> <!-- end of row -->
       
       
        
       <div class="col-md-4 col-md-offset-1">
          <div class="well">
           
            <div class="row">
              <div class="col-sm-6">
              	<input type="submit" value="Save" class="btn btn-lg btn-success btn-block" style="width: 145px;"/>
              </div>
              <div class="col-sm-6">
              	<a href="<spring:url value="/customers.html" />" class="btn btn-default btn-lg" style="width: 145px;" >
					Cancel
				</a>		    	
              </div>
            </div>
			
          </div>
        </div>
        
        </form:form>
        
    </div>