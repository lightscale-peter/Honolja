<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="css/mypage_menu.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var g1 = document.getElementById("g1").value;
			var g2 = document.getElementById("g2").value;
			var g3 = document.getElementById("g3").value;
			 if(g1 == "" || g1 == null){
				$("#guest1").style.display = "none";
				$("#guest2").style.display = "none";
				$("#guest3").style.display = "none";
			}else{
				document.getElementById("guest1").style.display = "";
				document.getElementById("guest2").style.display = "";
				document.getElementById("guest3").style.display = "";
			}
			 
			if(guest1 == null || guest == ""){
				document.getElementById("guest1").style.display = "none";
				document.getElementById("guest2").style.display = "none";
				document.getElementById("guest3").style.display = "none";
			}else{
				document.getElementById("guest1").style.display = "";
				document.getElementById("guest2").style.display = "";
				document.getElementById("guest3").style.display = "";
			} 
		});
	 </script>
	 <style type="text/css">
	*{
		font-size: 10pt;
		font-weight: bold;
	}
	.joinform {
		width: 500px;
		margin: 0 auto;
	}
	.logo {
		display: block;
	    overflow: hidden;
	    width: 240px;
	    height: 100px;
	    margin: 0 auto;
	    color: blue;
		}
	.loghoh1 {
		font-size: 44px;
		font-weight: bold;
	}
	.logo .loghoh1 a{
		text-decoration: none;
	}
	.honolja{
		font-size: 44px;
		font-weight: bold;
	    overflow: hidden;
	    clip: rect(0 0 0 0);
	    margin: -1px;
	    width: 1px;
	    height: 1px;
	}
	.option-input {
		-webkit-appearance: none;
		-moz-appearance: none;
		-ms-appearance: none;
		-o-appearance: none;
		appearance: none;
		position: static;
		top: 13.33333px;
		right: 0;
		bottom: 0;
		left: 0;
		height: 20px;
		width: 20px;
		transition: all 0.15s ease-out 0s;
		background: #cbd1d8;
		border: none;
		color: #fff;
		cursor: pointer;
		margin-right: 0.5rem;
		outline: none;
		position: relative;
		z-index: 1000;
	}
	.option-input:hover {
		background: #9faab7;
	}
	.option-input:checked {
		background: blue;
	}
	.option-input:checked::before {
		height: 20px;
		width: 20px;
		position: absolute;
		content: '✔';
		font-size: 15px;
		text-align: center;
		line-height: 20px;
	}
	.option-input:checked::after {
		-webkit-animation: click-wave 0.65s;
		-moz-animation: click-wave 0.65s;
		animation: click-wave 0.65s;
		background: #40e0d0;
		content: '';
		position: relative;
		z-index: 100;
	}
	.option-input.radio {
		border-radius: 50%;
	}
	.option-input.radio::after {
		border-radius: 50%;
	}
	.txtlayout {
		width: 100%;
		height: 51px;
		border: solid 1px;
		display: block;
		border-color: #dadada;
		padding: 7px 13px 10px;
	}
</style>
</head>
<body>
<jsp:include page="mypage_menu.jsp"/>

<div class="joinform">
		<form action="usereditsave.do" method="post" name="myform" onsubmit="insertCheck(); return false;" enctype="multipart/form-data">
					<span>구분</span> <p>
						<input type="radio" class="option-input radio" name="u_member" id="u_member" checked="checked" style="display:inline-flex;"
							onclick="radioCheck(this.value,'name','juso','num');" value="일반회원" /> 
						<span>일반회원</span>					
						<input type="radio" class="option-input radio" name="u_member" id="u_member" style="display:inline-flex;"
							onclick="radioCheck(this.value,'name','juso','num');" value="점주" />
						<span>점주</span>
				<div>
					<span class="txt_name">아이디</span>
					<input type="text" class="form-control" name="u_id" id="u_id" value="${mto.u_id}" readonly="readonly" onkeyup="idCheck();" />
					<label id="uid"></label>
				</div>
				<div>
					<span class="txt_name">비밀번호</span>
					<input type="password" class="form-control" name="u_pwd" id="u_pwd" />
					<label id="pwd"> </label>
				</div>
				<div>
					<span class="txt_name">비밀번호확인</span>
					<input type="password" class="form-control" id="u_pwd2"onkeyup="pwdCheck();" />
					<label id="pwd2"> </label>
				</div>
				<div>
					<span class="txt_name">이름</span>
					<input type="text" class="form-control" name="u_name" id="u_name" value="${mto.u_name}" onkeyup="nameCheck();"/>
					<label id="uname"> </label>
				</div>
				<div>
					<span class="txt_name">휴대전화</span>
					<input type="text" class="form-control" name="u_phn" id="u_phn" value="${mto.u_phn}" placeholder="'-' 없이 입력하세요" onkeyup="phnCheck();">
					<label id="uphn"> </label>
				</div>
				<div>
					<input type="file" name="upload_img"/>
				</div>
				<div id="name" style="display: none">
					<span class="txt_name">게스트하우스 이름</span>
					<input type="text" class="form-control" style="border: 0;" id="u_guestname" name="u_guestname" value="${mto.u_guestname}">
					<label id="uguestname"></label>
				</div>
				<div id="juso" style="display: none"> 
					<span class="txt_name">게스트하우스 주소</span><br>
						<input type="text" class="form-control" id="u_postcode" name="u_postcode" readonly>
                        <input type="button" onclick="DaumPostcode()" value="우편번호"><br>
                        <input type="text" class="form-control" id="u_guestjuso" name="u_guestjuso" readonly  style="margin-top: 10px;"><br>
                        <input type="text" class="form-control" id="u_guestjuso1" name="u_guestjuso1"   style="margin-top: 10px;" placeholder="상세주소 입력하세요">
				</div>
				<div id="num" style="display: none"> 					
					<span class="txt_name">게스스트하우스 연락처 </span> 
					<input type="text" class="form-control" id="u_guestnum" name="u_guestnum" placeholder="'-' 없이 입력하세요" value="${mto.u_guestnum}">
					<label id="uguestnum"></label>
				</div>
				<div>
					<input type="submit" class="btn btn-primary btn-md" style="height: 50px; width: 100%; margin-top: 20px;" value="수정하기">
				</div>
		</form>
	</div>


</body>
</html>