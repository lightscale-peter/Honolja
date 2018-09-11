<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	a{font-size:15pt; font-color:red;}
</style>
</head>
<body>
	<table width="1000" border=1 cellspacing="0" cellpadding="5">
		<tr>
			<td>회원번호</td> <td>${mto.u_no}</td> <td rowspan="3">${mto.u_img}</td>
		</tr>
		<tr>
			<td>구분</td> <td>${mto.u_member}</td>
		</tr>
		<tr>
			<td>아이디</td> <td> ${mto.u_id} </td>
		</tr>
		<tr>
			<td>비밀번호</td> <td>${mto.u_pwd}</td>
		</tr>
		<tr>
			<td>이름</td> <td>${mto.u_name}</td>
		</tr>
		<tr>
			<td>생년월일</td> <td>${mto.u_birth}</td>
		</tr>
		<tr>
			<td>성별</td> <td>${mto.u_gender}</td>
		</tr>
		<tr>
			<td>번호</td> <td>${mto.u_phn}</td>
		</tr>
		<tr>
			<td>이메일</td> <td>${mto.u_email}</td>
		</tr>
		<tr>
			<td>등록날짜</td> <td>${mto.u_date}</td>
		</tr>
		<tr>
			<td>수정날짜</td> <td>${mto.u_update}</td>
		</tr>
	</table>
	
	<a href="mypageDelete.do?idx=${mto.u_id}">회원탈퇴</a>

</body>
</html>