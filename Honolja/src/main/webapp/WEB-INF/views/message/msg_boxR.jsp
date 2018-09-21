<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[msg_boxR.jsp]</title>
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

<form name="myform" action="msg_deleteR.do" method="post">
	<table border="2" align="center" width=700>
	
	 <tr>
	  <td colspan="5"> &nbsp;읽지 않은 쪽지가 ${cnt}개 있습니다.</td>
	 </tr>
	
	 <tr bgcolor="yellow" align="center">
	  <td><input type="submit" value="삭제"></td>
	  <td colspan="4">${checked} 님의 받은쪽지함</td>
	 </tr>
	
	<tr align="center">
		<td width=50><input type="checkbox" id="allcheck" onclick="allchk();"></td>
		<td width=200>제목</td>
		<td width=200>내용</td>
		<td width=100>보낸이</td>
		<td width=250>날짜</td>
	</tr>
	
	<c:forEach var="listR" items="${listR}">
	 <tr align="center">
		<td><input type="checkbox" id="n_ck" name="n_ck" value="${listR.m_no}"></td>
		<td><a href="javascript:void(window.open('msg_detailR.do?idx=${listR.m_no}', 'text', 'width=440, height=650, top=100, left=100'))">${listR.m_title}</a></td>
		<td class="target1">
			<c:if test="${listR.m_check eq false}">★</c:if>
			<a href="javascript:void(window.open('msg_detailR.do?idx=${listR.m_no}', 'text', 'width=440, height=650, top=100, left=100'))">${listR.m_content}</a>
		</td>
		<td>${listR.u_id}</td>
		<td><fmt:parseDate value="${listR.m_date}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
	      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd HH:mm"/></td>
	 </tr>
	 </c:forEach>
	
	</table>
</form>

<p>


</body>
</html>