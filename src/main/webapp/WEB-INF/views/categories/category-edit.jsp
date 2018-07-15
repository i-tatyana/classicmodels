<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Edit The Category <small>Change inputs</small></h1>
 	</div>
 	
 	<form:form commandName="category" method="POST" action="/classicmodels/categories/category/edit/${category.productLine}.html" cssClass="form-horizontal editorialForm" >
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Category added successfully!</div>
				</c:if>
				
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="productLine" >Product Line:</label>
						<form:input path="productLine" cssClass="form-control" readonly="true" />
						<form:errors path="productLine" />
					</div>
				</div> 
				
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="textDescription" >Text Description:</label>
						<form:input path="textDescription" cssClass="form-control" />
						<form:errors path="textDescription" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="htmlDescription" >HTML Description:</label>
						<form:input path="htmlDescription" cssClass="form-control" />
						<form:errors path="htmlDescription" />
					</div>
				</div>	
				<div class="form-row">
					<div class="form-group col-md-12">
						<label>Upload Image</label>
				        <div class="input-group">
				            <span class="input-group-btn">
				                <span class="btn btn-default btn-file">
				                    Browse… <input type="file" id="image">
				                </span>
				            </span>
				            <input type="text" class="form-control" readonly>
				        </div>
				        <br /><hr><br /><img id='img-upload'/><br /><hr>
						<form:errors path="file" />
					</div>
				</div>
			    <div class="form-row">
			    	<input type="submit" value="Save Changes" class="btn btn-lg btn-success btn-block" />			    	
			    </div>
			
	   	</div>
       </div> <!-- end of row -->     
        
       <div class="col-md-4 col-md-offset-1">
          <div class="well">
           
            <div class="row">
              <div class="col-sm-6">
              	<input type="submit" value="Save" class="btn btn-lg btn-success btn-block" style="width: 145px;"/>
              </div>
              <div class="col-sm-6">
              	<a href="<spring:url value="/categories.html" />" class="btn btn-default btn-lg" style="width: 145px;" >
					Cancel
				</a>		    	
              </div>
            </div>
			
          </div>
        </div>
        
        </form:form>
        
    </div>