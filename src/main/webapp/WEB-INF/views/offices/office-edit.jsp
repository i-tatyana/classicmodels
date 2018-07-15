<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Edit The Office <small>Change inputs</small></h1>
 	</div>
 	
 	<form:form commandName="office" method="POST" action="/classicmodels/offices/office/edit/${office.officeCode}.html" cssClass="form-horizontal editorialForm" >
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Office added successfully!</div>
				</c:if>
				
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="officeCode" >Office Code:</label>
						<form:input path="officeCode" cssClass="form-control" readonly="true" />
						<form:errors path="officeCode" />
					</div>
				</div> 
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="city" >City:</label>
						<form:input path="city" cssClass="form-control" />
						<form:errors path="city" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="phone" >Phone:</label>
						<form:input path="phone" cssClass="form-control" />
						<form:errors path="phone" />
					</div>
				</div>	
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="addressLine1" >Address Line 1:</label>
						<form:input path="addressLine1" cssClass="form-control" />
						<form:errors path="addressLine1" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="addressLine2">Address Line 2:</label>
						<form:input path="addressLine2" cssClass="form-control" />
						<form:errors path="addressLine2" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="state" >State:</label>
						<form:input path="state" cssClass="form-control" />
						<form:errors path="state" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="country" >Country:</label>
						<form:input path="country" cssClass="form-control" />
						<form:errors path="country" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="postalCode" >Postal Code:</label>
						<form:input path="postalCode" cssClass="form-control" />
						<form:errors path="postalCode" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="territory" >Territory:</label>
						<form:input path="territory" cssClass="form-control" />
						<form:errors path="territory" />
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
              	<a href="<spring:url value="/offices.html" />" class="btn btn-default btn-lg" style="width: 145px;" >
					Cancel
				</a>		    	
              </div>
            </div>
			
          </div>
        </div>
        
        </form:form>
        
    </div>