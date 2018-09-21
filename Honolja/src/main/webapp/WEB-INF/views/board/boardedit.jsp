<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>에디터</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 	<script type="text/javascript">
	  function check( ){
		  var title=myform.b_title.value;
		  var content=myform.b_content.value;
		 
			if (title == "" || title == null) {
				alert("제목을 입력해주세요.");  
			myform.b_title.focus();
			return false;
			}
			if (content == "" || content == null) {
				alert("내용을 입력해주세요.");
			myform.b_content.focus();
			return false;
			}
			document.myform.submit(); 
	  }
	  </script>
	  
</head>

<body>

	<div class="container">
			<h2> <a href="board.do">게시판</a> </h2>
		<form action="boardupdate.do" name="myform" method="post" enctype="multipart/form-data" id="fileform"
			onsubmit="check(); return false;">
			<div class="form-group">
				<input type="text" name="b_title" class="form-control" id="usr" placeholder="제목을 입력하세요." value="${dto.b_title}">
				<br> <label for="comment">Comment:</label>
				<textarea name="b_content" class="form-control" rows="10" id="comment" placeholder="내용을 입력하세요.">${dto.b_content}</textarea>
			</div>
			<div id="fileDiv">
				<p>
					<input class="multi" type="file" name="b_uploadfilename2" multiple="multiple">${dto.b_originalfilename} 
				</p>
				<a href="#this" id="add" class="btn">파일 추가하기</a> <a href="#this" id="list" class="btn">목록으로</a> <br>
				<br> <br> <br>
				 	<input type="submit" class="btn btn-default" value="확인">
				 	<input type="hidden" name="u_id" value="${dto.u_id}"> 
			</div>
		</form>
	</div>

		 <br> <input type="hidden" name="b_no" value="${dto.b_no}"> 
		<p>
</body>
</html>
=======
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에디터</title>
 
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 
</head>
<script type="text/javascript">


</script>
<body>
  <h2><a href="board.do">게시판</a></h2>
<label>제목</label>
<!--asdf-->
 


수정하세요=-------------------------------------------------------------
    <form action="boardupdate.do" method="post"  >
  <input type="hidden" name="u_id" value="${dto.u_id}">  회원님 아이디:  ${dto.u_id} <br>
   <input type="hidden" name="b_no" value="${dto.b_no}"> 
   <input type="text"  name="b_title" value="${dto.b_title}">
       <p>
       수정하세요=-------------------------------------------------------------
       </p>
        <textarea name="b_content" style="width: 700px; height: 400px;">${dto.b_content}</textarea>
        <input type="submit" value="수정" />
    </form>
 <!--   <a href="board.do">board.jsp</a> -->
</body>
</html> 
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja.git
