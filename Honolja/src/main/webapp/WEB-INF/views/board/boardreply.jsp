<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Reply</title>
<meta charset="UTF-8">
</head>
  <div class="container">
 <form method="post"  action="boardreplyinsert.do">
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
      <input id="email" type="text" class="form-control" name="email" placeholder="Email" value="${dto.br_content}" readonly="readonly">

  <input type="hidden" name="br_no" value="${dto.br_no}" > 
  <input type="hidden" name="b_no" value="${dto.b_no}">
   <a href="boardreplyedit.do?idx=${dto.b_no}&br_no=${dto.br_no}">[수정]</a>
 <a href="boardreplydelete.do?idx=${dto.b_no}&br_no=${dto.br_no}">[삭제]</a>
 
    </div>
  <br>

</c:forEach>
</div>

</form>
</div>

    

  
</body>
</html>
