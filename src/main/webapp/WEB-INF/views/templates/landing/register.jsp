<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div aria-hidden="true" aria-labelledby="myModalLabel1" role="dialog"
	tabindex="-1" id="signup" class="modal fade" style="display: none;">

	<form class="register-form" method="post"
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
				<div id="registration_details" class="modal-body">
					<span style="font-weight: bold;">User Name:</span><br>
					 <input type="text" name="username" placeholder="username"><br>
					 <span style="font-weight: bold;">Email:</span><br>
					 <input type="text" name="email" placeholder="email@example.com"><br>
					 <span style="font-weight: bold;">Password:</span><br>
					 <input type="password" name="password" placeholder="password"><br>
				</div>
				<div class="modal-footer">
					<div class="form-actions">
						<div class="submit-row">
							<input type="submit" data-purpose="do-signup" style="width: 100%"
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
<script th:inline="javascript">
/*<![CDATA[*/
var serverContext = "/";

$(document).ready(function () {
	$('form').submit(function(event) {
		register(event);
	});
	
	$("password").keyup(function(){
		if($("#password").val() != $("#matchPassword").val()){
	        $("#globalError").show().html(<spring:message code="PasswordMatches.user" />);
	    }else{
	    	$("#globalError").html("").hide();
	    }
	});
	
	options = {
		    common: {minChar:8},
		    ui: {
		    	showVerdictsInsideProgressBar:true,
		    	showErrors:true,
		    	errorMessages:{
		    		  wordLength: <spring:message code="label.login" /> ,
		    		  wordNotEmail: <spring:message code="error.wordNotEmail" />,
		    		  wordSequences:<spring:message code="error.wordSequences" /> ,
		    		  wordLowercase: <spring:message code="error.wordLowercase" />,
		    		  wordUppercase: <spring:message code="error.wordUppercase" />,
		    	      wordOneNumber: <spring:message code="error.wordOneNumber" />,
		    		  wordOneSpecialChar:<spring:message code="error.wordOneSpecialChar" />'
		    		}
		    	}
		};
	 $('#password').pwstrength(options);
});

function register(event){
	event.preventDefault();
    $(".alert").html("").hide();
    $(".error-list").html("");
    if($("#password").val() != $("#matchPassword").val()){
    	$("#globalError").show().html(<spring:message code="PasswordMatches.user" />);
    	return;
    }
    var formData= $('form').serialize();
    $.post(serverContext + "user/registration",formData ,function(data){
        if(data.message == "success"){
            window.location.href = serverContext + "successRegister.html";
        }
        
    })
    .fail(function(data) {
        if(data.responseJSON.error.indexOf("MailError") > -1)
        {
            window.location.href = serverContext + "emailError.html";
        }
        else if(data.responseJSON.error == "UserAlreadyExist"){
            $("#emailError").show().html(data.responseJSON.message);
        }
        else if(data.responseJSON.error.indexOf("InternalError") > -1){
            window.location.href = serverContext + "login?message=" + data.responseJSON.message;
        }
        else{
        	var errors = $.parseJSON(data.responseJSON.message);
            $.each( errors, function( index,item ){
                $("#"+item.field+"Error").show().html(item.defaultMessage);
            });
            errors = $.parseJSON(data.responseJSON.error);
            $.each( errors, function( index,item ){
                $("#globalError").show().append(item.defaultMessage+"<br/>");
            });
        }
    });
}

</script>