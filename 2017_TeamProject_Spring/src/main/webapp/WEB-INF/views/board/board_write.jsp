<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>쓰기</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/bootstrap/board_css/style.css" type="text/css">
<script language=javascript>


function send_check()
{
	var f = document.f;
	if (f.subject.value == '')
	{
		alert('제목을 입력하세요');
		f.subject.focus();
		return false;
	}
	
	if (f.name.value == '')
	{
		alert('이름을 입력하세요');
		f.name.focus();
		return false;
	}
	
	if (f.content.value == '')
	{
		alert('내용을 입력하세요');
		f.content.focus();
		return false;
	}
	
	if (f.pwd.value == '')
	{
		alert('비밀번호를 입력하세요');
		f.pwd.focus();
		return false;
	}

	f.submit();
}



</script>
</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="760" align="center">
<tr>
<td>
<table width="690" height="50" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td><img width="80" height="50" src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/imagesP0043KUI.png"></td>
	</tr>
</table>
<!--타이틀 영역의 끝-->
</td>
</tr>
<tr>
<td>
<form name="f" method="post" action="board_insert.do"> 
<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="120" height="25" class="td_d">제목</td>
		<td class="td_d_1" colspan="3">
		<input name="subject" type="text" class="search" style="width:250px;"></td>
		
	</tr>
	<tr>
		<td height="25" class="td_d_4">작성자</td>
		<td class="td_d_2" colspan="3">
		<input name="name" type="text" class="search" style="width:250px;">
		</td>
	</tr>

	<tr>
	<td class="td_d_4">내용</td>
		<td class="td_d_2" colspan="3">
		
		<TEXTAREA NAME='content' rows="9" cols="65"></TEXTAREA>
		

	</td></tr>
    <tr>
		<td height="25" class="td_d_4">비밀번호</td>
		<td class="td_d_3" colspan="3">
		<input name="pwd" type="password" class="search" style="width:70px;"></td>
	</tr>        
        
	
	
</table>
<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td align="center">
		    <!-- <img onclick="send(this.form);">
		         이렇게 사용하면 안된다
		         (이유:img는 form tag요소가 아님) 
		         
		         단 아래와 같이 할 수 있다
		         주의) onsubmit()자동호출되기 때문에 현재 이벤트 작업후 
		               return false;처리해야된다
		         <input type="image" src="" onclick="send(this.form); return false;">
		         <button value="클릭" onclick="send(this.form); return false;" >
		     -->
			<img src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/btn_reg.gif"  onClick="return send_check();" style="cursor:hand">
			<!-- <input type="image" src="../img/btn_reg.gif" onclick="send(this.form)"> -->
			<img src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/btn_back.gif" onClick="JavaScript:location.href='board_list.do'" style="cursor:hand">
		</td>
	</tr>
</table>

<input type="hidden" name="ip" value="">

</form>
</td>
</tr>
</table>
</body>

</html>