<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<table width="1000" border=1 cellspacing="0" cellpadding="5">
			<tr>
				<td>번호</td> <td>구분</td> <td>아이디</td> <td>이름</td>
				<td>성별</td> <td>전화번호</td> <td>이메일</td> <td>등록날짜</td> <td>수정날짜</td>
			</tr>
		<c:forEach var="mto" items="${list}">
			<tr>
				<td>${mto.rn}</td>
				<td>${mto.u_member}</td>
				<td id="u_id"><a href="detail.do?idx=${mto.u_no}">${mto.u_id}</a></td>
				<td>${mto.u_name}</td>
				<td>${mto.u_gender}</td>
				<td>${mto.u_phn}</td>
				<td>${mto.u_email}</td>
				<td>${mto.u_date}</td>
				<td>${mto.u_update}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>