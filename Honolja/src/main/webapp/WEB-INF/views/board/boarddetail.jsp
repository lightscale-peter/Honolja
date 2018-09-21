<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	//참여 버튼 클릭
	$("#btn_member").click(function() {

		var b_member = $("#b_member").val();
		var b_member2 = $("#b_member2").val();
		var b_no = $("#b_no").val();
		var u_id = $("#u_id").val();
		
		if(b_member == b_member2){
			alert("빈자리가 없습니다");
			return false;
		}
		
		$.ajax({
			async : true,
			type : 'POST',
			data : {"b_member2" : b_member2, "b_no" : b_no, "u_id" : u_id},
			url : "boardmember.do",
			dataType : "text",
			success : function(data) {
				if(data == "success")
				{
					alert("참여하였습니다");
					location.reload();
				}else if (data == "false"){
					alert("게시자는 참여할 수 없습니다");
					return false;
				}else if(data == "fail"){
					alert("중복참여 불가능합니다");
					return false;
				}
			},
			error : function(error) {
				alert("error : " + error);
			}
		});
	});
});//아이디 중복체크 end
</script>
<title>게시판 디테일</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2><a href="board.do">게시판</a></h2>
<form>
<div class="form-group">
<label for="usr" >게시자:</label>
<input type="text"  class="form-control" id="u_id" readonly="readonly" value="${dto.u_id}" >
<br>
<label for="usr" >제목:</label>
<input type="text"  class="form-control" id="usr" readonly="readonly" value="${dto.b_title}" >

<br>
<input type="hidden" id="b_no" value="${dto.b_no}">
<input type="hidden" id="b_member2" value="${dto.b_member2}">
<input type="hidden" id="b_member" value="${dto.b_member}">
참여&nbsp;&nbsp;&nbsp;${dto.b_member2}/${dto.b_member}
&nbsp;<input type="button" id="btn_member" value="참여">
<br>
    
<br> <label for="comment" >Comment:</label>
<textarea name="b_content"  class="form-control" rows="10" id="comment"  readonly="readonly">${dto.b_content} 

</textarea>
  
</div>
 
</form>
    <c:if test="${dto.b_originalfilename  != null }"><img src ='${pageContext.request.contextPath}/resources/upload/${img_file_name}' width=250 height=300 border=0> </c:if>
 <c:import url="/boardreply.do" />
 <a href="boardedit.do?idx=${dto.b_no}">[수정]</a>
 <a href="boarddelete.do?idx=${dto.b_no}">[삭제]</a>
 </div>
	
</body>
</html> 