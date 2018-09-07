<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[login_popup.jsp]</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body style="text-align: center;margin: 50px;">

	
	<c:if test="${param.id != null }">
		<script>
			${script}
		</script>
	</c:if>
	


	<form class="form-horizontal" action="/honolja/popup.do" method = "get">
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">Id:</label>
			<div class="col-sm-10">
			
				<!-- 아이디 입력 -->
				<input type="text" name = "id" class="form-control" id="id" placeholder="Enter id">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">Password:</label>
			<div class="col-sm-10"> 
			
				<!-- 비밀번호 입력 -->
				<input type="password" name = "pwd" class="form-control" id="pwd" placeholder="Enter password">
			</div>
		</div>
		<div class="form-group"> 
			<div class="col-sm-offset-2 col-sm-10">
				<div class="checkbox">
				
					<!-- 아이디 기억 -->
					<label><input type="checkbox"> Remember me</label>
				</div>
			</div>
		</div>
		<div class="form-group"> 
			<div class="col-sm-offset-2 col-sm-10">
				
				<!-- 오픈한 주소 기억 : 로그인 후, 해당 페이지 새로고침에 사용 -->
				<input type = "hidden" name = "host" value = "${param.host}">
				<button type="submit" class="btn btn-default">로그인</button>
				&nbsp;&nbsp;
				<button type="reset" class="btn btn-default">다시쓰기</button>
			</div>
		</div>
	</form>
</body>
</html>