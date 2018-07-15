<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>

<h1>${user.name}</h1>

<br /><br />

<div>
  <ul class="nav nav-tabs">
  
  	<c:forEach items="${user.categories}" var="category">
  		<li><a href="#category_${category.id}" data-toggle="tab">${category.name}</a></li>
  	</c:forEach>
  </ul>

  <div class="tab-content">
  	<c:forEach items="${user.categories}" var="category">
	    <div role="tabpanel" class="tab-pane" id="category_${category.id}">
	    	<h1>${category.name}</h1>
			<p>
			
			<a href="<spring:url value="/category/remove/${category.id}.html" />" class="btn btn-danger triggerRemove">remove category</a>
			
			${category.url}</p>
			
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th>Name</th>
						<th>Price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${category.products}" var="product">
						<tr>
							<td>${product.productName}</td>
							<td>${product.buyPrice}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	    </div>
    </c:forEach>
  </div>
</div>



