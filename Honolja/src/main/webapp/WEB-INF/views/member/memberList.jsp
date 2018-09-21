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
		 	<td colspan="9" align="center">
				총 회원수 : ${cnt}
			</td>
		</tr>
		<tr>
			<td>번호</td> <td>구분</td> <td>아이디</td> <td>이름</td>
			<td>성별</td> <td>전화번호</td> <td>이메일</td> <td>등록날짜</td> <td>수정날짜</td>
		</tr>
		<c:forEach var="mto" items="${list}">
		<tr>
			<td>${mto.rn}</td>
			<td>${mto.u_member}</td>
			<td id="u_id"><a href="m_detail.do?idx=${mto.u_no}">${mto.u_id}</a></td>
			<td>${mto.u_name}</td>
			<td>${mto.u_gender}</td>
			<td>${mto.u_phn}</td>
			<td>${mto.u_email}</td>
			<td>${mto.u_date}</td>
			<td>${mto.u_update}</td>
		</tr>
		</c:forEach>
		<tr>
	      	<td colspan="9" align="center">
	      		<c:if test="${startpage>10}">
	      			<a href="m_list.do?pageNum=${startpage-10}">[이전]</a>
	      		</c:if>
	      		<c:forEach var="i" begin="${startpage}" end="${endpage}">
	      			<a href="m_list.do?pageNum=${i}">[${i}]</a>
	      		</c:forEach>
	      		<c:if test="${endpage<pagecount}">
	      			<a href="m_list.do?pageNum=${startpage+10}">[다음]</a>
	      		</c:if>
	      	</td>
		</tr>
		<tr>
			<td colspan="9" align="center">
				<form action="m_list.do">
					<select name="keyfield">
						<option value="" selected>전체검색</option>
						<option value="u_id">아이디검색</option>
						<option value="u_name">이름검색</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>

</body>
</html>