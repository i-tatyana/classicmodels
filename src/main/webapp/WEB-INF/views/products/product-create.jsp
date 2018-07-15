<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Create New Product <small>Fill inputs</small></h1>
 	</div>
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">

			<form:form commandName="product" method="POST" action="/classicmodels/products/product/create.html" cssClass="form-horizontal" >
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Product added successfully!</div>
				</c:if>
						 
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="productCode" >Product Code:</label>
						<form:input path="productCode" cssClass="form-control" />
						<form:errors path="productCode" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="productName" >Product Name:</label>
						<form:input path="productName" cssClass="form-control" />
						<form:errors path="productName" />
					</div>
				</div>	
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="productLine">Product Line:</label>
						<select name="productLine" class="form-control" />
					    	<c:forEach items="${categories}" var="category">
					    		<option><c:out value="${category.productLine}" /></option>
						    </c:forEach>
					    </select>
						<form:errors path="productLine" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="productScale">Product Scale:</label>
						<form:input path="productScale" cssClass="form-control" />
						<form:errors path="productScale" />
					</div>
				</div>				
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="productVendor" >Product Vendor:</label>
						<form:input path="productVendor" cssClass="form-control" />
						<form:errors path="productVendor" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="productDescription" >Product Description:</label>
						<form:input path="productDescription" cssClass="form-control" />
						<form:errors path="productDescription" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="quantityInStock" >Quantity In Stock:</label>
						<form:input path="quantityInStock" cssClass="form-control" />
						<form:errors path="quantityInStock" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="buyPrice" >Buy Price:</label>
						<form:input path="buyPrice" cssClass="form-control" />
						<form:errors path="buyPrice" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="msrp" >MSRP:</label>
						<form:input path="msrp" cssClass="form-control" />
						<form:errors path="msrp" />
					</div>
				</div>
			    <div class="form-row">
			    	<input type="submit" value="Create Product" class="btn btn-lg btn-success btn-block" style="width: 484px;"/>			    	
			    </div>
			</form:form>
			
			</div>
         </div>
       </div>
    </div>