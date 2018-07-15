<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Edit The Order-Detail <small>Change inputs</small></h1>
 	</div>
 	
 	<form:form commandName="orderdetail" method="POST" action="/classicmodels/orderdetails/orderdetail/edit/${orderdetail.orderNumber}/${orderdetail.productCode}.html" cssClass="form-horizontal editorialForm" >
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Order-Detail edited successfully!</div>
				</c:if>
				
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="orderNumber" >Order Number:</label>
						<form:input path="orderNumber" cssClass="form-control" readonly="true" />
						<form:errors path="orderNumber" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="productCode" >Product Code:</label>
						<form:input path="productCode" cssClass="form-control" readonly="true" />
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
              	<a href="<spring:url value="/orderdetails.html" />" class="btn btn-default btn-lg" style="width: 145px;" >
					Cancel
				</a>		    	
              </div>
            </div>
			
          </div>
        </div>
        
        </form:form>
        
    </div>