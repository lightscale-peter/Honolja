<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[쪽지 보내기]</title>
<script type="text/javascript">
	function blank_check(){
		var title = myform.m_title.value;
		var rec = myform.m_id.value;
		var content = myform.m_content.value;
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요.");
			return;
		} //제목 체크
		
		if(rec == null || rec == ""){
			alert("받는 사람을 입력해주세요.");
			return;
		} //수신자 체크
		
		if(content == null || content == ""){
			alert("내용을 입력해주세요.");
			return;
		}//내용 체크
		
		myform.submit();
	}//blank_check end
	
	function close(){
		self.close();
	}
	
</script>
</head>
<body>

<h1>메세지 보내기</h1>

<p> <div align="center">
	<form action="msg_insert.do" method="post" name="myform" id="myform" onsubmit="blank_check(); return false;">
		제목 <input type="text" name="m_title" id="m_title"> <p>
		보내는 사람<input type="text" name="u_id" value="${checked}" readonly/>
		받는 사람 <input type="text" name="m_id" id="m_id" value=""> <br> <p>
		<textarea rows="25" cols="50" name="m_content" id="m_content"></textarea> <!-- 내용 -->
		<br>
		<p>
		<input type="submit" value="보내기">
		<input type="reset" value="새로 작성">
		<input type="button" onclick="javascript:window.close();" value="취소">
	</form>
</div>
</body>
</html>