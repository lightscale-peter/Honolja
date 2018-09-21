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
    <h2><a href="board.do">게시판</a></h2>
  <div class="container">
 <form method="post"  action="boardreplyupdate.do">
    <br>
    <div class="input-group">
      <span class="input-group-addon">댓글</span>
      <input id="msg" type="text" class="form-control" name="br_content"  value="${dto.br_content}">
      <input type="hidden" name="b_no" value="${dto.b_no}">
      <input type="hidden" name="br_no" value="${dto.br_no}">
    <input type="submit" value="등록" >  
    </div>
  </form>
</div>
    

  
</body>
</html>
