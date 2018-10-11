<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>find_ID.jsp</title>

<style type="text/css">
	 .ff {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	 }
</style>

<script type="text/javascript">
	
	function idcheck(){
		var u_name = document.getElementById("u_name").value;
		var uname = document.getElementById("uname");
		
		if(u_name == null || u_name == ""){
			uname.innerHTML = "<font color='red'>이름을 입력해주세요.</font>";
		}else{
			uname.innerHTML = "";
		}
	}//idcheck end
	
	function phncheck(){
		var u_phn = document.getElementById("u_phn").value;
		var uphn = document.getElementById("uphn");
		numck = /^([0-9]{11})*$/;
		
		if(u_phn == null || u_phn == ""){
			uphn.innerHTML = "<font color='red'>핸드폰 번호를 입력해주세요.</font>";
		}else{
			uphn.innerHTML = "";
		}
		
		if(!numck.test(u_phn)){
			uphn.innerHTML = "<font color='red'>숫자 11자리를 입력해주세요.</font>";
		}else{
			uphn.innerHTML = "";
		}
	}//phncheck end
	
	function findID(){
		var u_name = document.getElementById("u_name").value;
		var uname = document.getElementById("uname");
		var u_phn = document.getElementById("u_phn").value;
		var uphn = document.getElementById("uphn");
		
		if(u_name == null || u_name == ""){
			uname.innerHTML = "<font color='red'>이름을 입력해주세요</font>";
			return;
		}else if(u_phn == null || u_phn == ""){
			uphn.innerHTML = "<font color='red'>핸드폰 번호를 입력해주세요</font>";
			return;
		}else{
			myform.onsubmit();
		}
	}//findID end
	
</script>
</head>
<body>

	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>

	<div style="height: 100px;"></div>
<div>
	<form method="post" name="myform" action="findID.do" onsubmit="findID() return false;">
	 	<div style="color: grey;" align="center">
			회원정보로 등록한 이름과 휴대전화 번호를 입력해주세요.
		</div> <p> <br>
		
		<div class="form-group" style="margin: 0 auto; width:20%;">
			이름: <input type="text" name="u_name" id="u_name" class="form-control" onkeyup="idcheck();">
			<label id="uname"></label>
		</div><br>
		
		<div class="form-group" style="margin: 0 auto; width:20%;">
			휴대전화: <input type="text" name="u_phn" id="u_phn" onkeyup="phncheck();" placeholder="'-'없이 입력하세요" class="form-control">
			<label id="uphn"></label>
		</div> 
		
		<p> <br>
		<div align="center">		
			<input type="submit" class="btn btn-primary" value="아이디 찾기">
		</div>
	</form>
</div>

	<div class="ff">
		<c:import url="http://localhost:8080/honolja/footer.do" />
	</div>

</body>
</html>