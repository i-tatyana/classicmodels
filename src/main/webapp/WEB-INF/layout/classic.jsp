<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
	
<!-- <link rel="stylesheet" 
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker-standalone.css" />

<link rel="stylesheet" 
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker-standalone.min.css" /> -->
	
<link rel="stylesheet"
	href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" >
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>

<style>
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}

#img-upload{
    width: 100%;
}
</style>

</head>
<body>

<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>

<tilesx:useAttribute name="current"/>

<div class="container">

      <div class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href='<spring:url value="/" />'>Brand</a>
          </div>
          <div class="navbar-collapse collapse">
          
            <ul class="nav navbar-nav">
              <li class="${current == 'index' ? 'active' : ''}"><a href='<spring:url value="/" />'>Home</a></li>
              <li class="${current == 'items' ? 'active' : ''}"><a href='<spring:url value="/items.html" />'>Products</a></li>
		       
              <security:authorize access="hasRole('ROLE_ADMIN')">
              	
              	<li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Database Work<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		           
		          	<li class="${current == 'offices' ? 'active' : ''}"><a href='<spring:url value="/offices.html" />'>Offices</a></li>
		          	<li class="${current == 'employees' ? 'active' : ''}"><a href='<spring:url value="/employees.html" />'>Employees</a></li>
		            <li class="${current == 'customers' ? 'active' : ''}"><a href='<spring:url value="/customers.html" />'>Customers</a></li>              		
		            <li class="${current == 'orders' ? 'active' : ''}"><a href='<spring:url value="/orders.html" />'>Orders</a></li>
		            <li class="${current == 'payments' ? 'active' : ''}"><a href='<spring:url value="/payments.html" />'>Payments</a></li>
		            <li class="${current == 'categories' ? 'active' : ''}"><a href='<spring:url value="/categories.html" />'>Categories</a></li>
		            <li class="${current == 'products' ? 'active' : ''}"><a href='<spring:url value="/products.html" />'>Products</a></li>
		            <li class="${current == 'orderdetails' ? 'active' : ''}"><a href='<spring:url value="/orderdetails.html" />'>Order-Details</a></li>
		            <li class="${current == 'messages' ? 'active' : ''}"><a href='<spring:url value="/messages.html" />'>Messages</a></li>
		            
		            <li role="separator" class="divider"></li>
		            <li class="${current == 'users' ? 'active' : ''}"><a href='<spring:url value="/users.html" />'>Users</a></li>
		          </ul>
		        </li>              	
              </security:authorize>
              
              <li class="${current == 'contact' ? 'active' : ''}"><a href='<spring:url value="/messages/register.html" />'>Contact</a></li>
            </ul>
            
            <ul class="nav navbar-nav navbar-right">              
              <security:authorize access="! isAuthenticated()">
	            <li class="${current == 'login' ? 'active' : ''} text-right"><a href='<spring:url value="/login.html" />'>Login</a></li>
              </security:authorize>
              <security:authorize access="isAuthenticated()">
              	<li class="${current == 'account' ? 'active' : ''}"><a href='<spring:url value="/account.html" />'>Account</a></li>
              	<li><a href="<spring:url value="/logout" />">Logout</a></li>
              </security:authorize>  
              <li class="${current == 'register' ? 'active' : ''} text-right"><a href='<spring:url value="/register.html" />'>Register</a></li>            
            </ul>          
              
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </div>

	<tiles:insertAttribute name="content" />

	<br>
	<br>
	<center>
		<tiles:insertAttribute name="footer" />
	</center>

</div>

<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove Category</h4>
      </div>
      <div class="modal-body">
        Really remove?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
  
<script type="text/javascript">
$(document).ready( function() {
	$(document).on('change', '.btn-file :file', function() {
	var input = $(this),
		label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	input.trigger('fileselect', [label]);
	});

	$('.btn-file :file').on('fileselect', function(event, label) {
	    
	    var input = $(this).parents('.input-group').find(':text'),
	        log = label;
	    
	    if( input.length ) {
	        input.val(log);
	    } else {
	        if( log ) alert(log);
	    }
    
	});
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	        reader.onload = function (e) {
	            $('#img-upload').attr('src', e.target.result);
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#image").change(function(){
	    readURL(this);
	}); 	
});
</script>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker();
        $('#datetimepicker2').datetimepicker({
            useCurrent: false //Important! See issue #1075
        });
        $('#datetimepicker3').datetimepicker({
        	useCurrent: false
        });        
        
    });
</script>
<script type="text/javascript">
$(document).ready(function() {
	$('.nav-tabs a:first').tab('show'); // Select first tab
	$(".triggerRemove").click(function(e) {
		e.preventDefault();
		$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
		$("#modalRemove").modal();
	});
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".registrationForm").validate(
		{
			rules: {
				name: {
					required : true,
					minlength : 3,
					remote : {
						url: "<spring:url value='/register/available.html' />",
						type: "get",
						data: {
							username: function() {
								return $("#name").val();
							}
						}
					}
				},
				email: {
					required : true,
					email: true
				},
				password: {
					required : true,
					minlength : 5
				},
				password_again: {
					required : true,
					minlength : 5,
					equalTo: "#password"
				}
			},
			highlight: function(element) {
				$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
			},
			unhighlight: function(element) {
				$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
			},
			messages: {
				name: {
					remote: "Such username already exists!"
				}
			}
		}
	);
});
</script>
</body>
</html>