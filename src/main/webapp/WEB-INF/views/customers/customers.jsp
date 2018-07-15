<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Customers <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
              <form:form method = "GET" action = "/classicmodels/customers/register.html">
		      	<input type = "submit" value = "Create New Customer" class="btn btn-lg btn-block btn-primary btn-h1-spacing" style="width: 250px;" />		        
		      </form:form>           
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      
      <div class="row">
        <div class="col-md-12">
          <table class="table">
            <thead>
              <th>#</th>
              <th>customerName</th>
              <th>contactLastName</th>
              <th>contactFirstName</th>
              <th>phone</th>
              <th>addressLine1</th>
              <th>addressLine2</th>
              <th>country</th>
              <th>city</th>
              <th>state</th>
              <th>postalCode</th>
              <th>creditLimit</th>
            </thead>

            <tbody>

              <c:forEach items="${customers}" var="customer">

                <tr>
                  <th><c:out value="${customer.customerNumber}" /></th>
                  <td><c:out value="${customer.customerName}" /></td>
                  <td><c:out value="${customer.contactLastName}" /></td>
                  <td><c:out value="${customer.contactFirstName}" /></td>
                  <td><c:out value="${customer.phone}" /></td>
                  <td><c:out value="${customer.addressLine1}" /></td>
                  <td><c:out value="${customer.addressLine2}" /></td>
                  <td><c:out value="${customer.country}" /></td>
                  <td><c:out value="${customer.city}" /></td>
                  <td><c:out value="${customer.state}" /></td>
                  <td><c:out value="${customer.postalCode}" /></td>
                  <td><c:out value="${customer.creditLimit}" /></td>
                 
                  <td>
                  	<a href="<spring:url value="/customers/customer/show/${customer.customerNumber}.html" />" class="btn btn-default btn-sm">View</a>
                  	<a href="<spring:url value="/customers/customer/update/${customer.customerNumber}.html" />" class="btn btn-default btn-sm">Edit</a>
                  </td>
                </tr>

              </c:forEach>

            </tbody>
          </table>

        </div>
      </div>
    </div>