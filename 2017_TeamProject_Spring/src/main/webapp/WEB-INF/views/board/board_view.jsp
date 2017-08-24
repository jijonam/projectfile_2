<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<link rel="stylesheet" href="../startbootstrap-sb-admin-2-gh-pages/board/css/style.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script language="JavaScript">
	
	function del(){
		var f = document.f;
		var idx = f.idx.value;//hidden
		var c_pwd = f.c_pwd.value;
		if(c_pwd==''){
			alert('삭제 비밀번호를 입력하세요');
			f.c_pwd.focus();
			return;
		}
		//ajax로 비번 맞는지 확인
		var url = "check_pwd.do";// action.BoardCheckPwdAction
		var param="idx="+idx+"&c_pwd="
		          + encodeURIComponent(c_pwd);
		//ajax요청(httpRequest.js 또는 $.ajax() 중 편한것 쓸것)
		$.ajax({
			url: 'check_pwd.do',
			data:{'idx':idx,'c_pwd':encodeURIComponent(c_pwd)},
			success: function(data){
				//alert(data);
				var json = eval(data);//Text->객체
				// json = ['result':'diff'];
				if(json[0].result =='diff'){
					alert('비밀번호가 틀립니다!!');
					return;
				}
				//삭제확인
				if(confirm('정말 삭제할래?')==false)return;
				//삭제수행    BoardDeleteAction
				location.href='delete.do?idx='+idx+"&page=${ param.page }";
			}
		});
	}
	
	function modify(){
		var f = document.f;
		var idx = f.idx.value;//hidden
		var c_pwd = f.c_pwd.value;
		if(c_pwd==''){
			alert('수정 비밀번호를 입력하세요');
			f.c_pwd.focus();
			return;
		}

		$.ajax({
			url: 'check_pwd.do',
			data:{'idx':idx,'c_pwd':encodeURIComponent(c_pwd)},
			success: function(data){
				//alert(data);
				var json = eval(data);//Text->객체
				// json = ['result':'diff'];
				if(json[0].result =='diff'){
					alert('비밀번호가 틀립니다!!');
					return;
				}
				
				//수정폼 띄우기  BoardModifyFormAction
				//  board_write.jsp->board_modify.jsp
				location.href='modify_form.do?idx='+idx+"&page=${ param.page }";
			}
		});
    }
	
	
	function reply(){

		var f = document.f;
		f.method = 'GET';
		//BoardReplyFormAction
		f.action = 'reply_form.do';
		f.submit();
		
        
    }
	
</script>
</HEAD>

<BODY>
<table width="690" height="50" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="30" />
		<td><img width="80" height="50" src="../startbootstrap-sb-admin-2-gh-pages/board/img/imagesP0043KUI.png"></td>
	</tr>
	
</table>

<form name="f" method="post">
<input type="hidden" name="idx" value="${ vo.idx }">
<input type="hidden" name="page" value="${ param.page }">
<table width="690" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="120" height="25" class="td_d">제목</td>
		<td class="td_d_1">${ vo.subject }</td>
	</tr>
	<tr>
		<td width="120" height="25" class="td_d_4">작성자</td>
		<td class="td_d_2">${ vo.name }</td>
	</tr>
	<tr>
		<td width="120" height="25" class="td_d_4">작성일</td>
		<td class="td_d_2">${ vo.regdate }</td>
	</tr>
	<tr>
		<td width="120" class="td_d_4">내용</td>
		<td class="td_d_3" width="570" style="word-wrap:break-word;word-break:break-all">
			<pre>${ vo.content }</pre>
		</td>
	</tr>
	
	<tr>
		<td width="120" height="25" class="td_d_4">비밀번호(${ vo.pwd })</td>
		<td class="td_d_2">
		   <input type="password" name="c_pwd">
		</td>
	</tr>
	
	
	
</table>

<table width="690" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td>
			<img src="../startbootstrap-sb-admin-2-gh-pages/board/img/btn_list.gif" onClick="javaScript:location.href='list.do?page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'" style="cursor:hand">
			
			<!-- 전체내용일때만 -->
			<c:if test="${ empty param.search }">
				<c:if test="${ vo.depth eq 0 }">
				   <img src="../startbootstrap-sb-admin-2-gh-pages/board/img/btn_reply.gif" onClick="reply()" style="cursor:hand">
				</c:if>
				<img src="../startbootstrap-sb-admin-2-gh-pages/board/img/btn_modify.gif" onClick="modify()" style="cursor:hand">
		    	<img src='../startbootstrap-sb-admin-2-gh-pages/board/img/btn_delete.gif' onClick='del()' style='cursor:hand'>
	    	</c:if>
	    	
	    	
	    	
		</td>
	</tr>
</table>
</form>

<style>
  #comment_area{
     width: 700px;
  }
  
  #comment_input{
     width: 50%;
  }
  
  #comment_input table,textarea{
     width: 100%;
  }
  
  #comment_input input[type='button']{
  	 width: 120px;
  	 height: 30px;
  }
  
</style>

</BODY>
</HTML>