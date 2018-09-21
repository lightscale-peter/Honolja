<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
=======
<meta charset="UTF-8">
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
<title>[받은 메세지 확인]</title>
<script type="text/javascript">


</script>
</head>
<body>

<<<<<<< HEAD
<p><br>
=======
<h1>받은 메세지 확인</h1>
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja

<div align="center">

<<<<<<< HEAD
<div class="container">
	<table class="table table-bordered">
		<tr>
			<input type="hidden" value="${dto.m_no}">
			<td colspan="2"> <b>Title: </b> ${dto.m_title}</td>
		</tr>
=======
<table border="2" align="center" cellpadding="10">
 <tr>
  <input type="hidden" value="${dto.m_no}">
  <td colspan="2"> 제목: ${dto.m_title}</td>
 </tr>
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
 
<<<<<<< HEAD
		<tr>
			<td colspan="2"><b>From: </b> ${dto.u_id} </td>
		</tr>
=======
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
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja

		<tr>
			<td colspan="2" style="color: gray;">
				<fmt:parseDate value="${dto.m_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      			<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/>
      		</td>
		</tr>
 
		<%pageContext.setAttribute("newLineChar", "\n");%>
		<tr>
			<td colspan="2">${fn:replace(dto.m_content, newLineChar, "<br/>")}</td>
		</tr>
 
		<tr align="center">
			<td colspan="2">
				<input type="hidden" value="${idx}">
				<input type="hidden" value="${dto.m_no}">
				<input type="button" class="btn" onclick="location.href='msg_resend.do?userid=${dto.u_id}&resender=${checked}'" value="답장">
				<input type="button" class="btn" onclick="javascript:window.close();" value="닫기">
			</td>
		</tr> 

	</table>
</div>

</div>

</body>
</html>