<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<div class="container">
	<div class="page-header">
    	<h1>Show Product <small>View page</small></h1>
    </div>

    <c:if test="${param.success eq true}">
		<div class="alert alert-success">Product action successfully!</div>
	</c:if>
	
    <div class="row">
        <div class="col-md-8">

          <h2> ${product.productCode} </h2>

          <p class="lead"><c:out value="${product.productName}" /> <c:out value="${product.productLine}" /></p>
          <p class="lead"><c:out value="${product.productScale}" /></p>
          <p class="lead"><c:out value="${product.productVendor}" /></p>
          <p class="lead"><c:out value="${product.productDescription}" /></p>
          <p class="lead"><c:out value="${product.quantityInStock}" /></p>
          <p class="lead"><c:out value="${product.buyPrice}" /></p>

        </div>

        <div class="col-md-4">
          <div class="well">
           
            <div class="row">
              <div class="col-sm-6">
              	<a href="<spring:url value="/products/product/update/${product.productCode}.html" />" class="btn btn-warning btn-lg" style="width: 130px;">
					Edit
				</a>
              </div>
              <div class="col-sm-6">
                <a href="<spring:url value="/products/product/remove/${product.productCode}.html" />" class="btn btn-danger btn-lg triggerRemove" style="width: 130px;">
					Delete
				</a>
              </div>
            </div>
			<br />
            <div class="row">
              <div class="col-md-12">
                <a href="<spring:url value="/products.html" />" class="btn btn-info btn-lg btn-h1-spacing" style="width: 305px;">
					<< See All Products
				</a>
              </div>
            </div>

          </div>
        </div>
       </div>
       
    </div>