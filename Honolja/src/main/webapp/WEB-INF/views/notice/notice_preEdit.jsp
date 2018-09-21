<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[notice_detail.jsp]</title>
</head>

<script type="text/javascript">

	function pop(){
		alert("글이 수정되었습니다.");
		myform.submit();
	}
</script>


<body id="page-top" style="margin-top:51px;" >
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>
<h1>공지사항 수정</h1>
<p>
<br>

<p> <div class="container">
	<form action="notice_edit.do" method="post" name="myform" id="myform" onsubmit="pop(); return false;">
		<input type="hidden" value="${dto.n_no}" name="n_no">
		
	<div class="form-group" style="margin: 0 auto; width:70%;">
		<label for="n_title">Title: </label>
			<input type="text" name="n_title" id="n_title" class="form-control" value="${dto.n_title}"> <p>
			<input type="hidden" value="${checked}" > <!-- 공지 작성자는 admin 고정 -->
	</div>
	
		<input type="hidden" value="${dto.n_viewcnt}" name="n_viewcnt" id="n_viewcnt">
		
	<div class="form-group" style="margin: 0 auto; width:70%;">
		<label for="n_content">Content: </label>
		<textarea class="form-control" rows="30" name="n_content" id="n_content">${dto.n_content}</textarea>
	</div><p>
	
		<br>
			<div align="center">
		<input type="checkbox" id="n_fix" name="n_fix" value="Y">
		<label id="">이 공지사항을 목록 상단에 고정합니다.</label> <!-- Y/N으로 고정 여부값 판단 -->
		<p>
		<input type="submit" class="btn btn-primary" value="수정">
		<input type="reset" class="btn btn-primary" value="새로 작성">
		<input type="button" onclick="location.href='notice.do'" class="btn btn-primary" value="취소">
			</div>
	</form>
</div>

<p>


</body>
</html>