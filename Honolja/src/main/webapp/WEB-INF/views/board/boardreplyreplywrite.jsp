<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>대댓글</title>
</head>
<body>
<form method="post"  action="boardrreplyinsert.do">
    <br>
    <div class="input-group">
      <span class="input-group-addon">댓글</span>
      <input id="msg" type="text" class="form-control" name="brr_content"  placeholder="댓글을 입력하세요.">
    <input type="submit" value="등록" >
        <input type="hidden" name="b_no" value="${b_no}">
        <input type="hidden" name="br_no" value="${br_no}">
    </div>
  </form>

 <form>
<br>
<div class="form-group">
<c:forEach var="dto" items="${rlist}">
    <div class="input-group" >
      <span class="input-group-addon"><i class="glyphicon glyphicon-user">${dto.u_id}</i></span>
      <input id="email" type="text" class="form-control" name="email" placeholder="Email" value="${dto.brr_content} " readonly="readonly">${dto.brr_date}

  <input type="hidden" name="br_no" value="${dto.br_no}" > 
  <input type="hidden" name="b_no" value="${dto.b_no}">
  <a href="boardrreply.do?br_no=${dto.brr_no}">답글달기</a>
  
   <a href="boardreplyedit.do?idx=${dto.b_no}&br_no=${dto.brr_no}">[수정]</a>
 <a href="boardreplydelete.do?idx=${dto.b_no}&br_no=${dto.brr_no}">[삭제]</a>
    </div>
  <br>

</c:forEach>
</div>

</form>
</body>
</html>