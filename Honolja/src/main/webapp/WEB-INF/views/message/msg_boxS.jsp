<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[msg_boxS.jsp]</title>
	 <link href="css/cut.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript">

function allchk() {
	 var param = document.getElementById("allcheck").checked;
	 var check = document.getElementsByName('n_ck');
	 for(i=0; i<check.length; i++) {
		 check.item(i).checked = param;
	 }//for end
	 
	}//end

</script>

<body>

<jsp:include page="/WEB-INF/views/mypage/mypage_menu.jsp"/>

<form name="myform" action="msg_deleteS.do?userid=${checked}" method="post">
<table border="2" align="center" width=700>

 <tr bgcolor="pink" align="center">
  <td><input type="submit" value="삭제"></td>
  <td colspan="4">${checked} 님의 보낸쪽지함</td>
 </tr>

 <tr align="center">
  <td width=50><input type="checkbox" id="allcheck" onclick="allchk();"></td>
  <td width=200>제목</td>
  <td width=200>내용</td>
  <td width=100>받는이</td>
  <td width=250>날짜</td>
 </tr>

<c:forEach var="listS" items="${listS}">
 <tr align="center">
  <td><input type="checkbox" id="n_ck" name="n_ck" value="${listS.m_no}"></td>
  <td><a href="javascript:void(window.open('msg_detailS.do?idx=${listS.m_no}', 'text', 'width=430, height=530, top=100, left=100'))">${listS.m_title}</a></td>
  <td class="target1"><a href="javascript:void(window.open('msg_detailS.do?idx=${listS.m_no}', 'text', 'width=430, height=530, top=100, left=100'))">${listS.m_content}</a></td>
  <td>${listS.m_id}</td>
  <td><fmt:parseDate value="${listS.m_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/></td>
 </tr>
 </c:forEach>

</table>
</form>
<p>


</body>
</html>