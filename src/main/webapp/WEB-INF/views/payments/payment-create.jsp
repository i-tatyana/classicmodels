<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Create New Payment <small>Fill inputs</small></h1>
 	</div>
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">

			<form:form commandName="payment" method="POST" action="/classicmodels/payments/payment/create.html" cssClass="form-horizontal" >
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Payment added successfully!</div>
				</c:if>
						 
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="customerNumber" >Customer Number:</label>
						<select name="customerNumber" class="form-control" />
					    	<c:forEach items="${customers}" var="customer">
					    		<option><c:out value="${customer.customerNumber}" /></option>
						    </c:forEach>
					    </select>
						<form:errors path="customerNumber" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="checkNumber" >Check Number:</label>
						<form:input path="checkNumber" cssClass="form-control" />
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
			    	<input type="submit" value="Create Payment" class="btn btn-lg btn-success btn-block" style="width: 484px;"/>			    	
			    </div>
			</form:form>
			
			</div>
         </div>
       </div>
    </div>