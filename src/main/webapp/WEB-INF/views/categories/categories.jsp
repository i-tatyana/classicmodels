<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Categories <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
                <!-- Button trigger modal -->
				<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
				  Create New Category
				</button>  
				<form:form commandName="category" cssClass="form-horizontal categoryForm">
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title" id="myModalLabel">New Category</h4>
					      </div>
					      <div class="modal-body">
					
							<div class="form-group">
								<label for="productLine" class="col-sm-2 control-label">Product Line:</label>
								<div class="col-sm-10">
									<form:input path="productLine" cssClass="form-control" />
									<form:errors path="productLine" />
								</div>
							</div>
							<div class="form-group">
								<label for="textDescription" class="col-sm-2 control-label">Description:</label>
								<div class="col-sm-10">
									<form:input path="textDescription" cssClass="form-control" />
									<form:errors path="textDescription" />
								</div>
							</div>
					
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <input type="submit" class="btn btn-primary" value="Save" />
					      </div>
					    </div>
					  </div>
					</div>
				</form:form>    
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      
      <datatables:table id="categoriesTable" data="${categories}" row="category" >
		<datatables:column title="productLine" property="productLine" />
		<datatables:column title="textDescription" property="textDescription" />
		<datatables:column title="htmlDescription" property="htmlDescription" />
		<datatables:column title="view" sortable="false" >	
			<a href="<spring:url value="/categories/category/show/${category.productLine}.html" />" class="btn btn-default btn-sm">View</a> 
		</datatables:column>
		<datatables:column title="edit" sortable="false" >
			<a href="<spring:url value="/categories/category/update/${category.productLine}.html" />" class="btn btn-default btn-sm">Update</a>
		</datatables:column>
	  </datatables:table>
	
</div>