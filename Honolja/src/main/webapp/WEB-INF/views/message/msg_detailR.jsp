<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[msg_detailR.jsp]</title>
<script type="text/javascript">


</script>
</head>
<body>

<h1>메세지 보내기</h1>

<p> <div align="center">

<table border="2" align="center" cellpadding="10">
 <tr>
  <td>No. ${dto.m_no}</td>
  <td> 제목: ${dto.m_title}</td>
 </tr>
 
 <tr>
  <td>보낸이: ${dto.u_id} </td>
  <td>작성일: ${dto.m_date}</td>
 </tr>
 
 <%pageContext.setAttribute("newLineChar", "\n");%>
 <tr>
  <td colspan="2">${fn:replace(dto.m_content, newLineChar, "<br/>")}</td>
 </tr>
 
 <tr align="center">
  <td colspan="2">
   <input type="hidden" value="${idx}">
   <input type="button" onclick="location.href='msg_send.do?userid=${userid}'" value="답장">
   <input type="button" onclick="location.href='msg_testR.do?userid=${dto.m_id}'" value="닫기">
  </td>
 </tr> 

</table>


</div>
</body>
</html>