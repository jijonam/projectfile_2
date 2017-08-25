<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>게시판</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/bootstrap/board_css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html;">
<script type="text/javascript">
function find()
{
   var search      = document.getElementById("search").value;
   var search_text = document.getElementById("search_text").value;
   
   if(search!="" && search_text==""){
	 alert('검색어를 입력하세요!!');
	 document.getElementById("search_text").focus();
	 return;
   }
   
   var url = "list.do";
   var param = "search="+search+"&search_text="
               + encodeURIComponent(search_text);
   
   location.href=url + "?" + param;
	
}
//초기화 함수
window.onload=function(){
	
	var search_array = ['',
		                'name',
		                'subject',
		                'content',
		                'name_subject_content'];
	var search = '${ param.search }';
	
	var search_select = document.getElementById("search");
	
	for(var i=0;i<search_array.length;i++){
		if(search==search_array[i]){
			search_select[i].selected=true;
			break;
		}
	}
};

</script>

</head>

<body>
	<jsp:include page="index.jsp" />
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
				
				
					<div class="container">
						<h3>토익</h3>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#">Home</a></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">토익 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${ pageContext.request.contextPath }/pages/signup_page.do">수강신청</a></li>
									<li><a href="${ pageContext.request.contextPath }/board/board_list.do">게시판</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">토플<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">수강신청</a></li>
									<li><a href="#">게시판</a></li>
								</ul></li>
							<li><a href="#">교재</a></li>
							<li><a href="#">마이클래스</a></li>
						</ul>
					</div>
					
					<div class="container">
						<table>
							<tr>
							<img width="80" height="50" src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/imagesP0043KUI.png">
								<td>
									
									<!-- 검색 메뉴 -->
									<select id="search">
											<option value="">전체</option>
											<option value="name">이름</option>
											<option value="subject">제목</option>
											<option value="content">내용</option>
											<option value="name_subject_content">이름+제목+내용</option>
									</select>
 									<input id="search_text"
										value="${ empty param.search ? '' : param.search_text }">
									
									<input id="search" type="image"
										src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/search_button.jpg"
										width="60" height="20" onclick="find();">
							</tr>
							<tr>
								<td>
									<!--LIST START-->
									<table width="690" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table width="690" border="0" cellspacing="0"
													cellpadding="0">

													<!-- 제목 -->
													<tr>
														<td width="50" class="td_a">번호</td>
														<td width="2" class="td_b"><img
															src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/td_bg_01.gif"></td>
														<td class="td_b" width="300">제목</td>
														<td width="2" class="td_b"><img
															src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/td_bg_01.gif"></td>
														<td width="90" class="td_b">작성자</td>
														<td width="2" class="td_b"><img
															src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/td_bg_01.gif"></td>
														<td width="90" class="td_b">작성일</td>
														<td width="2" class="td_b"><img
															src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/td_bg_01.gif"></td>
														<td width="60" class="td_c">조회수</td>
													</tr>

													<!-- 게시물 데이터 -->
													<!-- for(BoardVo vo : list) -->
													<c:forEach var="vo" items="${ list }">
														<tr>
															<td align="center" class="td_a_1">${ vo.rank }</td>
															<!-- 번호 -->
															<td class="td_b_1"><img
																src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/td_bg_02.gif"></td>
															<td class="td_b_1 left">
																<!-- 답글에 대한 들여쓰기 --> <c:forEach begin="1"
																	end="${ vo.depth }">
																   &nbsp;&nbsp;
																</c:forEach> <!-- 답글이면 ㄴ 달아라  --> <c:if test="${ vo.depth ne 0 }">
				 	  												└
																</c:if> <a
																href="board_view.do?idx=${ vo.idx }&page=${ empty param.page ? 1 : param.page }&search=${param.search}&search_text=${param.search_text}"
																class="num"> ${ vo.subject }<!-- 제목 -->
															</a>
															</td>
															<td class="td_b_1"><img
																src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/td_bg_02.gif"></td>
															<td align="center" class="td_b_1">${ vo.name }</td>
															<!-- 작성자 -->
															<td class="td_b_1"><img
																src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/td_bg_02.gif"></td>
															<td align="center" class="td_b_1">${ vo.regdate }</td>
															<!-- 작성일 -->
															<td class="td_b_1"><img
																src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/td_bg_02.gif"></td>
															<td align="center" class="td_c_1">${ vo.readhit }</td>
															<!-- 조회수 -->
														</tr>
													</c:forEach>

													<!-- 데이터가 없을경우  -->
													<c:if test="${ empty list }">
														<tr>
															<td align="center" colspan="11" width="100%" height="50"
																style="border: 1 solid #efefef">현재 등록된 글이 없습니다.</td>
														</tr>
													</c:if>
												</table>
											</td>
										</tr>
										<tr>
											<td height="8"></td>
										</tr>
										<tr>
											<td>
												<table width="690" border="0" cellpadding="0"
													cellspacing="0" bgcolor="#F1F5F4">
													<tr>
														<td width="7"><img
															src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/search_bg_01.gif"></td>
														<td class="f11" align="center" style="font-size: 20pt;">
															<hr> <!-- 페이징 메뉴 --> ${ pageHtml }

														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td height="5"></td>
										</tr>
										<tr>
											<td><img
												src="${ pageContext.request.contextPath }/resources/bootstrap/board_img/btn_reg.gif"
												onClick="JavaScript:location.href='board_insert_form.do'"
												style="cursor: hand"></td>
										</tr>

									</table> <!--WRITE,MODIFY,REPLY END-->
								</td>
							</tr>
						</table>
					</div>
					
					
				</div>
				<!-- /.col-lg-12 -->
			</div>
            <!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->

</body>

</html>