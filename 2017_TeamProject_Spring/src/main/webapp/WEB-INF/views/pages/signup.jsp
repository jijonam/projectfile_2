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
<script type="text/javascript">

	function send(f) {
		
		f.submit();
		
	}
	
	function Reset() {

		$('input[name^=level]').prop('checked', false);
		$('input[name^=tc]').prop('checked', false);
		$('input[name^=book]').prop('checked', false);

	}
	function check(){
		if( $("#level_all").is(':checked') ){
		        $("input[name=level]").prop("checked", true);
		}else{
		    $("input[name=level]").prop("checked", false);
		}		
		if( $("#tc_all").is(':checked') ){
        		$("input[name=tc]").prop("checked", true);
      	}else{
        	$("input[name=tc]").prop("checked", false);
      	}
		if( $("#book_all").is(':checked') ){
    			$("input[name=book]").prop("checked", true);
  		}else{
    		$("input[name=book]").prop("checked", false);
  		}
		
	}
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
						<h2>광고</h2>
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">

								<div class="item active">
									<img src="la.jpg" alt="Los Angeles" style="width: 100%;">
									<div class="carousel-caption">
										<h3>Los Angeles</h3>
										<p>LA is always so much fun!</p>
									</div>
								</div>

								<div class="item">
									<img src="chicago.jpg" alt="Chicago" style="width: 100%;">
									<div class="carousel-caption">
										<h3>Chicago</h3>
										<p>Thank you, Chicago!</p>
									</div>
								</div>

								<div class="item">
									<img src="ny.jpg" alt="New York" style="width: 100%;">
									<div class="carousel-caption">
										<h3>New York</h3>
										<p>We love the Big Apple!</p>
									</div>
								</div>

							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>

	
					
					<div class="container">
					<div id="content">
					<form name="searchForm" id="searchForm" action="lecture_list.do" method="get">
					
					<div class="onlineclass_srch">
					
			        <h3>"온라인 강의찾기"</h3>
			
					<div class="article">
			            <h4 class="fc_point">레벨</h4>
			            <ul id="level_list">
			                <li><input name="level_all" type="checkbox" value="0" onclick="check()" id="level_all"><label for="">전체</label></li>
			                <li><input name="level" type="checkbox" value="초급"><label for="">초급</label></li>
			                <li><input name="level" type="checkbox" value="중급"><label for="">중급</label></li>
			                <li><input name="level" type="checkbox" value="고급"><label for="">고급</label></li>			
			            </ul>
			        </div>
			        <div class="article">
			            <h4 class="fc_point">선생님</h4>
			            <ul id="teacher_list">
			                <li><input name="tc_all" type="checkbox" value="0" onclick="check()" id="tc_all"><label for="">전체</label></li>
			                <li><input name="tc" type="checkbox" value="초급선생님"><label for="">초급선생님</label></li>
			                <li><input name="tc" type="checkbox" value="중급선생님"><label for="">중급선생님</label></li>
			                <li><input name="tc" type="checkbox" value="고급선생님"><label for="">고급선생님</label></li>			               
			            </ul>
			        </div>
			        <div class="article last">
			            <h4 class="fc_point">교재</h4>
			            <ul id="book_list">
			                <li><input name="book_all" type="checkbox" value="0" onclick="check()" id="book_all"><label for="">전체</label></li>
			                <li><input name="book" type="checkbox" value="초급교재"><label for="">초급교재</label></li>
			                <li><input name="book" type="checkbox" value="중급교재"><label for="">중급교재</label></li>
			                <li><input name="book" type="checkbox" value="고급교재"><label for="">고급교재</label></li>
			            </ul>
			        </div>
			    </div>
			        			    
					<div class="section">
					<div class="btn_srch_result">
	            		<h3 class="tit_h4">총 <b class="fc_g">83개</b>의 강의가 검색되었습니다.</h3>
	            		<div class="bt">
	                		<a class="btn_m btn_type2" href="javascript:Reset()"><span>초기화</span></a>
	                		<!-- <a class="btn_m btn_type3" href="#" onclick="send(this.form); return false"><span>조회</span></a> -->
	                		<input value="조회" type="button" onclick="send(this.form);" class="btn_m btn_type3" >
	            		</div>
	        		</div>
	        		</div>
	        	</form>
			    
			    
			    </div>			    
			    </div>			    
			    
				
 				
				<div id="container">				
                <div id="content">     
                
            	
            	<!-- 게시물이 없을 경우 -->
            	<c:if test="${ empty list }">
                	<div align="center" style="color:red;">등록된 강의가 없습니다</div>
                </c:if>
                <c:forEach var="vo" items="${ list }">        
				<form name="signupForm" id="signupForm" action="#" method="get">
				<div class="section">
				
                
                	
				<div class="list_srch_class">
				<div class="article">
				
				
                <div class="sbj">
				    <span class="teacher">
                        <a href="http://www.champstudy.com/?r=champstudy&amp;c=teacher/tc_toeic&amp;tci_id=23">
                        <img style="width: 110px; height: 90px;" alt="" src="/files/teacher/intro/304/0fe971acfde0e541ea10aabca66084e2.png">
                        </a>
                    </span>
                    <h4>
                        ${vo.name }<br>
                        <strong>${ vo.teacher } </strong>
                    </h4>
                    <div class="tip">
                        <span class="txt">해커스영어 토익 총평강의 조회수 1위 (2015.01~11)</span><a class="tiper" href="#;"><!-- tooltip --></a>
                        <div class="ly_tip"><span class="arr"></span>해커스영어 토익 총평강의 조회수 1위 (2015.01~11)</div>
                    </div>
                    <a class="btn_detail" href="http://www.champstudy.com/?r=champstudy&amp;c=teacher/tc_toeic&amp;tci_id=23" target="_blank">선생님 자세히보기 &gt;</a>
				
                </div>
                
                <a class="btn_bxctrl open" href="">
                    <span class="stit">${vo.lecture_level }</span>
                    <span class="arr"></span>
                    <!--<img src="./images/champstudy/applyclass/base_level_tit.png" alt="기초레벨"><span class="bar"></span><img src="./images/champstudy/applyclass/base_level_txt550.png" alt="550점+"><span class="arr"></span>-->
                </a>

                <div class="cnt" style="display: block;">
                    <!-- row -->
                    <div class="row first">
                        <div class="txt">
							<!-- BEST/NEW아이콘이동 -->
							<div class="bx_ico">
								<span class="ico best"></span>
								<span class="ico new"></span>
								<span class="ico ing"></span>
							</div>
							<!-- //BEST/NEW아이콘이동 -->
                            <h5>
                            <a href="/?r=champstudy&amp;c=lecture/lec_toeic&amp;sub=detail&amp;lec_id=11033">
                            ${vo.name }                             </a></h5>
                            <p>토익 기출 어휘 30일 정복! l  <font color="blue">${vo.book }</font></p>
                            <ul>
                                <li><a><span class="ico note"></span>75일(39강)</a></li>
                                <li><a><span class="ico mob"></span>Mobile</a></li>
                                <li><a><span class="ico pc"></span>PC/PMP</a></li>
                                <li class="bar movie">
                                	<a href="javascript:goSampleLecture('http://class.champstudy.com/HLec/intro.php?lec_idx=446&amp;ls_num=2&amp;ls_kind=B&amp;lec_no=11033')">
                                		<span class="ico mov"></span>샘플강의
                                	</a>
                                </li>
                            </ul>
                        </div>
						<div class="bx_right">
							<!-- 교재이미지영역 -->
							<div class="bx_book">
								<img alt="" src="http://hackers.gscdn.com/hackers/files/bookmanager/5ada53eccde4b7ca6da844da4f73576f.png">
							</div>
							<!-- //교재이미지영역 -->
							<ul class="price">
								<li class="buy">
								<strong class="won">${vo.price }원</strong>
									<p class="point"><span class="ico point"></span>${vo.point }점</p>
								</li>
							</ul>
							<ul class="bt">
								<li><a class="btn_m btn_type1 class" href="javascript:goLoginLayer()"><span>수강신청 &gt;</span></a></li>
								<li><a class="btn_m btn_type2" href="${ pageContext.request.contextPath }/pages/myclass_cart_list.do">
									<span>장바구니담기</span>
									</a>
								</li>
							</ul>
						</div>
                    </div>
                    <!-- //row -->
                </div>          	
                
            	</div>
            	</div>            	
            	
            	</div>
            	</form>
            	</c:forEach>
            	</div>            	            	
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





