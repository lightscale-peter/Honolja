<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[받은 메세지 확인]</title>
<script type="text/javascript">


</script>
</head>
<body>

<h1>받은 메세지 확인</h1>

<p> <div align="center">

<table border="2" align="center" cellpadding="10">
 <tr>
  <input type="hidden" value="${dto.m_no}">
  <td colspan="2"> 제목: ${dto.m_title}</td>
 </tr>
 
 <tr>
  <td>보낸이: ${dto.u_id} </td>
  <td>작성일: <fmt:parseDate value="${dto.m_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/></td>
 </tr>
 
 <%pageContext.setAttribute("newLineChar", "\n");%>
 <tr>
  <td colspan="2">${fn:replace(dto.m_content, newLineChar, "<br/>")}</td>
 </tr>
 
 <tr align="center">
  <td colspan="2">
   <input type="hidden" value="${idx}">
   <input type="hidden" value="${dto.m_no}">
   <input type="button" onclick="location.href='msg_resend.do?userid=${dto.u_id}&resender=${checked}'" value="답장">
   <input type="button" onclick="javascript:window.close();" value="닫기">
  </td>
 </tr> 

</table>


</div>
</body>
</html>