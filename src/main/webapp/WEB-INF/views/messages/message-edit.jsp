<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

 <div class="container">
    <div class="page-header">
    	<h1>Edit The Message <small>Change inputs</small></h1>
 	</div>
 	
 	<form:form commandName="message" method="POST" action="/classicmodels/messages/message/edit/${message.email}.html" cssClass="form-horizontal editorialForm" >
 	
 	<div class="row">
        <div class="col-md-6">
          <div class="well well-md">
			
				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Message added successfully!</div>
				</c:if>
				
				<div class="form-row">
					<div class="form-group col-lg-12">
						<label for="email" >Email:</label>
						<form:input path="email" cssClass="form-control" readonly="true" />
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
						<form:input path="subject" cssClass="form-control" readonly="true" />
						<form:errors path="subject" />
					</div>
				</div>	
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="body" >Message:</label>
						<form:textarea path="body" cssClass="form-control" readonly="true" />
						<form:errors path="body" />
					</div>
				</div>
				<div class="form-row">
				    <div class="form-group col-md-12">
				    	<label for="messagesRepUserNumber">User Number:</label>
					    <select name="messagesRepUserNumber" class="form-control" />
					    	<c:forEach items="${users}" var="user">
					    		<option><c:out value="${user.userNumber}" /></option>
						    </c:forEach>
					    </select>
				    </div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="status" >Status:</label>
						<select name="status" class="form-control" />
							<option>wait</option>
							<option>done</option>							
						</select>
						<form:errors path="status" />
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
              	<a href="<spring:url value="/messages.html" />" class="btn btn-default btn-lg" style="width: 145px;" >
					Cancel
				</a>		    	
              </div>
            </div>
			
          </div>
        </div>
        
        </form:form>
        
    </div>