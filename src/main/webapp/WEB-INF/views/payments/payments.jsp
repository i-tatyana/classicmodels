<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

	<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Payments <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
              <form:form method = "GET" action = "/classicmodels/payments/register.html">
		      	<input type = "submit" value = "Create New Payment" class="btn btn-lg btn-block btn-primary btn-h1-spacing" style="width: 250px;" />		        
		      </form:form>           
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      
      <datatables:table id="paymentsTable" data="${payments}" row="payment" >
		<datatables:column title="customerNumber" property="customerNumber" />
		<datatables:column title="checkNumber" property="checkNumber" />
		<datatables:column title="paymentDate" property="paymentDate" />
		<datatables:column title="amount" property="amount" />	    
		<datatables:column title="show" sortable="false" >
			<a href="<spring:url value="/payments/payment/show/${payment.customerNumber}/${payment.checkNumber}.html" />" class="btn btn-default btn-sm">View</a> 
		</datatables:column>datatables:column>
		<datatables:column title="edit" sortable="false" >
			<a href="<spring:url value="/payments/payment/update/${payment.customerNumber}/${payment.checkNumber}.html" />" class="btn btn-default btn-sm">Update</a>
		</datatables:column>datatables:column>
	  </datatables:table>
    	
	</div>
	