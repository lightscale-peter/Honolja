<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function deleteCheck(){
		var pwd = myform.u_pwd.value;
		var pwd2 = myform.u_pwd2.value;
		
		if(pwd == null || pwd == ""){
			alert("비밀번호를 입력해주세요");
			return;
		}else{
			if(pwd == pwd2){
				var flag = confirm("정말 탈퇴하시겠습니까?");
				if(flag == true){
					alert("정상적으로 탈퇴되었습니다.")
					myform.submit();
				}else{
					return;
				}
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
		}
	}//deleteCheck end
</script>
</head>
<body>
	<form name="myform" action="delete.do" onsubmit="deleteCheck(); return false;">
		<table width="700" border=1 cellspacing="0" cellpadding="5">
			<tr>
				<input type="hidden" name="u_id" value="${mto.u_id}">
			</tr>
			<tr>
				<td>
					비밀번호 : 
					<input type="password" id="u_pwd" name="u_pwd">
					<input type="hidden" id="u_pwd2" value="${mto.u_pwd}">
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="회원탈퇴">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>