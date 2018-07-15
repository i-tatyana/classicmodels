<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

	<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Products <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
              <form:form method = "GET" action = "/classicmodels/products/register.html">
		      	<input type = "submit" value = "Create New Product" class="btn btn-lg btn-block btn-primary btn-h1-spacing" style="width: 250px;" />		        
		      </form:form>           
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      
      <datatables:table id="productTable" data="${products}" row="product" >
		<datatables:column title="productCode" property="productCode" />
		<datatables:column title="productName" property="productName" />
		<datatables:column title="productLine" property="productLine" />
		<datatables:column title="productScale" property="productScale" />
		<datatables:column title="productVendor" property="productVendor" />
		<datatables:column title="productDescription" property="productDescription" />	
		<datatables:column title="quantityInStock" property="quantityInStock" />	
		<datatables:column title="buyPrice" property="buyPrice" />	
		<datatables:column title="MSRP" property="msrp" />			    
		<datatables:column title="show" sortable="false" >
			<a href="<spring:url value="/products/product/show/${product.productCode}.html" />" class="btn btn-default btn-sm">View</a> 
		</datatables:column>datatables:column>
		<datatables:column title="edit" sortable="false" >
			<a href="<spring:url value="/products/product/update/${product.productCode}.html" />" class="btn btn-default btn-sm">Update</a>
		</datatables:column>datatables:column>
	</datatables:table>   
	
	</div>
	