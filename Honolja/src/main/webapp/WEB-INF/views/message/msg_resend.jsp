<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[답장하기]</title>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript">


	function sendcheck() {
			
		var title = myform.m_title.value;
		var rec = myform.m_id.value;
		var content = myform.m_content.value;
		var flag = true;
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요.");
			return;
		} //제목 체크
		
		if(content == null || content == ""){
			alert("내용을 입력해주세요.");
			return;
		}//내용 체크
		
		
			//userid 를 param.
			var msg = $("#myform").serialize();
			
			$.ajax({
				type : 'POST',
				data : msg,
				url : "msg_insertA.do",
				success : function(result) 
				{
					alert("쪽지가 발송되었습니다");
					window.close();
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
	}//sendcheck end

</script>
</head>
<body>

<h1>답장</h1>

<p> <div align="center">
	<form method="post" name="myform" id="myform" onsubmit="sendcheck(); return false;">
		제목 <input type="text" name="m_title" id="m_title"> <p>
		보내는 사람<input type="text" name="u_id" id="u_id" value="${checked}" readonly/> 
		<br> <p> 받는 사람 <input type="text" name="m_id" id="m_id" value="${userid}" readonly> <br> <p>
		<textarea rows="25" cols="50" name="m_content" id="m_content"></textarea> <!-- 내용 -->
		<br>
		<p>
		<input type="submit" name="btn" value="보내기">
		<input type="reset" value="새로 작성">
		<input type="button" onclick="javascript:window.close();" value="취소">
	</form>
</div>
</body>
</html>