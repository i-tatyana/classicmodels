<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Create New Order <small>Fill inputs</small></h1>
 	</div>
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">

			<form:form commandName="order" method="POST" action="/classicmodels/orders/order/create.html" cssClass="form-horizontal" >
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Order added successfully!</div>
				</c:if>
						 
				<div class="form-row">
					
					<div class="form-group col-md-12">
				 		<label for="orderDate" >Order Date:</label>
				        <div class='input-group date' id='datetimepicker1'>				            	
				        	<form:input path="orderDate" cssClass="form-control" />
				            <form:errors path="orderDate" />
				            <span class="input-group-addon">
				            	<span class="glyphicon glyphicon-calendar"></span>
				            </span>
				        </div>
				    </div>
				    <div class="form-group col-md-12">
				       	<label for="requiredDate" >Required Date:</label>
				        <div class='input-group date' id='datetimepicker2'>				            	
				    	    <form:input path="requiredDate" cssClass="form-control" />
				            <form:errors path="requiredDate" />
				            <span class="input-group-addon">
				           		<span class="glyphicon glyphicon-calendar"></span>
				            </span>
				        </div>
				    </div>
				    <div class="form-group col-md-12">
				      	<label for="shippedDate" >Shipped Date:</label>
				        <div class='input-group date' id='datetimepicker3'>				            	
				    	    <form:input path="shippedDate" cssClass="form-control" />
				            <form:errors path="requiredDate" />
				            <span class="input-group-addon">
				        	    <span class="glyphicon glyphicon-calendar"></span>
				            </span>
				        </div>
				    </div>
				</div>  <!--  end of DatePicker -->
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="status" >Status:</label>
						<form:input path="status" cssClass="form-control" />
						<form:errors path="status" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="comments">Comments:</label>
						<form:input path="comments" cssClass="form-control" />
						<form:errors path="comments" />
					</div>
				</div>
				<div class="form-row">
				    <div class="form-group col-md-12">
				    	<label for="customerNumber">Customer Number:</label>
					    <select name="customerNumber" class="form-control" />
					    	<c:forEach items="${customers}" var="customer">
					    		<option><c:out value="${customer.customerNumber}" /></option>
						    </c:forEach>
					    </select>
				    </div>
				</div>
			    <div class="form-row">
			    	<input type="submit" value="Create Order" class="btn btn-lg btn-success btn-block" style="width: 484px;"/>			    	
			    </div>
			</form:form>
			
			</div>
         </div>
       </div>
    </div>