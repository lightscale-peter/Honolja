<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에디터</title>
 
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 
</head>
<script type="text/javascript">


</script>
<body>
  <h2><a href="board.do">게시판</a></h2>
<label>제목</label>

    <form action="boardupdate.do" method="post"  >
  <input type="hidden" name="u_id" value="${dto.u_id}">  회원님 아이디:  ${dto.u_id} <br>
   <input type="hidden" name="b_no" value="${dto.b_no}"> 
   <input type="text"  name="b_title" value="${dto.b_title}">
       <p>
  
        <textarea name="b_content" style="width: 700px; height: 400px;">${dto.b_content}</textarea>
        <input type="submit" value="수정" />
    </form>
 <!--   <a href="board.do">board.jsp</a> -->
</body>
</html> 