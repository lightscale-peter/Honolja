<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form>
<br>
<div class="form-group">
<c:forEach var="dto" items="${rlist}">
    <div class="input-group" >
      <span class="input-group-addon"><i class="glyphicon glyphicon-user">${dto.u_id}</i></span>
      <input id="email" type="text" class="form-control" name="email" placeholder="Email" value="${dto.brr_content} " readonly="readonly">${dto.brr_date}

  <input type="hidden" name="br_no" value="${br_no}" > ${br_no}
  <input type="hidden" name="b_no" value="${b_no}">${b_no}
  <a href="boardrreply.do?idx=${dto.b_no}&br_no=${dto.brr_no}">답글보기</a>
   <a href="boardreplyedit.do?idx=${dto.b_no}&br_no=${dto.brr_no}">[수정]</a>
 <a href="boardreplydelete.do?idx=${dto.b_no}&br_no=${dto.brr_no}">[삭제]</a>
 <input type="button" onclick="replyview;">
 
    </div>
  <br>
</c:forEach>
</div>

</form>



</body>
</html>