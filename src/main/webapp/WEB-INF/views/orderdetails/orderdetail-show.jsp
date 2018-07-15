<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<div class="container">
	<div class="page-header">
    	<h1>Show Order-Details <small>View page</small></h1>
    </div>

    <c:if test="${param.success eq true}">
		<div class="alert alert-success">Order-Detail action successfully!</div>
	</c:if>
	
    <div class="row">
        <div class="col-md-8">

          <h2> ${orderdetail.orderNumber} ${orderdetail.productCode} </h2>

          <p class="lead"><c:out value="${orderdetail.quantityOrdered}" /> <c:out value="${orderdetail.priceEach}" /></p>
          <p class="lead"><c:out value="${orderdetail.orderLineNumber}" /></p>

        </div>

        <div class="col-md-4">
          <div class="well">
           
            <div class="row">
              <div class="col-sm-6">
              	<a href="<spring:url value="/orderdetails/orderdetail/update/${orderdetail.orderNumber}/${orderdetail.productCode}.html" />" class="btn btn-warning btn-lg" style="width: 130px;">
					Edit
				</a>
              </div>
              <div class="col-sm-6">
                <a href="<spring:url value="/orderdetails/orderdetail/remove/${orderdetail.orderNumber}/${orderdetail.productCode}.html" />" class="btn btn-danger btn-lg triggerRemove" style="width: 130px;">
					Delete
				</a>
              </div>
            </div>
			<br />
            <div class="row">
              <div class="col-md-12">
                <a href="<spring:url value="/orderdetails.html" />" class="btn btn-info btn-lg btn-h1-spacing" style="width: 305px;">
					<< See All Order-Details
				</a>
              </div>
            </div>

          </div>
        </div>
       </div>
       
    </div>