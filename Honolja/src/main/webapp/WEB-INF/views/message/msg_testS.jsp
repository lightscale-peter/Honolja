<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[msg_testS.jsp]</title>
	 <link href="css/cut.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript">


</script>

<body>

<h1>임시 페이지</h1>
<p>
<br>


<table border="2" align="center" width=700>

 <tr bgcolor="pink" align="center">
  <td colspan="5">${userid} 님의 보낸쪽지함</td>
 </tr>

 <tr align="center">
  <td>No</td>
  <td>제목</td>
  <td width=100>내용</td>
  <td>받는이</td>
  <td>날짜</td>
 </tr>

<c:forEach var="listS" items="${listS}">
 <tr align="center">
  <td>${listS.m_no}</td>
  <td><a href="msg_detailS.do?idx=${listS.m_no}">${listS.m_title}</a></td>
  <td class="target1"><a href="msg_detailS.do?idx=${listS.m_no}">${listS.m_content}</a></td>
  <td>${listS.m_id}</td>
  <td>${listS.m_date}</td>
 </tr>
 </c:forEach>

</table>

<p>


</body>
</html>