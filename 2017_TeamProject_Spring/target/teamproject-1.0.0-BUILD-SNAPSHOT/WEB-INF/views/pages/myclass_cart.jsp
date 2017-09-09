<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인상태 체크 -->
<%@include file="../check_login.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${ pageContext.request.contextPath }/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
									<li><a href="#">게시판</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">토플<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">수강신청</a></li>
									<li><a href="#">게시판</a></li>
								</ul></li>
							<li><a href="#">교재</a></li>
							<li><a href="${ pageContext.request.contextPath }/pages/myclass.do">마이클래스</a></li>
						</ul>
					</div>

					<div class="container">
						<h2>MyClass</h2>
						<div class="myclass_div_1">
						<ul class="myclass_ul_1">
							<li>
								<strong>강의관리</strong>
								<div class="myclass_div_2">
								<ul>
									<li><a href="${ pageContext.request.contextPath }/pages/myclass_lecture.do">일반강의</a></li>
									<li><a href="#">프리패스</a></li>
									<li><a href="#">모의고사</a></li>									
								</ul>
								</div>							
							</li>				
										
							<li>
								<strong>수강관리</strong>
								<div class="myclass_div_2">
								<ul>
									<li><a href="#">일시정지 신청</a></li>
									<li><a href="#">수강연장 신청</a></li>
									<li><a href="#">수강 및 출석확인증 출력</a></li>									
								</ul>
								</div>							
							</li>
							
							<li>
								<strong>결제관리</strong>
								<div class="myclass_div_2">
								<ul>
									<li><a href="${ pageContext.request.contextPath }/pages/myclass_cart_list.do">장바구니</a></li>
									<li><a href="#">내 포인트 확인하기</a></li>
									<li><a href="#">강의결제 내역</a></li>									
								</ul>
								</div>							
							</li>						
						</ul>
						</div>
					</div>
					
			

					<div class="container">
						<h2>장바구니</h2>
						
						<table class="table table-hover">
							<thead>
								<tr>
									<th>상품정보</th>
									<th>선생님</th>
									<th>상품금액</th>
									<th>할인금액</th>
									<th>결제금액</th>
								</tr>
							</thead>
							<tbody>
							
							<c:if test="${ empty requestScope.list }">
								<tr>
								<td colspan="5" align="center">
									<p style="color: red;">등록된 상품이 없습니다</p>
								</td>
								</tr>
							</c:if>
							<c:forEach var="lecture_cart" items="${ list }">
								<tr>
									<td>John</td>
									<td>Doe</td>
									<td>john@example.com</td>
									<td>500</td>
									<td>ohn@example.com</td>
								</tr>
							</c:forEach>
							
								
								
								
							</tbody>
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