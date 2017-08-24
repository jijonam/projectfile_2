<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

	<!-- Bootstrap -->
    <link href="${ pageContext.request.contextPath }/resources/bootstrap/join/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/bootstrap/join/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/bootstrap/join/css/style.css" media="screen" title="no title" charset="utf-8">

	<!-- Ajax사용설정 -->
	<script src="${ pageContext.request.contextPath }/resources/bootstrap/join/js/httpRequest.js"></script>

	<script type="text/javascript">
	
	function check_id() {
		var email = document.getElementById("inputEmail").value;
		if (email=='') {
			alert('이메일을 입력해주세요.');
			return;
		}
		
		//아이디에 사용유무 서버에게 요청
		var url = "${ pageContext.request.contextPath }/pages/check_email.do"; //MemberCheckIdAction
		var param = "email=" + email;
		
		sendRequest(url, param, resultFn, 'GET');
	}
	
	function resultFn() {
		if (xhr.readyState==4 && xhr.status==200) {
			var data = xhr.responseText;
			//alert(data);
			
			//Text => Object
			var json = eval(data);
			
			//이미 있는 상태
			if(json[0].result=='not_use'){
				alert('이미 사용중');
				return;
			}
			
			//사용가능한 상태
			alert('사용가능한 아이디 입니다.');

			//아이디창 읽기 전용으로 바꾸기
			document.getElementById("inputEmail").readOnly = true;
			
		}
	}
	
	function send(f) {
		var name = f.inputName.value.trim();
		var emailCheck = f.inputEmail;
		var pwd = f.inputPassword.value.trim();
		var email = f.inputEmail.value.trim();
		var checkPwd = f.inputPasswordCheck.value.trim();
		
		if(pwd==''){
			alert('비밀번호를 입력하세요.');
			f.inputPassword.focus();
		}
		
		if(pwd!=checkPwd){
			alert('확인 비밀번호가 다릅니다.');
			f.inputPasswordCheck.focus();
		}
		
		/* if(!/^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{8,10}$/.test(pwd)){
			alert('비밀번호는 8~10 자리 사이로 입력해주세요.');
		} */
		
		if(name==''){
			alert('이름을 입력하세요.');
			f.inputName.focus();
		}
		
		if(emailCheck.readOnly != true){
			alert('이메일 중복체크를 하세요');
			f.email.focus();
		}
		
		/* Pattern p = Pattern.compile("([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])");
		Matcher m = p.matcher(input); */
		
		alert('회원가입이 완료되었습니다.');
		
		f.action = "${ pageContext.request.contextPath }/pages/member_insert.do?email=" + email + "&name=" + name + "&pwd=" + pwd;
		f.method = "POST";
		
		f.submit();
	}
	
	function cancle(f) {
		
		f.action = "${ pageContext.request.contextPath }/pages/login_form.do";
		f.method = "POST";
		
		f.submit();
		
	}
	
	</script>

</head>
<body>

<div class="col-md-12">
        <div class="page-header">
    	    <h1>회원가입 </h1>
        </div>
        <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputEmail" placeholder="이메일">
        </div>
        <div>
          <input type="button" value="중복체크" onclick="check_id();">	
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="이름">
          </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" type="checkbox" autocomplete="off" checked>
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit" onclick="send(this.form);">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="submit" onclick="cancle(this.form);">가입취소<i class="fa fa-remove spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>      

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ pageContext.request.contextPath }/resources/bootstrap/join/js/bootstrap.min.js"></script>

</body>
</html>