<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Edit The Payment <small>Change inputs</small></h1>
 	</div>
 	
 	<form:form commandName="payment" method="POST" action="/classicmodels/payments/payment/edit/${payment.customerNumber}/${payment.checkNumber}.html" cssClass="form-horizontal editorialForm" >
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Payment edited successfully!</div>
				</c:if>
				
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="customerNumber" >Customer Number:</label>
						<form:input path="customerNumber" cssClass="form-control" readonly="true" />
						<form:errors path="customerNumber" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="checkNumber" >Check Number:</label>
						<form:input path="checkNumber" cssClass="form-control" readonly="true" />
						<form:errors path="checkNumber" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
				 		<label for="paymentDate" >Payment Date:</label>
				        <div class='input-group date' id='datetimepicker1'>				            	
				        	<form:input path="paymentDate" cssClass="form-control" />
				            <form:errors path="paymentDate" />
				            <span class="input-group-addon">
				            	<span class="glyphicon glyphicon-calendar"></span>
				            </span>
				        </div>
				    </div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="amount">Amount:</label>
						<form:input path="amount" cssClass="form-control" />
						<form:errors path="amount" />
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
              	<a href="<spring:url value="/payments.html" />" class="btn btn-default btn-lg" style="width: 145px;" >
					Cancel
				</a>		    	
              </div>
            </div>
			
          </div>
        </div>
        
        </form:form>
        
    </div>