<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/layout/taglib.jsp"%>
    
<html>
   <head>
   	   <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	
	   <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
		
	   <link rel="stylesheet"
			href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		
	   <link rel="stylesheet"
			href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
		
	   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	   
       <title>Best Cars Exception Handling</title>
   </head>

   <body>      
      
      <br /><br /><hr>
      
      <h2 class="text-center" >Best Cars Exception Handling</h2>
      <h3 class="text-center color-warning">${exception.exceptionMsg}</h3>
      
      <br /><hr><br />
      
      <a href="<spring:url value="/" />" class="btn btn-warning btn-lg text-center" style="margin-left:550px;">
	  	Please, improve the mistake
	  </a>
      
      <br />
      <hr>
      <br />
	  
	  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	  <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
   </body>
</html>