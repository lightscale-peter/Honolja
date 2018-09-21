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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

 
	//ID중복체크
	var flagID = false;
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
					if(data == "true")
					{
						alert("이미 사용중인 아이디입니다.");
						flagID = false;
					}
					else
					{
						alert("사용 가능한 아이디입니다.");
						flagID = true;
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
			alert("아이디를 입력해주세요");
			return;
		} else if (u_pwd == "" || u_pwd == null) {
			alert("비밀번호를 입력해주세요");
			return;
		} else if (u_name == "" || u_name == null) {
			alert("이름을 입력해주세요");
			return;
		} else if (year == "선택하세요") {
			alert("년도를 선택해주세요.");
			return;
		} else if (month == "선택하세요") {
			alert("월을 선택해주세요");
			return;
		} else if (day == "선택하세요") {
			alert("일을 선택해주세요");
			return;
		} else if (u_phn == "" || u_phn == null) {
			alert("핸드폰 번호를 입력해주세요");
			return;
		}else if(u_gender.checked.length < 1){
			alert("성별을 선택해주세요");
			return;
		}else if (u_email == "" || u_email == null) {
			alert("이메일을 입력해주세요");
			return;
		}//end
		
		
		//점주 null체크
		var u_member = myform.u_member.value;
		var u_guestname = myform.u_guestname.value;
		var u_postcode = myform.u_postcode.value;
		var u_guestjuso = myform.u_guestjuso.value;
		var u_guestjuso1 = myform.u_guestjuso1.value;
		var u_guestnum = myform.u_guestnum.value;
		
		if(u_member.checked != null){
			if(u_guestname == "" || u_guestname == null){
				alert("게스트하우스명을 입력해주세요");
				return;
			}else if(u_postcode == "" || u_postcode == null){
				alert("우편번호를 입력해주세요");
				return;
			}else if(u_guestjuso == "" || u_guestjuso == null){
				alert("주소를 입력해주세요");
				return;
			}else if(u_guestjuso1 == "" || u_guestjuso1 == null){
				alert("상세주소를 입력해주세요");
				return;
			}else if(u_guestnum == "" || u_guestnum == null){
				alert("게스트하우스 연락처를 입력해주세요");
				return;
			}	
		}//점주 체크

		//중복체크여부
		if (flagID == false) {
			alert("아이디 중복체크를 해주세요");
			return;
		}
		myform.submit();
	}//insertCheck end

	//radio버튼
	function radioCheck(v, id, id2, id3) {
		if (v == "점주") {
			document.getElementById(id).style.display = ""; //보여줌
			document.getElementById(id2).style.display = "";
			document.getElementById(id3).style.display = "";
		} else {
			document.getElementById(id).style.display = "none"; //숨김
			document.getElementById(id2).style.display = "none";
			document.getElementById(id3).style.display = "none";
		}
	}//radioCheck end

	function pwdCheck() {
		var u_pwd = document.getElementById("u_pwd").value;
		var u_pwd2 = document.getElementById("u_pwd2").value;
			if (u_pwd == u_pwd2) {
				pwd2.innerHTML = "비밀번호가 일치합니다.";
			} else {
				pwd2.innerHTML = "비밀번호가 일치하지 않습니다.";
			}
	}//pwdCheck end
	
	
	//주소
	function DaumPostcode() 
	{
		new daum.Postcode
		({
			oncomplete:function(data) 
			{
				//팝업에서 검색결과 항목을 클릭했을 떄 실행할 코드를 작성하는 부분
				//각 주소의 노출 규칙에 따라 주소를 조합한다
				//내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다
				var fullAddr = '';//최종 주소 변수
				var extraAddr = '';//조합형 주소 변수
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다
				if (data.userSelectedType === 'R') //사용자가 도로명 주소를 선택했을 경우 
				{
					fullAddr = data.roadAddress;
				} 
				else //사용자가 지번 주소를 선택했을 경우(J) 
				{
					fullAddr = data.jibunAddress;
				}
				
				//사용자가 선택한 주소가 도로명 타입일때 조합한다
				if (data.userSelectedType === 'R') //법적동명이 있을 경우 추가한다 
				{
					if (data.bname !== '') 
					{
						extraAddr += data.bname;
					}
				
					//건물명이 있을 경우 추가 한다
					if (data.buildingName !== '') 
					{
						extraAddr += (extraAddr !== '' ? ',' + data.buildingName : data.buildingName);
					}
					//조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종주소를 만든다
					fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
				}
				
				//우편번호와 주소 정보를 해당 필드에 넣는다
				document.getElementById('u_postcode').value = data.zonecode;//5자리 새우편번호 사용
				document.getElementById('u_guestjuso').value = fullAddr;
			
				//커서를 상세주소 필드로 이동한다
				document.getElementById('u_guestjuso1').focus();
			}
		}).open();
	}//DaumPostcode end
</script>
</head>
<body id="page-top" style="margin-top:51px;">
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>
	<div>
		<form action="m_insert.do" method="post" name="myform" onsubmit="insertCheck(); return false;" enctype="multipart/form-data">
			<table width="1000" border=1 cellspacing="0" cellpadding="5">
				<tr>
					<td>구분 : <input type="radio" name="u_member" id="u_member" checked="checked"
						onclick="radioCheck(this.value,'name','juso','num');" value="일반회원"> 일반회원
						<input type="radio" name="u_member" id="u_member"
						onclick="radioCheck(this.value,'name','juso','num');" value="점주"> 점주
					<td rowspan="4"><input type="file" name="upload_img" /></td>
				</tr>
				<tr>
					<td>아이디 : <input type="text" name="u_id" id="u_id" value="test" />
						<button type="button" id="btn_idcheck">중복체크</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호 : <input type="password" name="u_pwd" id="u_pwd"
						placeholder="8~12자리" /> <label id="pwd">
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
							<option selected>선택하세요</option>
							<c:forEach var="i" begin="0" end="${2010-1900}">
								<c:set var="year" value="${2010-i}" />
								<option value="${year}">${year}</option>
							</c:forEach>
					</select> <select id="month" name="month">
							<option selected>선택하세요</option>
							<c:forEach var="i" begin="0" end="${12-1}">
								<c:set var="month" value="${12-i}" />
								<option value="${month}">${month}</option>
							</c:forEach>
					</select> <select id="day" name="day">
							<option selected>선택하세요</option>
							<c:forEach var="i" begin="0" end="${31-1}">
								<c:set var="day" value="${31-i}" />
								<option value="${day}">${day}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						휴대전화 <input type="text" name="u_phn" id="u_phn" placeholder="'-' 없이 입력하세요" value="01088921067">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="radio" name="u_gender" id="u_gender" value="남자">남자
						<input type="radio" name="u_gender" id="u_gender" value="여자">여자
					</td>
				</tr>
				<tr>
					<td colspan="2">
						이메일
						<input type="text" name="u_email"id="u_email">@
						<input type="text" name="u_email2"id="u_email2">
					</td>
				</tr>
				<tr id="name" style="display: none">
					<td colspan="2">
						게스트하우스 이름<input type="text" id="u_guestname" name="u_guestname">
					</td>
				</tr>
				<tr id="juso" style="display: none"> 
					<td colspan="2">
						게스트하우스 주소<br>
							<input type="text" size="10" id="u_postcode" name="u_postcode" readonly>
	                        <input type="button" onclick="DaumPostcode()" value="우편번호"><br>
	                        <input type="text" size="30" id="u_guestjuso" name="u_guestjuso" readonly  style="margin-top: 10px;"><br>
	                        <input type="text" size="30" id="u_guestjuso1" name="u_guestjuso1"   style="margin-top: 10px;" placeholder="상세주소 입력하세요">
					</td>
				</tr>
				<tr id="num" style="display: none"> 
					<td colspan="2">
						게스스트하우스 연락처  <input type="text" id="u_guestnum" name="u_guestnum" placeholder="'-' 없이 입력하세요">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit"value="가입하기">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<a href="m_list.do">[list]</a>

</body>
</html>