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
<title>[보낸 메세지 확인]</title>
<script type="text/javascript">

 function check(){
	 
	 var m_check = myform.m_check.value;
	 var c = confirm("메세지 발송을 취소하시겠습니까?");
	 var u_id = myform.u_id.value;
	 
	 if ( c == true ){
		if ( m_check == "true" ){
			alert("수신 확인 된 메세지는 삭제할 수 없습니다.");
			return;
		}else if ( m_check == "false" ){
			window.opener.document.location.href = "msg_cancel.do?m_no="+${dto.m_no}+"&m_check="+${dto.m_check}+"&userid="+u_id;
			alert("메세지 발송이 취소되었습니다.");
			self.close();
		}
	 }//if end
 }//check end
 

</script>
</head>
<body>

<<<<<<< HEAD
<p><br>
=======
<h1>메세지 확인</h1>
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja

<<<<<<< HEAD
<div class="container">

	<div align="right">
		<c:choose>
			<c:when test="${dto.m_check eq true}"><span class="label label-info">읽음</span></c:when>
			<c:otherwise><span class="label label-info">읽지 않음</span></c:otherwise>
   		</c:choose>
	</div>

	<form name="myform">
		<table class="table table-bordered">
		<tr>
			<td colspan="2"> <b>Title: </b> ${dto.m_title}</td>
		</tr>
		<tr>
			<td colspan="2"><b>To: </b> ${dto.m_id} </td>
		</tr>
		<tr>
			<td colspan="2" style="color: gray;"> 
			<fmt:parseDate value="${dto.m_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
     		<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>
 
	<%pageContext.setAttribute("newLineChar", "\n");%>
		<tr>
			<td colspan="2">${fn:replace(dto.m_content, newLineChar, "<br/>")}</td>
 		</tr>
=======
<p> <div align="center">
<form name="myform">
	<table border="2" align="center" cellpadding="10">
		<tr>
			<input type="hidden" value="${dto.m_no}">
			<td colspan="2"> 제목: ${dto.m_title}</td>
		</tr>
		<tr>
			<td>받는이: ${dto.m_id} </td>
			<td>작성일: <fmt:parseDate value="${dto.m_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
 
<<<<<<< HEAD
		<tr align="center">
			<td colspan="2">
				<input type="hidden" value="${idx}">
				<input type="hidden" id="m_check" value="${dto.m_check}">
							
				<input type="hidden" id="u_id" value="${checked}">
				<input type="button" class="btn" onclick="check();" value="발송 취소">   
				<input type="button" class="btn" onclick="javascript:window.close();" value="닫기">
			</td>
		</tr> 
=======
 <%pageContext.setAttribute("newLineChar", "\n");%>
		<tr>
			<td colspan="2">${fn:replace(dto.m_content, newLineChar, "<br/>")}</td>
 		</tr>
 
 <tr align="center">
  <td colspan="2">
   <input type="hidden" value="${idx}">
   <input type="hidden" id="m_check" value="${dto.m_check}">
   <c:choose>
	<c:when test="${dto.m_check eq true}">[읽음]</c:when>
	<c:otherwise>[읽지 않음]</c:otherwise>
   </c:choose>
   <input type="hidden" id="u_id" value="${checked}">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="button" onclick="check();" value="발송 취소">   
   <input type="button" onclick="javascript:window.close();" value="닫기">
  </td>
 </tr> 
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja

<<<<<<< HEAD
		</table>
	</form>
=======
</table>
</form>

>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja

</div>

</body>
</html>