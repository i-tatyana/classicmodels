<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<div class="container">
	<div class="page-header">
    	<h1>Show Offices <small>View page</small></h1>
    </div>

    <c:if test="${param.success eq true}">
		<div class="alert alert-success">Office action successfully!</div>
	</c:if>
	
    <div class="row">
        <div class="col-md-8">

          <h2> ${office.officeCode} </h2>

          <p class="lead"><c:out value="${office.addressLine1}" /> <c:out value="${office.addressLine2}" /></p>
          <p class="lead"><c:out value="${office.city}" /></p>
          <p class="lead"><c:out value="${office.state}" /></p>
          <p class="lead"><c:out value="${office.country}" /></p>
          <p class="lead"><c:out value="${office.territory}" /></p>

        </div>

        <div class="col-md-4">
          <div class="well">
           
            <div class="row">
              <div class="col-sm-6">
              	<a href="<spring:url value="/offices/office/update/${office.officeCode}.html" />" class="btn btn-warning btn-lg" style="width: 130px;">
					Edit
				</a>
              </div>
              <div class="col-sm-6">
                <a href="<spring:url value="/offices/office/remove/${office.officeCode}.html" />" class="btn btn-danger btn-lg triggerRemove" style="width: 130px;">
					Delete
				</a>
              </div>
            </div>
			<br />
            <div class="row">
              <div class="col-md-12">
                <a href="<spring:url value="/offices.html" />" class="btn btn-info btn-lg btn-h1-spacing" style="width: 305px;">
					<< See All Offices
				</a>
              </div>
            </div>

          </div>
        </div>
       </div>
       
    </div>