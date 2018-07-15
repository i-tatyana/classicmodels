<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglib.jsp"%>

<div class="container">
      <div class="page-header">
          <div class="row">
            <div class="col-md-9">
              <h1>Show All Offices <small>View page</small></h1>
            </div>            
            <div class="col-md-3">
                         
            </div>
            <div class="col-md-12">
            </div>
          </div>
      </div>
      
      <datatables:table id="messageTable" data="${messages}" row="message" >
		<datatables:column title="email" property="email" />
		<datatables:column title="phone" property="phone" />
		<datatables:column title="subject" property="subject" />
		<datatables:column title="body" property="body" />
		<datatables:column title="messagesRepUserNumber" property="messagesRepUserNumber" />
		<datatables:column title="status" property="status" />
		<datatables:column title="view" sortable="false" >	
			<a href="<spring:url value="/messages/message/show/${message.email}.html" />" class="btn btn-default btn-sm">View</a> 
		</datatables:column>
		<datatables:column title="edit" sortable="false" >
			<a href="<spring:url value="/messages/message/update/${message.email}.html" />" class="btn btn-default btn-sm">Update</a>
		</datatables:column>
	  </datatables:table>
	
</div>