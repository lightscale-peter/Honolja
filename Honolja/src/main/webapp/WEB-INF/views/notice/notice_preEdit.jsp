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


<body>

<h1>공지사항 수정</h1>
<p>
<br>

<p> <div align="center">
	<form action="edit.do" method="post" name="myform" id="myform" onsubmit="pop(); return false;">
		<input type="hidden" value="${dto.n_no}" name="n_no">
		제목 <input type="text" value="${dto.n_title}" name="n_title" id="n_title"> <p>
		<input type="hidden" value="${dto.n_viewcnt}" name="n_viewcnt" id="n_viewcnt">
		<textarea rows="50" cols="150" name="n_content" id="n_content">${dto.n_content}</textarea>
		<br>
		<input type="checkbox" id="n_fix" name="n_fix" value="Y">
		<label id="">이 공지사항을 목록 상단에 고정합니다.</label> <!-- Y/N으로 고정 여부값 판단 -->
		<p>
		<input type="submit" value="수정">
		<input type="reset" value="새로 작성">
		<input type="button" onclick="location.href='notice.do'" value="취소">
	</form>
</div>

<p>


</body>
</html>