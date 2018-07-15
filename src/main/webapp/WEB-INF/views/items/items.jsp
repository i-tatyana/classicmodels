<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

	<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Items <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
                      
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      

<ul class="nav nav-tabs">
  
  	<c:forEach items="${categories}" var="category">
  		<li><a href="#cat_${category.productLine}" data-toggle="tab">${category.productLine}</a></li>
  	</c:forEach>
  </ul>

  <div class="tab-content">
  	<c:forEach items="${categories}" var="category">
	    <div role="tabpanel" class="tab-pane" id="cat_${category.productLine}">
	    	<h1>${category.productLine}</h1>	
	    				
			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Product Line</th>
						<th>Product Scale</th>
						<th>Product Vendor</th>
						<th>Product Description</th>
						<th>Quantity In Stock</th>
						<th>Price</th>
						<th>MSRP</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${category.products}" var="product">
						<tr>
							<td>${product.productCode}</td>
							<td>${product.productName}</td>
							<td>${product.productLine}</td>
							<td>${product.productScale}</td>
							<td>${product.productVendor}</td>
							<td>${product.productDescription}</td>
							<td>${product.quantityInStock}</td>
							<td>${product.buyPrice}</td>
							<td>${product.msrp}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
	    </div>
    </c:forEach>
  </div>
</div>

      <!-- <datatables:table id="productTable" data="${products}" row="product" >
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
	  </datatables:table>-->
    	
	</div>
	