<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[notice_detail.jsp]</title>
</head>

<script type="text/javascript">

	function delete_check(){
		
		var msg = confirm("정말로 삭제하시겠습니까?");
		
		if ( msg == true ){
			alert("공지사항이 삭제되었습니다.");
		}else { return false; }
	}//삭제 확인

</script>

<body>

<h1>공지사항 상세</h1>
<p>
<br>

<table border="2" align="center" width=900 height=1000 cellpadding="10">
 <tr>
  <td colspan="2"> 제목: ${dto.n_title}</td>
 </tr>
 
 <tr>
  <td width="500">작성자: 관리자 </td>
  <td>작성일: ${dto.n_date}</td>
 </tr>
 
 <%pageContext.setAttribute("newLineChar", "\n");%>
 <tr height="700">
  <td colspan="2">${fn:replace(dto.n_content, newLineChar, "<br/>")}</td>
 </tr>
 
 <tr align="right">
  <td colspan="2">
   <input type="button" value="목록으로" onclick="location.href='notice.do'">
   <input type="button" value="수정" onclick="location.href='preEdit.do?idx=${dto.n_no}'">
   <input type="button" value="삭제" onclick="location.href='delete.do?idx=${dto.n_no}'">
  </td>
 </tr> 

</table>

<p>


</body>
</html>