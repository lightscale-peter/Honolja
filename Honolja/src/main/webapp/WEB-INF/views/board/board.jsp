<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임게시판</title>
</head>
<body>


<table border="1" width=900>
<tr>
<td colspan="6" align="center">공지사항 ${dd}</td>
</tr>

<tr height=50 align="center">

<td>행번호</td> <td>제목</td> <td>작성자id</td>
<td>작성시간</td> <td>조회</td> <td>참여</td> 
</tr>

<c:forEach var="dto" items="${LB}">
<tr>
<td> ${dto.rn} </td>
 <td> <a href="boarddetail.do?idx=${dto.u_id}">  ${dto.b_title} </a> </td>
<td> ${dto.u_id}</td>
<td> ${dto.b_date}</td>
<td> ${dto.b_viewcnt}</td>
<td> ${dto.b_member}</td>
</tr>
</c:forEach>


<tr align="center">
<td colspan="6">

<c:if test="${startpage>10}">
<a href="board.do?pageNum=${startpage-10}">[이전] </a>
</c:if> 

<c:forEach var="i" begin="${startpage}" end="${endpage}">
<a href="board.do?pageNum=${i}">[${i}] </a>
</c:forEach>

 <c:if test="${endpage<pagecount}">
<a href="board.do?pageNum=${startpage+10}">[다음] </a>
</c:if> 


&nbsp;&nbsp;&nbsp;&nbsp;
<a href="boardwrite.do">글쓰기</a></td>

<tr align="center">
<td colspan="6">
<form name="myform2" action="board.do">
<select name="keyfield">
<option value="" selected="selected">전체검색
<option value="name">아이디검색</option>
<option value="title">제목검색</option>
<option value="content">내용검색</option>
</select>
<input type="text" name="keyword">
<input type="submit" value="검색">
</form>
</td>
</tr>

</table>
<a href="board.do">board.jsp</a>




</body>
</html>