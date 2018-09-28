<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="css/styles_side.css" rel="stylesheet" type="text/css">
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

	 .tt {
	 	position:absolute;
	 	left:700px;
	 }
	 
	 .ff {
	 	position: relative;
	 	top: 900px;
	 }
	 
table.type03 {
     border-collapse: collapse;
    text-align: left;
    line-height: 1.5; 
    border-top: 1px solid #ccc; 
   	border-left: 3px solid #369; 
  	margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
	 
	 </style>

</head>
<body>

	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>
	
	<div style="height:100px;"></div>
	
		<div>
		  	<c:import url="http://localhost:8080/honolja/side_mypage.do" />
		</div>

		
		<div class="tt">
			<table class="type03">
				<tr>  <th scope="row">회원번호</th> <td> ${mto.u_no} </td>  </tr>
				<tr>  <td> <img src="./image/${mto.u_img}" width="100" height="135">  </td>  </tr>
				<tr>  <th scope="row">구분</th>  <td> ${mto.u_member} </td>  </tr>
				<tr>  <th scope="row">아이디</th>  <td> ${mto.u_id} </td>  </tr>
				<tr>  <th scope="row">이름</th>  <td> ${mto.u_name} </td>  </tr>
				<tr>  <th scope="row">성별</th>  <td> ${mto.u_gender} </td>  </tr>
				<tr>  <th scope="row">이메일</th>  <td> ${mto.u_email} </td>  </tr>
				<tr>  <th scope="row">생년월일</th>  <td> ${mto.u_birth} </td>  </tr>
				<tr>  <th scope="row">핸드폰</th>  <td> ${mto.u_phn} </td>  </tr>
				<tr>  <th scope="row">등록날짜</th>  <td> ${mto.u_date} </td>  </tr>
				<tr>  <th scope="row">수정날짜</th>  <td> ${mto.u_update} </td>  </tr>
				<tr id="guest1" style="display:none">  <th scope="row">게스트하우스 이름</th>  <td> <input type="text" id="g1" value="${mto.u_guestname}"> </td>  </tr>
				<tr id="guest2" style="display:none">  <th scope="row">게스트하우스 주소</th>  <td> <input type="text" id="g2" value="${mto.u_postcode}  ${mto.u_guestjuso}">  </td>  </tr>
				<tr id="guest3" style="display:none">  <th scope="row">게스트하우스 연락처</th> <td> <input type="text" id="g3" value="${mto.u_guestnum}"> </td>  </tr>
			</table>
		</div>		
	
	<div class="ff">
		<c:import url="http://localhost:8080/honolja/footer.do" />
	</div>
	
</body>
</html>