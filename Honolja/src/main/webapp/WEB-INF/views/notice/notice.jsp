<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[notice.jsp]</title>
</head>
<body>

	<jsp:include page="mypage_menu.jsp" />

<h1>공지사항</h1>
<p>
<a href="msg_testR.do?userid=mtest">임시 받은쪽지함</a>
<a href="msg_testS.do?userid=testuser">임시 보낸쪽지함</a>
<a href="msg_send.do?userid=testuser">쪽지 보내기</a>
<br>


<p>
<br>

<table border="2" align="center" width=900>
 <tr align="center" bgcolor=yellow>
	<td width=50>No</td>
	<td>제목</td>
	<td width=100>작성자</td>
	<td width=200>작성일</td>
	<td width=50>조회수</td>
 </tr>
 
  <!-- 상단공지 -->
  
  
  <!-- 일반공지 -->
 
  <c:set var="reversecnt" value="${reversecnt+1}"></c:set>
  
  <c:forEach items="${dto}" var="list">
 <tr align="center">
	<td>${reversecnt=reversecnt-1}</td>
 	<td><a href="notice_detail.do?idx=${list.n_no}">${list.n_title}</a></td>
 	<td>${list.u_id}</td>
 	<td>${list.n_date}</td>
 	<td>${list.n_viewcnt}</td>
 </tr>
 </c:forEach>
 
 <tr align="center">
 
 <!-- 페이징 -->
 <td colspan="5">
 
 	<c:if test="${startpage>5}">
 	 <a href="notice.do?pageNum=${startpage-5}${returnpage}">[이전]</a>
 	</c:if>
 
 	<c:forEach var="i" begin="${startpage}" end="${endpage}">
 	 <c:choose>
 	 	<c:when test="${pageNUM==i}"><font color=red>[${i}]</font></c:when>
 	 	<c:otherwise><a href="notice.do?pageNum=${i}${returnpage}">[${i}]</a></c:otherwise>
 	 </c:choose>
 	</c:forEach>
 	
 	<c:if test="${endpage<pagecount}">
 	 <a href="notice.do?pageNum=${startpage+5}${returnpage}">[다음]</a>
 	</c:if>
 </td>
 </tr>
 
 
 <tr align="center">
 <td colspan="5">
  <form name="search" action="notice.do">
 	<select name="keyfield" value="${skey}">
 	 <option value="n_title" <c:if test="${skey eq 'n_title'}">selected</c:if>>제목검색</option>
 	 <option value="n_content" <c:if test="${skey eq 'n_content'}">selected</c:if>>내용검색</option>
 	</select>
 	<input type="text" name="keyword" value="${sval}">
 	<input type="submit" value="검색">
   </form>
  </td>
 </tr>

 <tr align="right">
 	<td colspan="5">
	 <input type="button" value="글 작성" onclick="location.href='notice_insert.do'"> &nbsp;
 	</td> 
 </tr>

</table>


	
	




</body>
</html>