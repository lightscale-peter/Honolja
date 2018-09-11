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
<label>제목</label>


    <form action="boardinsert.do" method="post"  enctype="multipart/form-data">
   <input type="text" name="b_title" value="제목내용">
    <input type="file" name="b_uploadfilename2" >
       <p>
        <textarea name="b_content"  style="width: 700px; height: 400px;"></textarea>
        <input type="submit" value="등록" />
    </form>
 <a href="board.do">board.jsp</a>
</body>
</html> 