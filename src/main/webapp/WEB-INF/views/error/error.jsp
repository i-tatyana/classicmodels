<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
	   <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	
	   <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
		
	   <link rel="stylesheet"
			href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		
	   <link rel="stylesheet"
			href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
		
	   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	   <title>Spring Error Page</title>
   </head>

   <body>
   
   	  <br /><br />
      <hr>
      
      <a href="<spring:url value="/" />" class="btn btn-danger btn-lg text-center" style="margin-left:485px;">
	  	An error occured, please contact administrator
	  </a>
      
      <br />
      <hr>
      <br />
	  
	  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	  <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
   </body>
</html>