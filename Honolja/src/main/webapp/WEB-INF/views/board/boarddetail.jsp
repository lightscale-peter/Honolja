<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에디터</title>
 
 
</head>
<script type="text/javascript">


</script>
<body>
<label>제목</label>
<!--asadf-->

   <input type="text"  value="${dto.b_title}">
       <p>
        <input type="text"  style="width: 700px; height: 400px;" value="${dto.b_content}">
 <a href="board.do">board.jsp</a>
</body>
</html> 