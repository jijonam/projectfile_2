<%@ page session="false" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="${ pageContext.request.contextPath }/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${ pageContext.request.contextPath }/resources/bootstrap/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ pageContext.request.contextPath }/resources/bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ pageContext.request.contextPath }/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
    
    	function login(f) {
			
    		var email = f.email.value.trim();
    		var pwd = f.password.value.trim();
    		
    		if(email == ''){
    			alert('이메일을 입력해주세요.');
    			f.email.focus();
    			return;
    		}
    		
    		if(pwd == ''){
    			alert('비밀번호를 입력해주세요');
    			f.pwd.focus();
    			return;
    		}
    		
    		f.action = "login.do";  //MemberLoginAction
    		f.submit();
    		
		}
    	
    	window.onload = function () {
    		if('${ param.reason }' == 'id_fail'){
    			alert('이메일이 존재하지 않습니다.');
    		}
    		
    		if('${ param.reason }' == 'pwd_fail'){
    			alert('비밀번호가 틀립니다.');
    		}
    	};
    
    </script>

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="button" class="btn btn-lg btn-success btn-block" value="Login" onclick="login(this.form);">
                                <a href="${ pageContext.request.contextPath }/pages/join_form.do" class="btn btn-lg btn-success btn-block">Join</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="${ pageContext.request.contextPath }/resources/bootstrap/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${ pageContext.request.contextPath }/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${ pageContext.request.contextPath }/resources/bootstrap/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${ pageContext.request.contextPath }/resources/bootstrap/dist/js/sb-admin-2.js"></script>

</body>

</html>
