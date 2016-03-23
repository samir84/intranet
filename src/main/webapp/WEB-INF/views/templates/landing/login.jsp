<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../taglib.jsp" %>

<!-- Modal login -->
<div aria-hidden="true" aria-labelledby="myModalLabel1" role="dialog"
	tabindex="-1" id="login" class="modal fade" style="display: none;">
	<c:if test="${param.error != null}">
		<p>Invalid username / password</p>
	</c:if>
	<c:url var="loginUrl" value="/login" />
	<form name='loginForm'
		action="<c:url value='j_spring_security_check' />" method='POST'>
		<div style="margin-top: 150px;" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" data-dismiss="modal" class="close"
						type="button">×</button>
					<h4 id="myModalLabel1" class="modal-title">Login</h4>
				</div>
				<div id="login_details" class="modal-body">
					<span> Already have an account? </span> <br> <br> *<span
						style="font-weight: bold;">Your Email</span><br> <input
						type="text" name="j_username" placeholder="example@gmail.com"><br>
					<br> *<span style="font-weight: bold;">Password</span><br>
					<input type="password" name="j_password" placeholder="Password"><br>
				</div>
				<div class="modal-footer">
					<input type="submit" value="Log In" class="btn btn-success"
						style="float: left"> <span class="fp-link"> <a
						href="#">Forgot Password?</a></span> <br> <br> <span>
						Not a member yet?</span> <span class="text-info" style="cursor: pointer;"
						id="signup-link">Sign Up!</span>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
</div>

<!-- Modal login -->
<div aria-hidden="true" aria-labelledby="myModalLabel1" role="dialog"
	tabindex="-1" id="signup" class="modal fade" style="display: none;">

	<form class="login-form" method="post"
		action="<c:url value='/user/registration' />" role="form">
		<div style="margin-top: 150px;" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" data-dismiss="modal" class="close"
						type="button">×</button>
					<!-- 					<h4 id="myModalLabel1" class="modal-title">Login</h4> -->
					<div class="form-top">
						<div class="form-top-left">
							<h3>Sign up now</h3>
							<p>Fill in the form below to get instant access:</p>
						</div>
						<div class="form-top-right">
							<i class="fa fa-pencil"></i>
						</div>
					</div>
				</div>
				<div id="login_details" class="modal-body">

					<form:form commandName="user"
						cssClass="form-horizontal registrationForm">

						<c:if test="${param.success eq true}">
							<div class="alert alert-success">Registration successfull!</div>
						</c:if>

						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Name:</label>
							<div class="col-sm-10">
								<form:input path="name" cssClass="form-control" />
								<form:errors path="name" />
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">Email:</label>
							<div class="col-sm-10">
								<form:input path="email" cssClass="form-control" />
								<form:errors path="email" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">Password:</label>
							<div class="col-sm-10">
								<form:password path="password" cssClass="form-control" />
								<form:errors path="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">Password
								again:</label>
							<div class="col-sm-10">
								<input type="password" name="password_again" id="password_again"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<input type="submit" value="Save" class="btn btn-lg btn-primary" />
							</div>
						</div>
					</form:form>

				</div>
				<div class="modal-footer">
					<!-- 					<input type="submit" value="Log In" class="btn btn-success" -->
					<!-- 						style="float: left"> <span class="fp-link"> <a -->
					<!-- 						href="#">Forgot Password?</a></span> <br> <br> <span> -->
					<!-- 						Not a member yet?</span> <span class="text-info" style="cursor: pointer;" -->
					<!-- 						id="signup-link">Sign Up!</span> -->
					<div class="form-actions">
						<div class="submit-row">
							<input type="submit" data-purpose="do-signup"
								id="submit-id-submit" class="btn btn-primary btn btn-success"
								value="Sign Up" name="submit">
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->

	</form>
</div>