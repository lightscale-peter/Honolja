<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	font-size: 10pt;
	font-weight: bold;
}
</style>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>

<script type="text/javascript">

 
	//ID중복체크
	var idck = 0;
	$(function() {
		//idck 버튼을 클릭했을 때 
		$("#btn_idcheck").click(function() {

			//userid 를 param.
			var u_id = $("#u_id").val();
			
			$.ajax({
				async : true,
				type : 'POST',
				data : u_id,
				url : "idcheck.do",
				dataType : "text",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					alert("data = " + data);
					alert("u_cnt = " + data.u_cnt);
					alert("u_id = " + data.u_id);
					if(data.u_cnt == "2"){
						alert("이미 사용중인 아이디입니다.");
					}else{
						alert("사용 가능한 아이디입니다.");
					}
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
		});
	});//아이디 중복체크 end

	function insertCheck() {
		var u_id = myform.u_id.value;
		var u_pwd = myform.u_pwd.value;
		var u_pwd2 = myform.u_pwd2.value;
		var u_name = myform.u_name.value;
		var year = myform.year.value;
		var month = myform.month.value;
		var day = myform.day.value;
		var u_phn = myform.u_phn.value;
		var u_email = myform.u_email.value;
		
		var u_gender = document.getElementById("u_gender");
		var pwd = document.getElementById("pwd");
		var pwd2 = document.getElementById("pwd2");
		
		if (u_id == "" || u_id == null) {
			alert("아이디를 입력해주세요.");
			return;
		} else if (u_pwd == "" || u_pwd == null) {
			alert("비밀번호를 입력해주세요.");
			return;
		} else if (u_name == "" || u_name == null) {
			alert("이름을 입력해주세요.");
			return;
		} else if (year == "선택하세요.") {
			alert("년도를 선택해주세요.");
			return;
		} else if (month == "선택하세요.") {
			alert("월을 선택해주세요.");
			return;
		} else if (day == "선택하세요.") {
			alert("일을 선택해주세요.");
			return;
		} else if (u_phn == "" || u_phn == null) {
			alert("핸드폰 번호를 입력해주세요.");
			return;
		}else if(u_gender.checked == false && u_gender2.checked == false){
			alert("성별을 선택해주세요.");
			return;
		}else if (u_email == "" || u_email == null) {
			alert("이메일을 입력해주세요");
			return;
		}//end

		//중복체크여부
		if (flagID == false) {
			alert("아이디 중복체크를 해주세요.");
			return;
		}
		myform.submit();
	}//insertCheck end

	//radio버튼
	function radioCheck(v, id) {
		if (v == "점주") {
			document.getElementById(id).style.display = ""; //보여줌
		} else {
			document.getElementById(id).style.display = "none"; //숨김
		}
	}//radioCheck end

	function pwdCheck() {
		if (u_pwd.length > 7 || u_pwd.length < 13) {
			if (u_pwd == u_pwd2) {
				pwd2.innerHTML = "비밀번호가 일치합니다.";
			} else {
				pwd2.innerHTML = "비밀번호가 일치하지 않습니다.";
			}
		} else {
			pwd.innerHTML = "8~12자리 입력해주세요";
		}
	}//pwdCheck end
</script>
</head>
<body>
	<form action="insert.do" method="post" name="myform" onsubmit="insertCheck(); return false;" enctype="multipart/form-data">
		<table width="1000" border=1 cellspacing="0" cellpadding="5">
			<tr>
				<td>구분 : <input type="radio" name="u_member" id="u_member" checked="checked"
					onclick="radioCheck(this.value,'juso');" value="일반회원"> 일반회원
					<input type="radio" name="u_member" id="u_member"
					onclick="radioCheck(this.value,'juso');" value="점주"> 점주
				<td rowspan="4"><input type="file" name="upload_img" /></td>
			</tr>
			<tr>
				<td>아이디 : <input type="text" name="u_id" id="u_id" value="test" />
					<button type="button" id="btn_idcheck">중복체크</button>
				</td>
			</tr>
			<tr>
				<td>비밀번호 : <input type="password" name="u_pwd" id="u_pwd"
					placeholder="8~12자리" onkeyup="pwdCheck();" /> <label id="pwd">
				</label>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인 : <input type="password" id="u_pwd2"
					onkeyup="pwdCheck();" /> <label id="pwd2"> </label>
				</td>
			</tr>
			<tr>
				<td colspan="2">이름 : <input type="text" name="u_name"
					id="u_name" value="test33" />
				</td>
			</tr>
			<tr>
				<td colspan="2">생년월일 : <select id="year" name="year">
						<option selected>선택하세요.</option>
						<c:forEach var="i" begin="0" end="${2010-1900}">
							<c:set var="year" value="${2010-i}" />
							<option value="${year}">${year}</option>
						</c:forEach>
				</select> <select id="month" name="month">
						<option selected>선택하세요.</option>
						<c:forEach var="i" begin="0" end="${12-1}">
							<c:set var="month" value="${12-i}" />
							<option value="${month}">${month}</option>
						</c:forEach>
				</select> <select id="day" name="day">
						<option selected>선택하세요.</option>
						<c:forEach var="i" begin="0" end="${31-1}">
							<c:set var="day" value="${31-i}" />
							<option value="${day}">${day}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">휴대전화 <input type="text" name="u_phn" id="phone"
					value="01088921067">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="radio" name="u_gender"
					id="u_gender" value="남자">남자 <input type="radio"
					name="u_gender2" id="u_gender2" value="여자">여자</td>
			</tr>
			<tr>
				<td colspan="2">이메일 <input type="text" name="u_email"
					id="u_email" value="pyt16@naver.com">

				</td>
			</tr>
			<!-- <tr id="juso" style="display: none">
				<td colspan="2">
					게스트하우스 주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="u_juso" name="u_juso"> <br><br>
					게스스트하우스 연락처  <input type="text" id="u_num" name="u_num">
				</td>
			</tr> -->
			<tr>
				<td colspan="2" align="center">
					<input type="submit"value="가입하기">
				</td>
			</tr>
		</table>
	</form>

	<a href="list.do">[list]</a>

</body>
</html>