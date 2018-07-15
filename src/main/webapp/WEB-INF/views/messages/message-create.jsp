<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Create New Message <small>Fill inputs</small></h1>
 	</div>
 	
 	<div class="row">
        <div class="col-md-6">
        
         	<c:if test="${param.success eq true}">
		 		<div class="alert alert-success">Message added successfully!</div>
		    </c:if>
		    
          <div class="well well-md"> 

			<form:form commandName="message" method="POST" action="/classicmodels/messages/message/create.html" cssClass="form-horizontal" >
					
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="email" >Email:</label>
						<form:input path="email" cssClass="form-control" />
						<form:errors path="email" />
					</div>
				</div> 
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="phone" >Phone:</label>
						<form:input path="phone" cssClass="form-control" />
						<form:errors path="phone" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="subject" >Subject:</label>
						<form:input path="subject" cssClass="form-control" />
						<form:errors path="subject" />
					</div>
				</div>	
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="body" >Message:</label>
						<form:textarea path="body" cssClass="form-control" />
						<form:errors path="body" />
					</div>
				</div>
			    <div class="form-row">
			    	<input type="submit" value="Create Message" class="btn btn-lg btn-success btn-block" style="width: 484px;"/>			    	
			    </div>
			</form:form>
			
			</div>
         </div>
       </div>
    </div>