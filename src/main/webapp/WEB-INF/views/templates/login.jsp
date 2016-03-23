<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


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
	</form>
</div>

<!-- Modal login -->