<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>모임게시판</title>

</head>
<body>

<div class="container">
  <h2><a href="board.do">게시판</a></h2>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>번호</th>  
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>조회수</th>
        <th>참여</th>
      </tr>
    </thead>
<tbody>
<c:forEach var="dto" items="${LB}">
      <tr>
        <td>${dto.b_no}</td>
         <td><a href="boarddetail.do?idx=${dto.b_no}">${dto.b_title} </a>
         <font color="#ff0000">[${rcnt}]</font></td>
        <td> ${dto.u_id}</td>
        <td> ${dto.b_date}</td>
		<td> ${dto.b_viewcnt}</td>
		<td> ${dto.b_member2}/${dto.b_member}</td>
		      </tr>
</c:forEach>
</tbody>

<tr align="center">
<td colspan="6">

<c:if test="${startpage>10}">
<a href="board.do?pageNum=${startpage-10}">《 </a>
</c:if> 

<c:forEach var="i" begin="${startpage}" end="${endpage}">

<a href="board.do?pageNum=${i}">${i}</a>



</c:forEach>

 <c:if test="${endpage<pagecount}">
<a href="board.do?pageNum=${startpage+10}"> 》 </a>

</c:if> 

&nbsp;&nbsp;&nbsp;&nbsp;
</td>
</tr>




<tr align="center">
<td colspan="6">
<form name="myform2" action="board.do">
<select name="keyfield">
<option value="" selected="selected">전체검색
<option value="b_title" <c:if test="${skey eq 'b_title'}">selected</c:if>>제목검색</option>
<option value="b_content" <c:if test="${skey eq 'b_content'}">selected</c:if>>내용검색</option>
<option value="u_id" <c:if test="${skey eq 'u_id'}">selected</c:if>>아이디검색</option>
</select>
<input type="text" name="keyword" value="${sval}">
<input type="submit" value="검색">
</form>
</td>
</tr>



</table>
</div>

<a href="boardwrite.do">글쓰기</a> <br>
<a href="board.do">board.jsp</a>




</body>
</html>

