<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<div class="container">
	<div class="page-header">
    	<h1>Show Payment <small>View page</small></h1>
    </div>

    <c:if test="${param.success eq true}">
		<div class="alert alert-success">Payment action successfully!</div>
	</c:if>
	
    <div class="row">
        <div class="col-md-8">

          <h2> ${payment.customerNumber} ${payment.checkNumber}</h2>

          <p class="lead"><c:out value="${payment.paymentDate}" /> </p>
          <p class="lead"><c:out value="${payment.amount}" /></p>

        </div>

        <div class="col-md-4">
          <div class="well">
           
            <div class="row">
              <div class="col-sm-6">
              	<a href="<spring:url value="/payments/payment/update/${payment.customerNumber}/${payment.checkNumber}.html" />" class="btn btn-warning btn-lg" style="width: 130px;">
					Edit
				</a>
              </div>
              <div class="col-sm-6">
                <a href="<spring:url value="/payments/payment/remove/${payment.customerNumber}/${payment.checkNumber}.html" />" class="btn btn-danger btn-lg triggerRemove" style="width: 130px;">
					Delete
				</a>
              </div>
            </div>
			<br />
            <div class="row">
              <div class="col-md-12">
                <a href="<spring:url value="/employees.html" />" class="btn btn-info btn-lg btn-h1-spacing" style="width: 305px;">
					<< See All Employees
				</a>
              </div>
            </div>

          </div>
        </div>
       </div>
       
    </div>