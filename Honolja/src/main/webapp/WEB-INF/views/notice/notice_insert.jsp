<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<body>

<h1>공지사항</h1>

<p> <div align="center">
	<form action="insert.do" method="post" name="myform" id="myform" onsubmit="blank_check(); return false;">
		제목 <input type="text" name="n_title" id="n_title"> <p>
		<input type="hidden" value="" > <!-- 공지 작성자는 admin 고정 -->
		<textarea rows="50" cols="150" name="n_content" id="n_content"></textarea> <!-- 내용 -->
		<br>
		<input type="checkbox" id="n_fix" name="n_fix" value="Y">
		<label id="">이 공지사항을 목록 상단에 고정합니다.</label> <!-- Y/N으로 고정 여부값 판단 -->
		<p>
		<input type="submit" value="등록">
		<input type="reset" value="새로 작성">
		<input type="button" onclick="location.href='notice.do'" value="취소">
	</form>
</div>
</body>
</html>