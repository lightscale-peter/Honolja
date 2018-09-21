<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 

<title>[notice_insert.jsp]</title>
<script type="text/javascript">


	function blank_check(){
		var title = myform.n_title.value;
		var content = myform.n_content.value;
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요.");
			return;
		}
		
		if(content == null || content == ""){
			alert("내용을 입력해주세요.");
			return;
		}//content end
		
		myform.submit();
	}//blank_check end		
</script>
</head>
<body id="page-top" style="margin-top:51px;" >
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>

<p><br><p><br>  

<div class="container">

<form action="notice_insert.do" method="post" name="myform" id="myform" onsubmit="blank_check(); return false;">
	<div class="form-group" style="margin: 0 auto; width:70%;">
		<label for="n_title">Title: </label>
			<input type="text" name="n_title" id="n_title" class="form-control"> <p>
			<input type="hidden" value="${checked}" > <!-- 공지 작성자는 admin 고정 -->
	</div>
	
	<div class="form-group" style="margin: 0 auto; width:70%;">
		<label for="n_content">Content: </label>
		<textarea class="form-control" rows="30" name="n_content" id="n_content"></textarea>
	</div><p>

	<div align="center">
		<input type="checkbox" id="n_fix" name="n_fix" value="Y">
		<label id="">이 공지사항을 목록 상단에 고정합니다.</label> <br>
			<input type="submit" class="btn btn-primary" value="등록">
			<input type="reset" class="btn btn-primary" value="새로 작성">
			<input type="button" onclick="location.href='notice.do'" class="btn btn-primary" value="취소">
	</div>
</form>
</div>

</body>

</html>