<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ empty sessionScope.user }">
	<script>
		alert('현재 컨텐츠는 로그인 후에 이용하실수 있습니다');
		location.href='${ pageContext.request.contextPath }/pages/login_form.do';
	</script>
</c:if>
