<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

	<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Order-Details <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
              <form:form method = "GET" action = "/classicmodels/orderdetails/register.html">
		      	<input type = "submit" value = "Create New Order-Detail" class="btn btn-lg btn-block btn-primary btn-h1-spacing" style="width: 250px;" />		        
		      </form:form>           
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      
      <datatables:table id="orderdetailsTable" data="${orderdetails}" row="orderdetail" >
		<datatables:column title="orderNumber" property="orderNumber" />
		<datatables:column title="productCode" property="productCode" />
		<datatables:column title="quantityOrdered" property="quantityOrdered" />
		<datatables:column title="priceEach" property="priceEach" />
		<datatables:column title="orderLineNumber" property="orderLineNumber" />		    
		<datatables:column title="show" sortable="false" >
			<a href="<spring:url value="/orderdetails/orderdetail/show/${orderdetail.orderNumber}/${orderdetail.productCode}.html" />" class="btn btn-default btn-sm">View</a> 
		</datatables:column>datatables:column>
		<datatables:column title="edit" sortable="false" >
			<a href="<spring:url value="/orderdetails/orderdetail/update/${orderdetail.orderNumber}/${orderdetail.productCode}.html" />" class="btn btn-default btn-sm">Update</a>
		</datatables:column>datatables:column>
	</datatables:table>   
	
	</div>
	