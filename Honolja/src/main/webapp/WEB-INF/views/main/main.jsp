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

	
		//진행률  표시
		function progress(){
			
			var selector = document.getElementById("sel1");
		    var value = selector[selector.selectedIndex].value;
		    
		    //지역, 체크인, 체크아웃 입력 확인 Flag
		    var checkFlag = new Array();

		    //true 개수 , 개수에 따라 35% / 70% / 100% 
		    var countTrue = 0;
		    //진행률
		    var percent = 0;
		    
		    
		    
		    //Flag 초기화
		    for(var i; i<checkFlag.length; i++){
		    	checkFlag = false;
		    }
			
		    //지역이 선택되어 있으면 true 아니면 false
		    if(value == "선택"){
		    	checkFlag[0] = false;
		    }else{
		    	checkFlag[0] = true;
		    }
		    
		    //체크 인이 입력되어 있으면 true 아니면 false
		    if(document.getElementById("datepicker").value == ""){
		    	checkFlag[1] = false;
		    }else{
		    	checkFlag[1] = true;
		    }
		    
		    //체크 아웃이 입력되어 있으면 true 아니면 false
			if(document.getElementById("datepicker1").value == ""){
				checkFlag[2] = false
		    }else{
		    	checkFlag[2] = true
		    }
			
			//true의 갯수 카운트
			for(var i=0; i<checkFlag.length; i++){
				
				if(checkFlag[i] == true){
					countTrue++;
				}
			}
			
			//개수에 따라 35% / 70% / 100% 
			switch(countTrue){
					
				case 1:
					percent = 35;
					color = "progress-bar-danger";
					break;
					
				case 2:
					percent = 70;
					color = "progress-bar-warning";
					break;
					
				case 3:
					percent = 100;
					color = "progress-bar-info";
					break;
				
				default:
					percent = 0;
					color = "";
					break;
			}
		    

						
			var string = "<div class='progress'>";
			string += "<div class='progress-bar "+color+" progress-bar-striped active' role='progressbar' aria-valuenow='"+percent+"' aria-valuemin='0' aria-valuemax='100' style='width:"+percent+"%'>";
			string += percent + "% Complete";
			string += "</div>";
			string += "</div>";
				
			document.getElementById("progress").innerHTML = string;
			
		}
			
		//진행률 초기화
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
		
		function nullCheck(){
			
			var selector = document.getElementById("sel1");
		    var value = selector[selector.selectedIndex].value;
		    
		    var check_in = document.getElementById("datepicker").value;
		    var check_out = document.getElementById("datepicker1").value;
		    
		    if(value == "선택"){
		    	alert("지역을 선택해주세요.");	
		    	return;
		    }
		    
		    if(check_in == ""){
		    	alert("체크인을 입력하세요.");	
		    	return;
		    }
		    
		    if(check_out == ""){
		    	alert("체크아웃을 입력하세요.");	
		    	return;
		    }
		    
		    var in_string_array = new Array();
		    var out_string_array = new Array();   
		    
		    var in_array = new Array();
		    var out_array = new Array();
		    
		    in_string_array = check_in.split("/");
		    out_string_array = check_out.split("/");
		    
		    for(i in in_string_array){
		    	in_array[i] = parseInt(in_string_array[i]);
		    }
		    
		    for(i in out_string_array){
		    	out_array[i] = parseInt(out_string_array[i]);
		    }
		   
		    		
    		//체크인 연 <= 체크아웃 연
    		if(in_array[0] <= out_array[0]){
    			
    			//체크인 연 == 체크아웃 연
    			if(in_array[0] == out_array[0]){
    				
				    //만약에 체크인 월 <= 체크아웃 월 이면,
				    if(in_array[1] <= out_array[1]){
				    	
					    //만약에 체크인 월 == 체크아웃 월 이면,
					    if(in_array[1] == out_array[1]){
					    	
					    	//체크아웃 일 - 체크인 일  <= 10
					    	if(out_array[2] - in_array[2] <= 10 && out_array[2] - in_array[2] > 0){
					    		
					    		document.getElementById("check_form").submit();
					    		
					    	//체크아웃 일 < 체크인 일
					    	}else if(out_array[2] - in_array[2] < 0){
					    		alert("체크아웃 일이 체크인 일보다 이전일 수 없습니다.");
					    	}else{
					    		alert("10일 이상 예약이 불가합니다.");
					    	}
					    
					    //만약에 체크인 월 < 체크아웃 월 이면,
					    }else{
					    	
					    	//체크아웃 월 - 체크인 월 == 1
					    	if(out_array[1] - in_array[1] == 1){
		
					    		//(체크인 월의 말일 - 체크인 일) + (체크아웃 일) <=10;
					    		if(endOfDay(in_array[1]) - in_array[2] + out_array[2] <= 10){
					    			
					    			document.getElementById("check_form").submit();
    							
					    		}else{
					    			alert("10일 이상 예약이 불가합니다.");
					    		}
					    	}else{
					    		alert("1달 이내에만 예약이 가능합니다.");
					    	}
					    }				  	
				    }else{
				    	alert("체크인 월이 체크아웃 월보다 클 수 없습니다.");
				    }
    			//체크인  연< 체크아웃 연
    			}else{
    			
    				//체크 아웃 연 - 체크 인 연 == 1
    				if(out_array[0] - in_array[0] == 1){	
    				
    					//체크인 월== 11월 && 체크 아웃 월== 1월 
    					if(in_array[1] == 11 && out_array[1] == 1){
    						
    						//(11월 말일 - 체크인 일) + 체크아웃 일 <= 10; 
    						if(endOfDay(11) - in_array[2] + out_array[2] <= 10){
 
    							document.getElementById("check_form").submit();
					    
    						}else{
    							alert("10일 이상 예약이 불가합니다.");
    						} 	
    					}else{
    						alert("1달 이내에만 예약이 가능합니다.");
    					}
    				}else{
    					alert("기간이 1년 이상 차이 납니다.");
    				}
    			}	
    		}else{
    			alert("체크인 연도는 체크아웃 연도보다 클 수 없습니다.");
    		}
			
		}
		
		function endOfDay(month){
			
			var thirty_one = [1,3,5,7,8,10,12];
			var thirty = [4,6,9,11];
			var twenty_eight = 2;
			
			var day;
					
			for(i in thirty_one){
				if(thirty_one[i] == month){
					day = 31;
				}
			}
			
			for(i in thirty){
				if(thirty[i] == month){
					day = 30;
				}
			}
			
			if(twenty_eight[i] == month){
				day = 28;
			}	
			
			return day
		}
		
	</script>
     
</head>
<body style="margin-top: 50px;">
	
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
					
					
			<!-- 지역 / 체크인 / 체크아웃 검색 창 시작 -->
			<form id = "check_form" action="#">
				<div class="form-group">
					<label for="sel1">지역</label>
					<select class="form-control" id="sel1" name="area" onchange="progress();">
						<option>선택</option>
						<option value="seoul">서울</option>
						<option value="gyeonggi">경기</option>
						<option value="gangwon">강원</option>
						<option value="chungbuk">충북</option>
						<option value="chungnam">충남</option>
						<option value="jeollabuk">전북</option>
						<option value="jeollanam">전남</option>
						<option value="gyeongbuk">경북</option>
						<option value="gyeongnam">경남</option>
						<option value="jeju">제주</option>
					</select>
				</div>
				<!-- Check-IN 날짜 -->
				<label for="sel1">Check-IN</label>							
					<div><input type = "text" readonly="readonly" name="check_in" id="datepicker" width="276" onchange="progress();"/></div>
				<br>
					
				<!-- Check-OUT 날짜 -->
				<label for="sel1">Check-OUT</label>
					<div><input type = "text" readonly="readonly" name="check_out" id="datepicker1" width="276" onchange="progress();"/></div>
				<br>
				
				<div id = "progress"></div>

				
					
				<br>
				<div class="btn-group">
					<button type="button" class="btn btn-primary" onclick = "nullCheck();">CHECK</button>
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