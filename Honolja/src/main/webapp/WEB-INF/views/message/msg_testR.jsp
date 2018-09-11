<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[msg_testR.jsp]</title>
	 <link href="css/cut.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript">

</script>

<body>

<h1>임시 페이지</h1>
<p>
<br>


<table border="2" align="center" width=700>

 <tr>
  <td colspan="5"> 읽지 않은 쪽지가 ${cnt}개 있습니다.</td>
 </tr>

 <tr bgcolor="yellow" align="center">
  <td colspan="5">${userid} 님의 받은쪽지함</td>
 </tr>

 <tr align="center">
  <td>No</td>
  <td>제목</td>
  <td width=100>내용</td>
  <td>보낸이</td>
  <td>날짜</td>
 </tr>

<c:forEach var="listR" items="${listR}">
 <tr align="center">
  <td>${listR.m_no}</td>
  <td><a href="msg_detailR.do?idx=${listR.m_no}">${listR.m_title}</a></td>
  <td class="target1"><a href="msg_detailR.do?idx=${listR.m_no}">${listR.m_content}</a></td>
  <td>${listR.u_id}</td>
  <td>${listR.m_date}</td>
 </tr>
 </c:forEach>

</table>

<p>


</body>
</html>