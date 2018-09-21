<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Reply</title>
<meta charset="UTF-8">

<script type="text/javascript">
	  function check( ){
		  var content=myform2.br_content.value;
		 
			if (content == "" || content == null) {
				alert("댓글 입력해주세요.");  
			myform2.br_content.focus();
			return false;
			}
			document.myform2.submit(); 
	  }
	  
	  function del2() {
		  var br_no = document.getElementById("br_no").value;
		  var b_no = document.getElementById("b_no").value;
				if(confirm("댓글을 삭제하시겠습니까?") == true) {
					location.href = "boardreplydelete.do?idx="+b_no+"&br_no="+br_no;
				}
					return false;
				}
	  
	  </script>
</head>


 <form name="myform2" method="post"  action="boardreplyinsert.do" onsubmit="check(); return false;">
    <br>
    <div class="input-group">
      <span class="input-group-addon">댓글</span>
      <input id="msg" type="text" class="form-control" name="br_content"  placeholder="댓글을 입력하세요.">
    <input type="submit" value="등록" >
        <input type="hidden" name="b_no" value="${dto.b_no}">
    </div>
  </form>
  
 <form>
<br>
<div class="form-group">
<label for="comment"> 댓글 ${rcnt}</label>
<c:forEach var="dto" items="${list}">
    <div class="input-group" id="${dto.br_no}">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user">${dto.u_id}</i></span>
      <input id="email" type="text" class="form-control" name="email" placeholder="Email" value="${dto.br_content} " readonly="readonly">${dto.br_date}

  <input type="hidden" id="br_no" name="br_no" value="${dto.br_no}" > 
  <input type="hidden" id="b_no" name="b_no" value="${dto.b_no}">
  <a href="boardrreply.do?idx=${dto.b_no}&br_no=${dto.br_no}">댓글달기</a>
   <input type="button">
   <a href="boardreplyedit.do?idx=${dto.b_no}&br_no=${dto.br_no}">[수정]</a>
 <a href="javascript:void(0);" onclick="del2(); return false; ">[삭제]</a>
    </div>
  <br>
</c:forEach>
</div>

</form>


</body>
</html>
