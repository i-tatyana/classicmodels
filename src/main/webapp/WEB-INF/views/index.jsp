<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<h1>Latest items from the Best Cars:</h1>


<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${products}" var="product">
			<tr>
				<td>
					<c:out value="${product.productCode}" />
				</td>
				<td>
					<strong>
						<!-- <a href="<c:out value="${item.link}" />" target="_blank">
							<c:out value="${item.title}" />
						</a> -->
						<c:out value="${product.productName}" />
					</strong>
				</td>
				<td>
					<c:out value="${product.productDescription}" />					
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>