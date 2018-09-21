<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>글쓰기</title>
  <meta charset="utf-8">
<<<<<<< HEAD
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
=======
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
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
<<<<<<< HEAD

<script type="text/javascript">


</script>

=======
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
<body>
  <h2><a href="board.do">게시판</a></h2>



<div class="container">
  <h2>게시글</h2>
  <form action="boardinsert.do" method="post"  enctype="multipart/form-data" id="fileForm">
   <div class="form-group">
   <label for="usr" >제목:</label>
   <input type="text" name="b_title"  class="form-control" id="usr" placeholder="제목을 입력하세요." value="123">
   
	<br>
	인원 모집&nbsp;&nbsp;&nbsp;
	<select name="b_member">
		<option selected="selected">0</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
	</select>
	명
	<br>
     
<br> <label for="comment" >Comment:</label>
<textarea name="b_content"  class="form-control" rows="10" id="comment" placeholder="내용을 입력하세요.">123</textarea>
</div> 
    <div id="fileDiv">
    <p>
<input class="multi" type="file" name="b_uploadfilename2"  multiple="multiple">
   <a href="#this" name="delete" class="btn">삭제</a>
  </p>
<<<<<<< HEAD
          <a href="javascript:void(window.open('board_file.do', 'text', 'width=900, height=800, top=100, left=800'))" class="btn btn-primary btn-lg">
      <span class="glyphicon glyphicon-picture"></span> File 
    </a>
=======
      <a href="#this" id="add" class="btn">파일 추가하기</a>
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
        <a href="#this" id="list" class="btn">목록으로</a>
        <a href="#this" id="write" class="btn">글쓰기</a>
      <br><br><br><br><br>
        <input type="submit" value="등록" >
        </div>
          
    </form>
    </div>
    
 
    
    
    
    
    
    
    
  <!--  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="ok();">확인</button>
 <br><br><br><br><br>
   <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Notice</h4>

        </div>
        <div class="modal-body">
          <p>게시글을 삭제하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
      
    </div>
  </div>
  -->
 
 
 
 
</body>
</html> 