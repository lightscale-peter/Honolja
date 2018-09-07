<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

	<title>[main.jsp]</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
    
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript">
	
		//지역 + Check-IN + Check-OUT 입력시, 퍼센트 증가.
		var count = 0;
	
		function progress(percent, color){

			if(count < 3){				
				var string = "<div class='progress'>";
				string += "<div class='progress-bar "+color+" progress-bar-striped active' role='progressbar' aria-valuenow='"+percent+"' aria-valuemin='0' aria-valuemax='100' style='width:"+percent+"%'>";
				string += percent + "% Complete";
				string += "</div>";
				string += "</div>";
					
				document.getElementById("progress").innerHTML = string;
				
				count++;
			}

		}
			
		function init(){
			count = 0;	
			document.getElementById("progress").innerHTML = "";
		}
		
		//공지사항 노출 기능	
		var notice_num = 0;
		
		function chgNotice(){
			
			var notices = new Array();
			
			notices[0] = "카카오 위치기반서비스 이용약관 변경 안내";
			notices[1] = "개인정보 처리방침 개정안내";
			notices[2] = "카카오 사칭 코인 세일 피싱 사이트 피해 주의 안내";
				
			
			document.getElementById("notice").innerHTML = notices[notice_num];
			notice_num++;
			
			if(notice_num == 3)notice_num = 0;
		}
	</script>
     
</head>
<body style="margin-top: 70px;">
	
	<!-- 상단 바 -->
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>

	<!-- 카로셀 시작 -->
	<div class="container" style = "width:100%; position: relative; padding: 0;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
		    <ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
			        <img src="resources/images/la.jpg" alt="Los Angeles" style="width:100%;height:650px;">
			        <div class="carousel-caption">
						<h3>Los Angeles</h3>
						<p>LA is always so much fun!</p>
			        </div>
				</div>

				<div class="item">
					<img src="resources/images/chicago.jpg" alt="Chicago" style="width:100%;height:650px;">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
		        	</div>
				</div>
		    
				<div class="item">
		        <img src="resources/images/ny.jpg" alt="New York" style="width:100%;height:650px;">
			        <div class="carousel-caption">
						<h3>New York</h3>
						<p>We love the Big Apple!</p>
			        </div>
				</div>
			</div>
	
		    <!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
		    </a>
		</div>

		<div style="position: absolute; 
					left: 50%; 
					top: 50%;
					transform: translate(-50%,-50%); 
					background-color: white; 
					padding: 20px; 
					border-radius: 20px; 
					text-align: center;">	
					
			<form action="#">
				<div class="form-group">
					<label for="sel1">지역</label>
					<select class="form-control" id="sel1" name="area" onchange="progress(30, 'progress-bar-danger');">
						<option>선택</option>
						<option>서울</option>
						<option>경기</option>
						<option>강원</option>
						<option>충북</option>
						<option>충남</option>
						<option>전북</option>
						<option>전남</option>
						<option>경북</option>
						<option>경남</option>
						<option>제주</option>
					</select>
				</div>
				<label for="sel1">Check-IN</label>							
					<div><input type = "text" readonly="readonly" name="check_in" id="datepicker" width="276" onchange="progress(70, 'progress-bar-warning');"/></div>
				<br>
					
				<label for="sel1">Check-OUT</label>
					<div><input type = "text" readonly="readonly" name="check_out" id="datepicker1" width="276" onchange="progress(100, 'progress-bar-info');"/></div>
				<br>
				
				<div id = "progress"></div>

				
					
				<br>
				<div class="btn-group">
					<button type="submit" class="btn btn-primary">CHECK</button>
					<button type="reset" class="btn btn-primary" onclick = "init();">RESET</button>
				</div>				
			</form>
		</div>
	</div>
	
    <script>
        $('#datepicker').datepicker({
        	format: 'yyyy/mm/dd'
        });
        
        $('#datepicker1').datepicker({
        	format: 'yyyy/mm/dd'
        });
        
    </script>
    
    	<!-- 공지사항 노출 부 -->

	<div class="alert alert-info">
		<table style="width: 100%;">
			<tr>
				<td width="95%">
					<strong>&nbsp;&nbsp;&nbsp;&nbsp;공지사항&nbsp;&nbsp;:&nbsp;&nbsp;</strong>
					<span id="notice">카카오 서비스 운영정책 변경 안내</span>
				</td>
				<td> 
					<input class="btn" type = "button" value = "&nbsp;&nbsp;>&nbsp;&nbsp;" onclick="chgNotice()">
				</td>
			</tr>
		</table>
		
	</div>
	
	${checked }
	
	<p>

    
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper eros sit amet lobortis accumsan. Cras in sagittis odio. Cras aliquet nunc ut ligula venenatis laoreet. Etiam vitae dolor eget urna fringilla aliquet vel quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc et massa metus. Cras eget vehicula dui. Donec eu neque justo. Vestibulum tempor in nulla at porttitor.

Cras vulputate elit vitae fermentum vulputate. Suspendisse mattis nibh eget nunc pellentesque, et rhoncus lacus iaculis. Ut cursus ut metus ac semper. Aliquam lacinia lacinia purus. Cras pellentesque leo urna, eget dignissim turpis vulputate id. Etiam sodales ipsum eget libero dictum interdum sed eu quam. Praesent hendrerit, sapien at suscipit pulvinar, turpis augue semper metus, in dictum nibh diam consequat nunc. Quisque egestas felis sed enim accumsan, nec consequat dolor lacinia. Suspendisse pretium finibus malesuada. Proin eu tristique mauris. Pellentesque eu auctor libero, in aliquam tortor. Curabitur blandit nisi lorem. Integer in vulputate neque.

Suspendisse potenti. Curabitur vitae malesuada tortor. Aenean vel sodales quam. Nunc turpis odio, imperdiet eu nisi id, faucibus bibendum lectus. Morbi augue urna, ultricies et sapien ac, mollis faucibus eros. Maecenas feugiat, nunc vel viverra iaculis, turpis odio venenatis urna, at dignissim nibh augue non arcu. Vestibulum non commodo odio, in scelerisque erat. Praesent non pharetra justo.

Pellentesque bibendum posuere lacus a consequat. Aenean sed nulla quis quam convallis mollis. Aliquam ut porttitor neque. Nullam tortor augue, pulvinar vitae odio ut, auctor facilisis felis. Vestibulum viverra, sem sit amet dapibus lacinia, justo nisi interdum ligula, ut hendrerit lacus dui sit amet purus. In eleifend velit a convallis dictum. Morbi diam justo, mollis sed congue a, mattis sit amet elit. Integer faucibus dapibus dolor eu mattis. Donec venenatis magna non iaculis ullamcorper. Proin iaculis mi in molestie bibendum. Vestibulum molestie lorem sit amet justo ornare, in vestibulum enim sollicitudin.

Quisque et nunc lacinia, dictum tellus ut, congue ipsum. Pellentesque arcu tortor, vulputate at consequat at, ullamcorper quis arcu. Nullam augue augue, imperdiet ullamcorper tellus vel, semper lobortis tortor. Quisque sed lorem ut felis tristique tempus. Nam non lacus sapien. Suspendisse lorem quam, interdum non sem id, imperdiet malesuada libero. Nullam rhoncus tempor metus, eget condimentum felis maximus ac. Nullam molestie velit eu aliquam rutrum. Proin et hendrerit erat. Duis sagittis vestibulum accumsan.
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper eros sit amet lobortis accumsan. Cras in sagittis odio. Cras aliquet nunc ut ligula venenatis laoreet. Etiam vitae dolor eget urna fringilla aliquet vel quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc et massa metus. Cras eget vehicula dui. Donec eu neque justo. Vestibulum tempor in nulla at porttitor.

Cras vulputate elit vitae fermentum vulputate. Suspendisse mattis nibh eget nunc pellentesque, et rhoncus lacus iaculis. Ut cursus ut metus ac semper. Aliquam lacinia lacinia purus. Cras pellentesque leo urna, eget dignissim turpis vulputate id. Etiam sodales ipsum eget libero dictum interdum sed eu quam. Praesent hendrerit, sapien at suscipit pulvinar, turpis augue semper metus, in dictum nibh diam consequat nunc. Quisque egestas felis sed enim accumsan, nec consequat dolor lacinia. Suspendisse pretium finibus malesuada. Proin eu tristique mauris. Pellentesque eu auctor libero, in aliquam tortor. Curabitur blandit nisi lorem. Integer in vulputate neque.

Suspendisse potenti. Curabitur vitae malesuada tortor. Aenean vel sodales quam. Nunc turpis odio, imperdiet eu nisi id, faucibus bibendum lectus. Morbi augue urna, ultricies et sapien ac, mollis faucibus eros. Maecenas feugiat, nunc vel viverra iaculis, turpis odio venenatis urna, at dignissim nibh augue non arcu. Vestibulum non commodo odio, in scelerisque erat. Praesent non pharetra justo.

Pellentesque bibendum posuere lacus a consequat. Aenean sed nulla quis quam convallis mollis. Aliquam ut porttitor neque. Nullam tortor augue, pulvinar vitae odio ut, auctor facilisis felis. Vestibulum viverra, sem sit amet dapibus lacinia, justo nisi interdum ligula, ut hendrerit lacus dui sit amet purus. In eleifend velit a convallis dictum. Morbi diam justo, mollis sed congue a, mattis sit amet elit. Integer faucibus dapibus dolor eu mattis. Donec venenatis magna non iaculis ullamcorper. Proin iaculis mi in molestie bibendum. Vestibulum molestie lorem sit amet justo ornare, in vestibulum enim sollicitudin.

Quisque et nunc lacinia, dictum tellus ut, congue ipsum. Pellentesque arcu tortor, vulputate at consequat at, ullamcorper quis arcu. Nullam augue augue, imperdiet ullamcorper tellus vel, semper lobortis tortor. Quisque sed lorem ut felis tristique tempus. Nam non lacus sapien. Suspendisse lorem quam, interdum non sem id, imperdiet malesuada libero. Nullam rhoncus tempor metus, eget condimentum felis maximus ac. Nullam molestie velit eu aliquam rutrum. Proin et hendrerit erat. Duis sagittis vestibulum accumsan.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper eros sit amet lobortis accumsan. Cras in sagittis odio. Cras aliquet nunc ut ligula venenatis laoreet. Etiam vitae dolor eget urna fringilla aliquet vel quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc et massa metus. Cras eget vehicula dui. Donec eu neque justo. Vestibulum tempor in nulla at porttitor.

Cras vulputate elit vitae fermentum vulputate. Suspendisse mattis nibh eget nunc pellentesque, et rhoncus lacus iaculis. Ut cursus ut metus ac semper. Aliquam lacinia lacinia purus. Cras pellentesque leo urna, eget dignissim turpis vulputate id. Etiam sodales ipsum eget libero dictum interdum sed eu quam. Praesent hendrerit, sapien at suscipit pulvinar, turpis augue semper metus, in dictum nibh diam consequat nunc. Quisque egestas felis sed enim accumsan, nec consequat dolor lacinia. Suspendisse pretium finibus malesuada. Proin eu tristique mauris. Pellentesque eu auctor libero, in aliquam tortor. Curabitur blandit nisi lorem. Integer in vulputate neque.

Suspendisse potenti. Curabitur vitae malesuada tortor. Aenean vel sodales quam. Nunc turpis odio, imperdiet eu nisi id, faucibus bibendum lectus. Morbi augue urna, ultricies et sapien ac, mollis faucibus eros. Maecenas feugiat, nunc vel viverra iaculis, turpis odio venenatis urna, at dignissim nibh augue non arcu. Vestibulum non commodo odio, in scelerisque erat. Praesent non pharetra justo.

Pellentesque bibendum posuere lacus a consequat. Aenean sed nulla quis quam convallis mollis. Aliquam ut porttitor neque. Nullam tortor augue, pulvinar vitae odio ut, auctor facilisis felis. Vestibulum viverra, sem sit amet dapibus lacinia, justo nisi interdum ligula, ut hendrerit lacus dui sit amet purus. In eleifend velit a convallis dictum. Morbi diam justo, mollis sed congue a, mattis sit amet elit. Integer faucibus dapibus dolor eu mattis. Donec venenatis magna non iaculis ullamcorper. Proin iaculis mi in molestie bibendum. Vestibulum molestie lorem sit amet justo ornare, in vestibulum enim sollicitudin.

Quisque et nunc lacinia, dictum tellus ut, congue ipsum. Pellentesque arcu tortor, vulputate at consequat at, ullamcorper quis arcu. Nullam augue augue, imperdiet ullamcorper tellus vel, semper lobortis tortor. Quisque sed lorem ut felis tristique tempus. Nam non lacus sapien. Suspendisse lorem quam, interdum non sem id, imperdiet malesuada libero. Nullam rhoncus tempor metus, eget condimentum felis maximus ac. Nullam molestie velit eu aliquam rutrum. Proin et hendrerit erat. Duis sagittis vestibulum accumsan.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper eros sit amet lobortis accumsan. Cras in sagittis odio. Cras aliquet nunc ut ligula venenatis laoreet. Etiam vitae dolor eget urna fringilla aliquet vel quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc et massa metus. Cras eget vehicula dui. Donec eu neque justo. Vestibulum tempor in nulla at porttitor.

Cras vulputate elit vitae fermentum vulputate. Suspendisse mattis nibh eget nunc pellentesque, et rhoncus lacus iaculis. Ut cursus ut metus ac semper. Aliquam lacinia lacinia purus. Cras pellentesque leo urna, eget dignissim turpis vulputate id. Etiam sodales ipsum eget libero dictum interdum sed eu quam. Praesent hendrerit, sapien at suscipit pulvinar, turpis augue semper metus, in dictum nibh diam consequat nunc. Quisque egestas felis sed enim accumsan, nec consequat dolor lacinia. Suspendisse pretium finibus malesuada. Proin eu tristique mauris. Pellentesque eu auctor libero, in aliquam tortor. Curabitur blandit nisi lorem. Integer in vulputate neque.

Suspendisse potenti. Curabitur vitae malesuada tortor. Aenean vel sodales quam. Nunc turpis odio, imperdiet eu nisi id, faucibus bibendum lectus. Morbi augue urna, ultricies et sapien ac, mollis faucibus eros. Maecenas feugiat, nunc vel viverra iaculis, turpis odio venenatis urna, at dignissim nibh augue non arcu. Vestibulum non commodo odio, in scelerisque erat. Praesent non pharetra justo.

Pellentesque bibendum posuere lacus a consequat. Aenean sed nulla quis quam convallis mollis. Aliquam ut porttitor neque. Nullam tortor augue, pulvinar vitae odio ut, auctor facilisis felis. Vestibulum viverra, sem sit amet dapibus lacinia, justo nisi interdum ligula, ut hendrerit lacus dui sit amet purus. In eleifend velit a convallis dictum. Morbi diam justo, mollis sed congue a, mattis sit amet elit. Integer faucibus dapibus dolor eu mattis. Donec venenatis magna non iaculis ullamcorper. Proin iaculis mi in molestie bibendum. Vestibulum molestie lorem sit amet justo ornare, in vestibulum enim sollicitudin.

Quisque et nunc lacinia, dictum tellus ut, congue ipsum. Pellentesque arcu tortor, vulputate at consequat at, ullamcorper quis arcu. Nullam augue augue, imperdiet ullamcorper tellus vel, semper lobortis tortor. Quisque sed lorem ut felis tristique tempus. Nam non lacus sapien. Suspendisse lorem quam, interdum non sem id, imperdiet malesuada libero. Nullam rhoncus tempor metus, eget condimentum felis maximus ac. Nullam molestie velit eu aliquam rutrum. Proin et hendrerit erat. Duis sagittis vestibulum accumsan.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper eros sit amet lobortis accumsan. Cras in sagittis odio. Cras aliquet nunc ut ligula venenatis laoreet. Etiam vitae dolor eget urna fringilla aliquet vel quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc et massa metus. Cras eget vehicula dui. Donec eu neque justo. Vestibulum tempor in nulla at porttitor.

Cras vulputate elit vitae fermentum vulputate. Suspendisse mattis nibh eget nunc pellentesque, et rhoncus lacus iaculis. Ut cursus ut metus ac semper. Aliquam lacinia lacinia purus. Cras pellentesque leo urna, eget dignissim turpis vulputate id. Etiam sodales ipsum eget libero dictum interdum sed eu quam. Praesent hendrerit, sapien at suscipit pulvinar, turpis augue semper metus, in dictum nibh diam consequat nunc. Quisque egestas felis sed enim accumsan, nec consequat dolor lacinia. Suspendisse pretium finibus malesuada. Proin eu tristique mauris. Pellentesque eu auctor libero, in aliquam tortor. Curabitur blandit nisi lorem. Integer in vulputate neque.

Suspendisse potenti. Curabitur vitae malesuada tortor. Aenean vel sodales quam. Nunc turpis odio, imperdiet eu nisi id, faucibus bibendum lectus. Morbi augue urna, ultricies et sapien ac, mollis faucibus eros. Maecenas feugiat, nunc vel viverra iaculis, turpis odio venenatis urna, at dignissim nibh augue non arcu. Vestibulum non commodo odio, in scelerisque erat. Praesent non pharetra justo.

Pellentesque bibendum posuere lacus a consequat. Aenean sed nulla quis quam convallis mollis. Aliquam ut porttitor neque. Nullam tortor augue, pulvinar vitae odio ut, auctor facilisis felis. Vestibulum viverra, sem sit amet dapibus lacinia, justo nisi interdum ligula, ut hendrerit lacus dui sit amet purus. In eleifend velit a convallis dictum. Morbi diam justo, mollis sed congue a, mattis sit amet elit. Integer faucibus dapibus dolor eu mattis. Donec venenatis magna non iaculis ullamcorper. Proin iaculis mi in molestie bibendum. Vestibulum molestie lorem sit amet justo ornare, in vestibulum enim sollicitudin.

Quisque et nunc lacinia, dictum tellus ut, congue ipsum. Pellentesque arcu tortor, vulputate at consequat at, ullamcorper quis arcu. Nullam augue augue, imperdiet ullamcorper tellus vel, semper lobortis tortor. Quisque sed lorem ut felis tristique tempus. Nam non lacus sapien. Suspendisse lorem quam, interdum non sem id, imperdiet malesuada libero. Nullam rhoncus tempor metus, eget condimentum felis maximus ac. Nullam molestie velit eu aliquam rutrum. Proin et hendrerit erat. Duis sagittis vestibulum accumsan.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper eros sit amet lobortis accumsan. Cras in sagittis odio. Cras aliquet nunc ut ligula venenatis laoreet. Etiam vitae dolor eget urna fringilla aliquet vel quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc et massa metus. Cras eget vehicula dui. Donec eu neque justo. Vestibulum tempor in nulla at porttitor.

Cras vulputate elit vitae fermentum vulputate. Suspendisse mattis nibh eget nunc pellentesque, et rhoncus lacus iaculis. Ut cursus ut metus ac semper. Aliquam lacinia lacinia purus. Cras pellentesque leo urna, eget dignissim turpis vulputate id. Etiam sodales ipsum eget libero dictum interdum sed eu quam. Praesent hendrerit, sapien at suscipit pulvinar, turpis augue semper metus, in dictum nibh diam consequat nunc. Quisque egestas felis sed enim accumsan, nec consequat dolor lacinia. Suspendisse pretium finibus malesuada. Proin eu tristique mauris. Pellentesque eu auctor libero, in aliquam tortor. Curabitur blandit nisi lorem. Integer in vulputate neque.

Suspendisse potenti. Curabitur vitae malesuada tortor. Aenean vel sodales quam. Nunc turpis odio, imperdiet eu nisi id, faucibus bibendum lectus. Morbi augue urna, ultricies et sapien ac, mollis faucibus eros. Maecenas feugiat, nunc vel viverra iaculis, turpis odio venenatis urna, at dignissim nibh augue non arcu. Vestibulum non commodo odio, in scelerisque erat. Praesent non pharetra justo.

Pellentesque bibendum posuere lacus a consequat. Aenean sed nulla quis quam convallis mollis. Aliquam ut porttitor neque. Nullam tortor augue, pulvinar vitae odio ut, auctor facilisis felis. Vestibulum viverra, sem sit amet dapibus lacinia, justo nisi interdum ligula, ut hendrerit lacus dui sit amet purus. In eleifend velit a convallis dictum. Morbi diam justo, mollis sed congue a, mattis sit amet elit. Integer faucibus dapibus dolor eu mattis. Donec venenatis magna non iaculis ullamcorper. Proin iaculis mi in molestie bibendum. Vestibulum molestie lorem sit amet justo ornare, in vestibulum enim sollicitudin.

Quisque et nunc lacinia, dictum tellus ut, congue ipsum. Pellentesque arcu tortor, vulputate at consequat at, ullamcorper quis arcu. Nullam augue augue, imperdiet ullamcorper tellus vel, semper lobortis tortor. Quisque sed lorem ut felis tristique tempus. Nam non lacus sapien. Suspendisse lorem quam, interdum non sem id, imperdiet malesuada libero. Nullam rhoncus tempor metus, eget condimentum felis maximus ac. Nullam molestie velit eu aliquam rutrum. Proin et hendrerit erat. Duis sagittis vestibulum accumsan.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper eros sit amet lobortis accumsan. Cras in sagittis odio. Cras aliquet nunc ut ligula venenatis laoreet. Etiam vitae dolor eget urna fringilla aliquet vel quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc et massa metus. Cras eget vehicula dui. Donec eu neque justo. Vestibulum tempor in nulla at porttitor.

Cras vulputate elit vitae fermentum vulputate. Suspendisse mattis nibh eget nunc pellentesque, et rhoncus lacus iaculis. Ut cursus ut metus ac semper. Aliquam lacinia lacinia purus. Cras pellentesque leo urna, eget dignissim turpis vulputate id. Etiam sodales ipsum eget libero dictum interdum sed eu quam. Praesent hendrerit, sapien at suscipit pulvinar, turpis augue semper metus, in dictum nibh diam consequat nunc. Quisque egestas felis sed enim accumsan, nec consequat dolor lacinia. Suspendisse pretium finibus malesuada. Proin eu tristique mauris. Pellentesque eu auctor libero, in aliquam tortor. Curabitur blandit nisi lorem. Integer in vulputate neque.

Suspendisse potenti. Curabitur vitae malesuada tortor. Aenean vel sodales quam. Nunc turpis odio, imperdiet eu nisi id, faucibus bibendum lectus. Morbi augue urna, ultricies et sapien ac, mollis faucibus eros. Maecenas feugiat, nunc vel viverra iaculis, turpis odio venenatis urna, at dignissim nibh augue non arcu. Vestibulum non commodo odio, in scelerisque erat. Praesent non pharetra justo.

Pellentesque bibendum posuere lacus a consequat. Aenean sed nulla quis quam convallis mollis. Aliquam ut porttitor neque. Nullam tortor augue, pulvinar vitae odio ut, auctor facilisis felis. Vestibulum viverra, sem sit amet dapibus lacinia, justo nisi interdum ligula, ut hendrerit lacus dui sit amet purus. In eleifend velit a convallis dictum. Morbi diam justo, mollis sed congue a, mattis sit amet elit. Integer faucibus dapibus dolor eu mattis. Donec venenatis magna non iaculis ullamcorper. Proin iaculis mi in molestie bibendum. Vestibulum molestie lorem sit amet justo ornare, in vestibulum enim sollicitudin.

Quisque et nunc lacinia, dictum tellus ut, congue ipsum. Pellentesque arcu tortor, vulputate at consequat at, ullamcorper quis arcu. Nullam augue augue, imperdiet ullamcorper tellus vel, semper lobortis tortor. Quisque sed lorem ut felis tristique tempus. Nam non lacus sapien. Suspendisse lorem quam, interdum non sem id, imperdiet malesuada libero. Nullam rhoncus tempor metus, eget condimentum felis maximus ac. Nullam molestie velit eu aliquam rutrum. Proin et hendrerit erat. Duis sagittis vestibulum accumsan.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper eros sit amet lobortis accumsan. Cras in sagittis odio. Cras aliquet nunc ut ligula venenatis laoreet. Etiam vitae dolor eget urna fringilla aliquet vel quis est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc et massa metus. Cras eget vehicula dui. Donec eu neque justo. Vestibulum tempor in nulla at porttitor.

Cras vulputate elit vitae fermentum vulputate. Suspendisse mattis nibh eget nunc pellentesque, et rhoncus lacus iaculis. Ut cursus ut metus ac semper. Aliquam lacinia lacinia purus. Cras pellentesque leo urna, eget dignissim turpis vulputate id. Etiam sodales ipsum eget libero dictum interdum sed eu quam. Praesent hendrerit, sapien at suscipit pulvinar, turpis augue semper metus, in dictum nibh diam consequat nunc. Quisque egestas felis sed enim accumsan, nec consequat dolor lacinia. Suspendisse pretium finibus malesuada. Proin eu tristique mauris. Pellentesque eu auctor libero, in aliquam tortor. Curabitur blandit nisi lorem. Integer in vulputate neque.

Suspendisse potenti. Curabitur vitae malesuada tortor. Aenean vel sodales quam. Nunc turpis odio, imperdiet eu nisi id, faucibus bibendum lectus. Morbi augue urna, ultricies et sapien ac, mollis faucibus eros. Maecenas feugiat, nunc vel viverra iaculis, turpis odio venenatis urna, at dignissim nibh augue non arcu. Vestibulum non commodo odio, in scelerisque erat. Praesent non pharetra justo.

Pellentesque bibendum posuere lacus a consequat. Aenean sed nulla quis quam convallis mollis. Aliquam ut porttitor neque. Nullam tortor augue, pulvinar vitae odio ut, auctor facilisis felis. Vestibulum viverra, sem sit amet dapibus lacinia, justo nisi interdum ligula, ut hendrerit lacus dui sit amet purus. In eleifend velit a convallis dictum. Morbi diam justo, mollis sed congue a, mattis sit amet elit. Integer faucibus dapibus dolor eu mattis. Donec venenatis magna non iaculis ullamcorper. Proin iaculis mi in molestie bibendum. Vestibulum molestie lorem sit amet justo ornare, in vestibulum enim sollicitudin.

Quisque et nunc lacinia, dictum tellus ut, congue ipsum. Pellentesque arcu tortor, vulputate at consequat at, ullamcorper quis arcu. Nullam augue augue, imperdiet ullamcorper tellus vel, semper lobortis tortor. Quisque sed lorem ut felis tristique tempus. Nam non lacus sapien. Suspendisse lorem quam, interdum non sem id, imperdiet malesuada libero. Nullam rhoncus tempor metus, eget condimentum felis maximus ac. Nullam molestie velit eu aliquam rutrum. Proin et hendrerit erat. Duis sagittis vestibulum accumsan.
</body>
</html>