<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Create New Order-Detail <small>Fill inputs</small></h1>
 	</div>
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">

			<form:form commandName="orderdetail" method="POST" action="/classicmodels/orderdetails/orderdetail/create.html" cssClass="form-horizontal" >
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Order-Detail added successfully!</div>
				</c:if>
						 
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="orderNumber" >Order Number:</label>
						<select name="orderNumber" class="form-control" />
					    	<c:forEach items="${orders}" var="order">
					    		<option><c:out value="${order.orderNumber}" /></option>
						    </c:forEach>
					    </select>
						<form:errors path="orderNumber" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="productCode" >Product Code:</label>
						<select name="productCode" class="form-control" />
					    	<c:forEach items="${products}" var="product">
					    		<option><c:out value="${product.productCode}" /></option>
						    </c:forEach>
					    </select>
						<form:errors path="productCode" />
					</div>
				</div>	
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="quantityOrdered" >Quantity Ordered:</label>
						<form:input path="quantityOrdered" cssClass="form-control" />
						<form:errors path="quantityOrdered" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="priceEach">Price:</label>
						<form:input path="priceEach" cssClass="form-control" />
						<form:errors path="priceEach" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="orderLineNumber" >Order Line Number:</label>
						<form:input path="orderLineNumber" cssClass="form-control" />
						<form:errors path="orderLineNumber" />
					</div>
				</div>
			    <div class="form-row">
			    	<input type="submit" value="Create Order-Detail" class="btn btn-lg btn-success btn-block" style="width: 484px;"/>			    	
			    </div>
			</form:form>
			
			</div>
         </div>
       </div>
    </div>