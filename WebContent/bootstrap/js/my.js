$(document).ready(function(){
	//globals
	var _fname        = 1;
	var _email        = 1;
	var _password     = 1;
	var _email_log    = 1;
	var _password_log = 1;
	
	//email verification before submit for login form
	$(document).on('keyup', '#email_log', function(e){
			var email_log   = $("#email_log").val();
			var matches = email_log.match(/\w+@\w+\.\w/);
			$("#email_log-tooltip").attr("data-original-title","Please enter your email");

			if(email_log == ""){ //check for null
				$("#d-email_log").addClass("has-error");
				$("#d-email_log").removeClass("has-success");
				$('#email_log-tooltip').tooltip('show');
				_email_log = 1; //error
			}
			else{
				if(matches){
					$("#d-email_log").addClass("has-success");
					$("#d-email_log").removeClass("has-error");
					$('#email_log-tooltip').tooltip('hide');
					_email_log = 0; //no error

				}
				else{
					$("#d-email_log").addClass("has-error");
					$("#d-email_log").removeClass("has-success");
					$("#email_log-tooltip").attr("data-original-title","Please enter a valid email");
					$('#email_log-tooltip').tooltip('show');
					_email_log = 1; //error
				}
			}
		});

	//password verification before submit for login form	
	$(document).on('keyup', '#password_log', function(e){
			var password_log = $("#password_log").val();
			$("#password_log-tooltip").attr("data-original-title","Please enter your password");

			if(password_log == ""){ //check for null
				$("#d-password_log").addClass("has-error");
				$("#d-password_log").removeClass("has-success");
				$('#password_log-tooltip').tooltip('show');
				_password_log = 1; //error
			}
			else{
				$("#d-password_log").addClass("has-success");
				$("#d-password_log").removeClass("has-error");
				$('#password_log-tooltip').tooltip('hide');
				_password_log = 0; //no error
			}
		});	
	
	//fullname verification for signup	
	$(document).on('keyup', '#fullname', function(e){
			var fullname = $("#fullname").val();

			if(fullname == ""){ //check for null
				$("#d-fullname").addClass("has-error");
				$("#d-fullname").removeClass("has-success");
				$('#fullname-tooltip').tooltip('show');
				_fname = 1; //error
			}
			else{
				$("#d-fullname").addClass("has-success");
				$("#d-fullname").removeClass("has-error");
				$('#fullname-tooltip').tooltip('hide');
				_fname = 0; //no error
			}
		});
	
	//email verification for signup
	$(document).on('keyup', '#email', function(e){
		var email   = $("#email").val();
		var matches = email.match(/\w+@\w+\.\w/);
		$("#email-tooltip").attr("data-original-title","Please enter your email");

		if(email == ""){ //check for null
			$("#d-email").addClass("has-error");
			$("#d-email").removeClass("has-success");
			$('#email-tooltip').tooltip('show');
			_email = 1; //error
		}
		else{
			if(matches){
				$("#d-email").addClass("has-success");
				$("#d-email").removeClass("has-error");
				$('#email-tooltip').tooltip('hide');
				_email = 0; //no error

			}
			else{
				$("#d-email").addClass("has-error");
				$("#d-email").removeClass("has-success");
				$("#email-tooltip").attr("data-original-title","Please enter a valid email");
				$('#email-tooltip').tooltip('show');
				_email = 1; //error
			}
		}
	});

	//mobile number verification for signup
	$(document).on('keyup', '#mobile', function(e){
		var number = $("#mobile").val();
		$("#mobile-tooltip").attr("data-original-title","Please enter a valid mobile number");

		if(number == ""){ //check for null
			$("#d-mobile").addClass("has-error");
			$("#d-mobile").removeClass("has-success");
			$('#mobile-tooltip').tooltip('show');
			_password = 1; //error
		}
		else{
			if(number.length < 10){
				$("#d-mobile").addClass("has-error");
				$("#d-mobile").removeClass("has-success");
				$("#mobile-tooltip").attr("data-original-title","Your mobile number should be atleast 10 digit long");
				$('#mobile-tooltip').tooltip('show');
				_password = 1; //error
			}
			else{
				$("#d-mobile").addClass("has-success");
				$("#d-mobile").removeClass("has-error");
				$('#mobile-tooltip').tooltip('hide');
				_password = 0; //no error
			}
		}
	});
	
	//signup button handler
	$(document).on('click', '#signup', function(e){
		if(_fname == 0 && _email == 0 && _password == 0){
			$("#sign-up-form").submit();
		}
		else{ 
			if(_fname == 1 ){
				$("#d-fullname").addClass("has-error");
				$("#d-fullname").removeClass("has-success");
				$('#fullname-tooltip').tooltip('show');
			}
			if(_email == 1 ){
				$("#d-email").addClass("has-error");
				$("#d-email").removeClass("has-success");
				$('#email-tooltip').tooltip('show');
			}
			if(_password == 1){
				$("#d-password").addClass("has-error");
				$("#d-password").removeClass("has-success");
				$('#password-tooltip').tooltip('show');			
			}
		}
	});
	
	//login button handler
	$(document).on('click', '#login', function(e){
		if(_email_log == 0 && _password_log == 0){
			//alert("fbnjhgbn");
			$("#login-form").submit();
		}
		else{ 
			if(_email_log == 1 ){
				$("#d-email_log").addClass("has-error");
				$("#d-email_log").removeClass("has-success");
				$('#email_log-tooltip').tooltip('show');
			}
			if(_password_log == 1){
				$("#d-password_log").addClass("has-error");
				$("#d-password_log").removeClass("has-success");
				$('#password_log-tooltip').tooltip('show');			
			}
		}
	});
	
	
	//upload button handler
	$(document).on('click', '#uploadButton', function(e){
			//alert("fbnjhgbn");
			if($("#file").val() && $("#docname").val())
				{
					$("#uploadForm").submit();
					//alert($("#responseText").val());
				}
			else
				alert("Enter File Details Properly");
		
	});
	
	//search button handler of third.jsp page
	$(document).on('click', '#but', function(e){
		var dataString = "doc_id="+$('#doc_id').val();
		//alert(dataString);
		$.ajax({
		    type  : 'POST',
		    url   : 'search.jsp',
		    data  : dataString,
			beforeSend: function(){

			},
			success: function(responseText){ 
				$('#docBody').html(responseText);
				$('#searchPanel').show();
			},
			complete: function(responseText){ 

			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
			    alert(errorThrown);
			}
		});
	});
	
	
	//request button handler of third.jsp page
	$(document).on('click', '#but_req', function(e){
		var dataString = "doc_id_req="+$('#doc_id_req').val();
		//alert(dataString);
		$.ajax({
		    type  : 'POST',
		    url   : 'request.jsp',
		    data  : dataString,
			beforeSend: function(){

			},
			success: function(responseText){ 
				$('#docBody').html(responseText);
				$('#request').show();
			},
			complete: function(responseText){ 

			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
			    alert(errorThrown);
			}
		});
	});
	
	//select all 
	$(document).on('click', '#mainCheckbox', function(e){
		if(this.checked) { // check select status
            $('.checkbox1').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"               
            });
        }else{
            $('.checkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
            });         
        }
	});
	
	//first tym login handler
	$(document).on('click', '#but_pswd_reset', function(e){
		var pass1 = $('#password_log11').val();
		var pass2 = $('#password_log12').val();;
		if(pass1 == pass2)
			$("#pswd-reset").submit();
		else
			$('#pass_mismatch').show();
		//alert(dataString);
		
	});
	
	//sign document button handler
	$(document).on('click', '#signButton', function(e){
		var pass1 = $('#signfile').val();
		if(pass1 != "")
			$('#sign-file-form').submit();
		else
			alert("please browse file to want to sign");
		//alert(dataString);
		
	});
	
	//new key button handler
	$(document).on('click', '#newKeyFormButton', function(e){
		var name = $('#name').val();
		var pass = $('#key-pswd-new').val();
		var unitName = $('#orgUnit').val();
		var orgName = $('#orgName').val();
		var city = $('#cityName').val();
		var state = $('#stateName').val();
		var country = $('#countryName').val();
		if(name != "" && pass !="" && unitName !="" && orgName !="" && city !="" && state !="" && country !="")
			$('#new-key-form').submit();
		else
			alert("Please fill the form correctly");
		//alert(dataString);
		
	});
	
	//ajax call to refresh notification
	 $(document).ready(function() {
		 setInterval(function(){
			 $.ajax({
                 url: '/ekosh/get_notification.jsp',
                 success: function(data) {
                 $('#notification').html(data);
                 }
               });
			 },3000);
	   });
	
});

