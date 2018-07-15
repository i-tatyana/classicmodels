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
	
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"> -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>

<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>

<tilesx:useAttribute name="current"/>

<div class="container">

  <!-- Static navbar -->
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
              <security:authorize access="hasRole('ROLE_ADMIN')">
              	<li class="${current == 'users' ? 'active' : ''}"><a href='<spring:url value="/users.html" />'>Users</a></li>
              	<li class="${current == 'customers' ? 'active' : ''}"><a href='<spring:url value="/customers.html" />'>Customers</a></li>
              	<li class="${current == 'employees' ? 'active' : ''}"><a href='<spring:url value="/employees.html" />'>Employees</a></li>
              </security:authorize>
              <li class="${current == 'register' ? 'active' : ''}"><a href='<spring:url value="/register.html" />'>Register</a></li>
              <security:authorize access="! isAuthenticated()">
	            <li class="${current == 'login' ? 'active' : ''}"><a href='<spring:url value="/login.html" />'>Login</a></li>
              </security:authorize>
              <security:authorize access="isAuthenticated()">
              	<li class="${current == 'account' ? 'active' : ''}"><a href='<spring:url value="/account.html" />'>Account</a></li>
              	<li><a href="<spring:url value="/logout" />">Logout</a></li>
              </security:authorize>
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
<!-- <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>-->

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