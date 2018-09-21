<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage_menu.jsp</title>
	 <link href="css/mypage_menu.css" rel="stylesheet" type="text/css">
</head>
<body>

<ul>
 <li><a href="#">찜</a></li>
 <li><a href="#">예약 현황</a></li>
 <li class="dropdown">
     <a href="javascript:void(0)" class="dropbtn">쪽지함</a>
    <div class="dropdown-content">
      <a href="#">받은 쪽지함</a>
      <a href="#">보낸 쪽지함</a>
    </div></li>
 <li><a href="#">내가 쓴 글</a></li>
 <li class="dropdown">
     <a href="javascript:void(0)" class="dropbtn">회원 정보</a>
    <div class="dropdown-content">
      <a href="#">회원정보 수정</a>
      <a href="#">회원 탈퇴</a>
    </div></li>
</ul>


</body>
</html>