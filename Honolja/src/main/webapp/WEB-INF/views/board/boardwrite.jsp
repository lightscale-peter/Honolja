<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>글쓰기</title>
  <meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!--  Modal -->
  
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/lib/bootstrap.min.css">
  <script src="/lib/jquery-1.12.2.min.js"></script>
  <script src="/lib/bootstrap.min.js"></script>
  
 
</head>
<body>
  <h2><a href="board.do">게시판</a></h2>



<div class="container">
  <h2>게시글</h2>
  <form action="boardinsert.do" name="myform" method="post"  enctype="multipart/form-data" id="fileform" onsubmit="check(); return false;">
   <div class="form-group">
   <label for="usr" >제목:</label>
   <input type="text" name="b_title"  class="form-control" id="usr" placeholder="제목을 입력하세요." value="123">    ${dto.b_no}

<br> <label for="comment" >Comment:</label>
<textarea name="b_content"  class="form-control" rows="10" id="comment" placeholder="내용을 입력하세요.">123</textarea>
</div> 
    <div id="fileDiv">
    <p>
<input class="multi" type="file" name="b_uploadfilename2"  multiple="multiple">
   <a href="#this" name="delete" class="btn">삭제</a>
  </p>
      <a href="#this" id="add" class="btn">파일 추가하기</a>
        <a href="#this" id="list" class="btn">목록으로</a>
      <br><br><br><br><br>
      <input type="submit" class="btn btn-default" value="확인">
        </div>

      </form>
</div>
    
    
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
  
 
 
 
 
</body>
</html> 