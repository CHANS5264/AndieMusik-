<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>An Die Musik</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free singlepage web template created by GraphBerry">
    <meta name="keywords" content="HTML5, Bootstrap 3, CSS3, javascript, PHP, Responsive, Mobile">
    <meta name="author" content="GraphBerry.com"/>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i" rel="stylesheet">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/modus/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/modus/css/slick.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/modus/css/style.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script>
 currentPage = 1; //현재페이지
 
 $(function(){
	 readNotice = function(page){
			//공지사항 목록 보기
			$.ajax({
				url : '/ADM/NoticeList.do',
				method : 'post',
				data : {"page" : page},
				success : function(res){
					code = '<div class="container listform">';
					code =	'<h2>ADM소식</h2><i id = "plus" class="far fa-plus-square"></i>';
					code += '<hr>'
					code +=	'  <table class="table table-hover">';
					code +=	'    <thead>';
					code +=	'      <tr>';
					code +=	'        <th width="50px" >번호</th>';
					code +=	'        <th width="200px">제목</th>';
					code +=	'        <th width="60px">날짜</th>';
					code +=	'      </tr>';
					code +=	'    </thead>';
					code +=	'	    <tbody>';
					
					$.each(res.datas, function(i, v){
						if(v.rnum == "6"){
							return false;
						}
						code += '<tr>';
						code += '<td class="td_no">' + v.rnum + '</td>';
						code += '<td><a href = "/ADM/NoticeDetail.do?notice_code=' + v.code +'"class = "tt" >' + v.title + '</a></td>';
						code += '<td class="td_date">' + v.date.substr(2, 9) + '</td>';
						code += '</tr>';	
					})
					
					code +=	'    </tbody>';
					code +=	'  </table>';
					code +=	'</div>';
					
					$('#list').html(code);
					
					pages = '<div class="pag1">';
					
					//페이지 리스트 만들기
					pages+='<nav aria-label="Page navigation example">';
					
					//이전버튼 <
					if(res.sp > 1){
						pages+='  <ul class="pagination">';
						pages+='    <li class="pre">';
						pages+='      <a class="before" href="#" aria-label="Previous">';
						pages+='        <span aria-hidden="true">&laquo;</span>';
						pages+='      </a>';
						pages+='   </li>';
						pages+='  </ul>';
					}
					pages+='  <ul class="pagination">';
					//페이지 번호 출력
					for(i=res.sp; i<=res.ep; i++){
						//현재 페이지와 i값이 같은지
						if(currentPage == i){
							pages+='    <li class="page-item"><a class="nowPage" href="#">' + i + '</a></li>';
						}else{
							pages+='    <li><a class="nowPage" href="#">' + i + '</a></li>';
						}
					}
					pages+='  </ul>';
					
					//다음 버튼 만들기 >
					if(res.ep < res.tp){
						pages+='  <ul class="pagination">';
						pages+='    <li class="next">';
						pages+='      <a class="next" href="#" aria-label="Next">';
						pages+='        <span aria-hidden="true">&raquo;</span>';
						pages+='      </a>';
						pages+='    </li>';
						pages+='  </ul>';
					}
					pages+='</nav>';
					pages+='</div>';
					
					$('#pageList').html(pages);
				},
				
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
				
			})
		};
	 
	 readNotice(1);
	 
	
	 
	 $('#list').on('click','#plus',function(){
		location.href = '<%=request.getContextPath()%>/notice/notice_index.jsp' ;
	 })
	 
	 $('#pbl').on('click',function(){
		 location.href= '<%=request.getContextPath()%>/SelectPblDetail.do?code=11';
	 })
	 
 })

</script>
  
  <style>
  i{
  	font-size : 25px;
  	margin-left: 3%;
  }
  
  i:hover{
  	cursor: pointer;
  }
  
  #list{
  	width : 100%;
  	padding : 30px;
  	margin-left: 3%;
  	
  	height: 100%;
  }
  	#list table{
  		width : 90%;
  		height: 90%;
  		font-family: sans-serif;
  	}
  	#list h2{
  		text-align: center;
  		display: inline;
  	}
  	
  	.line{
  		display: flex;
  		flex-direction: row;
  		width : 100%;
  		
  	}
  	#part3{
  		margin-right: 3%;
  	}
  	#list, #part2, #part3{
  		width : 26%;
  		border : 1px solid lightgray;
  		border-radius: 15px;
  		box-shadow: 0px 0px 20px 10px rgba(50, 50, 50, 0.4);
  	}
  	#part_2{
  		display: flex;
  		flex-direction: row;
  		width : 100%;
  		height: 100%;
  	}
  	#recommend{
  		width : 70%;
  		height: 75%;
  		margin-left: 3%;
  		
  	}
  	.pad{
  		width : 5%;
  	}
  	.pad2{
  		width : 12%;
  	}
  	#imgTitle{
  		padding-top: 20px;
		height: 15%;	
  	}
  	
  	#recImg{
  		width : 100%;
  		height: 100%;
  		border : 10px double #C4C4C4
  	}
  	
  	#imgTitle h4{
		display : inline;
  		font-weight: bold;
  		text-align: center;
  		font-size: 25px;
  		margin-left: 30%;
  	}
  	#padbottom{
  		height: 2%;
  	}
  
  </style>
  
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>

	<header id="header">
		
		<!-- Section title -->
		<h1 class="sr-only">Modus | Home page</h1>
		
		<nav class="navbar navbar-default navbar-fixed-top">
		  <!-- Section title -->
		  <h1 class="sr-only">Main navigation</h1>

		  <div class="container">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand smoothScroll" href="#home">
		        <img alt="Modus" src="<%=request.getContextPath() %>/modus/img/로고.png">
		      </a>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="main-navbar">
		      <ul class="nav navbar-nav navbar-right">
		        <li class="active"><a class="smoothScroll" href="#home">Home <span class="sr-only">(current)</span></a></li>
		     	<%if(id==null){ %>
		        <li><a class="smoothScroll" href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
		        <li><a class="smoothScroll" href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a></li>
		        <%}else{ %>
		        <li><a class="smoothScroll" href="#portfolio">로그아웃</a></li>
		        <li><a class="smoothScroll" href="<%=request.getContextPath()%>/mypage/mypageIndex.jsp">마이페이지</a></li>
		        <%} %>
		        
<!-- 		        <li><a class="smoothScroll" href="#clients">Clients</a></li> -->
<!-- 		        <li><a class="smoothScroll" href="#contact">Contact</a></li> -->
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container -->
		</nav>

	</header>

	<main>
		<!--  -->	

<!-- 서브네비게이션 hover : "#00c7fc" (sky색) -->
<div id="menubar">
	<ul id="menubar-menus">
		<li>
			<a href="#">공연 정보</a>
		<div><p>
		<a class="menu-style" href="<%=request.getContextPath()%>/selectPbl.do">전체 공연</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 교향악단">대전 시립 교향악단</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 합창단">대전 시립 합창단</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 무용단">대전 시립 무용단</a>
		<a class="smoothScroll" href="<%=request.getContextPath()%>/ticketing/tickecting.jsp">예매하기</a>
		</p></div>
		</li>
		
		<li>
			<a href="#">단체소개</a>
		<div><p>
		<a class="menu-style" href="#">대전 시립 교향악단</a>
		<a class="menu-style" href="#">대전 시립 합창단</a>
		<a class="menu-style" href="#">대전 시립 무용단</a>
		</p></div>
		</li>
		
		
		<li>
			<a href="#">ADM소식</a>
		<div><p>
		<a class="menu-style" href="<%=request.getContextPath()%>/notice/notice_index.jsp">공지사항</a>
		<a class="menu-style" href="#">자유게시판</a>
		<a class="menu-style" href="#">공연 후기</a>
		<a class="smoothScroll" href="<%=request.getContextPath()%>/qna/qna_index.jsp">Q&A</a>
		</p></div>
		</li>
		
		
		<li>
			<a href="#">미디어</a>
		<div><p>
		<a class="menu-style" href="#">하위메뉴 기입 1</a>
		<a class="menu-style" href="#">하위메뉴 기입 2</a>
		<a class="menu-style" href="#">하위메뉴 기입 3</a>
		<a class="smoothScroll" href="#services">화면전환 해보기</a>
		</p></div>
		</li>
		
	</ul>
</div>		


<!-- 서브네비게이션 종료 -->
		
<!-- Section title -->
			<h1 class="sr-only">Home section</h1>




<!-- 캐러셀 (슬라이드) 시작 -->
					<div id="momo" class="container momo">
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
        <img src="<%=request.getContextPath() %>/modus//img/3.jpg" alt="이미지">
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="<%=request.getContextPath() %>/modus//img/1.jpg" alt="이미지">
      
      </div>
    
      <div class="item">
        <img src="<%=request.getContextPath() %>/modus//img/2.jpg" alt="이미지">
      
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
</div>

<!-- 캐러셀 (슬라이드) 종료 -->







		<section id="history" class = "line">

		
			<div class = "pad"></div>
			<div id = "list"></div>
			
			
			<div class = "pad"></div>
			
			
			<div id = "part2">
				<div id = "imgTitle" ><h4>이달의 추천 공연</h4><i id = "pbl" class="far fa-plus-square"></i></div>
				<div id = "part_2">
				<div class = 'pad2'></div>
				<div id = 'recommend'>
					<img id = "recImg" src = "<%=request.getContextPath()%>/images/마티네.jpg">
				</div>
				<div class = 'pad2'></div>
				</div>
				<div id = "padbottom"></div>
			</div>
			
			
			<div class = "pad"></div>
			
			
			<div id = "part3">2</div>
			
			
			<div class = "pad"></div>	

			

		</section>

		<section id="portfolio">

			<!-- Section title -->
			<h1 class="sr-only">Portfolio section</h1>

			<div class="slider-container">



				<figure class="project grabbable">
					<img class="img-responsive" src="<%=request.getContextPath() %>/modus/img/portfolio/01.png" alt="Project Image">
					<div class="description">
						<figcaption><h5>피아졸라 플러스 Ⅱ [피아졸라 & 비발디 사계]</h5></figcaption>
						<p>프로그램소개
A. Vivaldi_ The Four Seasons
비발디_ 사계
Ⅰ. Spring 봄
Ⅱ. Summer 여름
Ⅲ. Autumn 가을
Ⅳ. Winter 겨울
</p>
						<ul class="social-list">
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</figure>
				
								<figure class="project grabbable">
					<img class="img-responsive" src="<%=request.getContextPath() %>/modus/img/portfolio/02.png" alt="Project Image">
					<div class="description">
						<figcaption><h5>Random artwork</h5></figcaption>
						<p>Vivamus suscipit tortor eget felis porttitor
						volutpat. Vestibulum ac diam sit amet
						quam vehicula elementum sed sit amet dui.
						Pellentesque in ipsum id orci. </p>
						<ul class="social-list">
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</figure>
				
								<figure class="project grabbable">
					<img class="img-responsive" src="<%=request.getContextPath() %>/modus/img/portfolio/03.jpg" alt="Project Image">
					<div class="description">
						<figcaption><h5>Random artwork</h5></figcaption>
						<p>Vivamus suscipit tortor eget felis porttitor
						volutpat. Vestibulum ac diam sit amet
						quam vehicula elementum sed sit amet dui.
						Pellentesque in ipsum id orci. </p>
						<ul class="social-list">
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</figure>
				
								<figure class="project grabbable">
					<img class="img-responsive" src="<%=request.getContextPath() %>/modus/img/portfolio/04.jpg" alt="Project Image">
					<div class="description">
						<figcaption><h5>Random artwork</h5></figcaption>
						<p>Vivamus suscipit tortor eget felis porttitor
						volutpat. Vestibulum ac diam sit amet
						quam vehicula elementum sed sit amet dui.
						Pellentesque in ipsum id orci. </p>
						<ul class="social-list">
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</figure>
				
								<figure class="project grabbable">
					<img class="img-responsive" src="<%=request.getContextPath() %>/modus/img/portfolio/05.jpg" alt="Project Image">
					<div class="description">
						<figcaption><h5>Random artwork</h5></figcaption>
						<p>Vivamus suscipit tortor eget felis porttitor
						volutpat. Vestibulum ac diam sit amet
						quam vehicula elementum sed sit amet dui.
						Pellentesque in ipsum id orci. </p>
						<ul class="social-list">
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</figure>
				
								<figure class="project grabbable">
					<img class="img-responsive" src="<%=request.getContextPath() %>/modus/img/portfolio/06.jpg" alt="Project Image">
					<div class="description">
						<figcaption><h5>Random artwork</h5></figcaption>
						<p>Vivamus suscipit tortor eget felis porttitor
						volutpat. Vestibulum ac diam sit amet
						quam vehicula elementum sed sit amet dui.
						Pellentesque in ipsum id orci. </p>
						<ul class="social-list">
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</figure>



		</section>

		<section id="services">

			<!-- Section title -->
			<h1 class="sr-only">Services section</h1>
			
			<div class="container">
				
				<div class="row">
					
					<div class="col-md-4">
						
						<div class="service">
							<figure>
								<img src="<%=request.getContextPath() %>/modus/img/svg/services/idea.svg" alt="Idea image">
								<div class="separator"></div>
								<figcaption><h5>Idea</h5></figcaption>
							</figure>
							<p>Vivamus suscipit tortor eget felis porttitor 
							volutpat. Vestibulum ac diam sit amet 
							quam vehicula elementum sed sit amet dui. 
							Pellentesque in ipsum id orci. </p>
						</div>

					</div>

					<div class="col-md-4">

						<div class="service">
							<figure>
								<img src="<%=request.getContextPath() %>/modus/img/svg/services/work.svg" alt="Work image">
								<div class="separator"></div>
								<figcaption><h5>Work</h5></figcaption>
							</figure>
							<p>Vivamus suscipit tortor eget felis porttitor 
							volutpat. Vestibulum ac diam sit amet 
							quam vehicula elementum sed sit amet dui. 
							Pellentesque in ipsum id orci. </p>
						</div>

					</div>
					
					<div class="col-md-4">

						<div class="service">
							<figure>
								<img src="<%=request.getContextPath() %>/modus/img/svg/services/deliver.svg" alt="Deliver image">
								<div class="separator"></div>
								<figcaption><h5>Deliver</h5></figcaption>
							</figure>
							<p>Vivamus suscipit tortor eget felis porttitor 
							volutpat. Vestibulum ac diam sit amet 
							quam vehicula elementum sed sit amet dui. 
							Pellentesque in ipsum id orci. </p>
						</div>

					</div>

				</div>

			</div>

		</section>

<!-- 		<section id="clients"> -->

<!-- 			<!-- Section title --> -->
<!-- 			<h1 class="sr-only">Clients section</h1> -->
			
<!-- 			<div class="container"> -->

<!-- 				<div class="row"> -->

<!-- 					<div class="col-md-8 col-md-offset-2"> -->

<!-- 						<div class="clients-content"> -->
			
<!-- 							<h2 class="section-title">Our clients are</h2> -->

<!-- 							<blockquote> -->
<!-- 								<p>“Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.  -->
<!-- 								Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Curabitur aliquet quam id dui posuere blandit”</p> -->
<!-- 								<footer><cite title="Mr. Lorem Ipsum">Mr. Lorem Ipsum</cite></footer> -->
<!-- 							</blockquote> -->

<!-- 						</div> -->

<!-- 					</div> -->

<!-- 				</div> -->

<!-- 				<div class="clients-logs-container"> -->

<!-- 					<div class="row"> -->
						
<!-- 						<div class="col-sm-3"> -->
<!-- 							<div class="single-client-container"> -->
<!-- 								<img src="img/svg/clients/stephenson_web_design.svg" alt="Client logo image"> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="col-sm-3"> -->
<!-- 							<div class="single-client-container"> -->
<!-- 								<img src="img/svg/clients/john_doe_design.svg" alt="Client logo image"> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="col-sm-3"> -->
<!-- 							<div class="single-client-container"> -->
<!-- 								<img src="img/svg/clients/john_stephenson.svg" alt="Client logo image"> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="col-sm-3"> -->
<!-- 							<div class="single-client-container"> -->
<!-- 								<img src="img/svg/clients/stephenson_william.svg" alt="Client logo image"> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 					</div> -->

<!-- 				</div> -->

<!-- 			</div> -->

<!-- 		</section> -->

<!-- 		<section id="contact"> -->

<!-- 			<!-- Section title --> -->
<!-- 			<h1 class="sr-only">Contact section</h1> -->
			
<!-- 			<div class="container"> -->
					
<!-- 				<div class="row"> -->
					
<!-- 					<div class="col-md-6"> -->
						
<!-- 						<div id="about-subsection" class="contact-subsection"> -->
							
<!-- 							<h2 class="sub-section-title">About us</h2> -->

<!-- 							<p>Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum  -->
<!-- 							ac diam sit amet quam vehicula elementum sed sit amet dui.  -->
<!-- 							Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.  -->
<!-- 							Curabitur aliquet quam id dui posuere blandit. Donec rutrum  -->
<!-- 							congue leo eget malesuada. Vivamus suscipit tortor eget  -->
<!-- 							felis porttitor volutpat. Vivamus suscipit tortor eget felis.</p> -->

<!-- 						</div> -->

<!-- 					</div> -->

<!-- 					<div class="col-md-6"> -->
						
<!-- 						<div id="form-subsection" class="contact-subsection"> -->
							
<!-- 							<h2 class="sub-section-title">Contact us</h2> -->

<!-- 							<form> -->

<!-- 								<div class="form-group"> -->
<!-- 									<label class="email-label" for="Email">Email</label> -->
<!-- 									<input type="email" class="form-control" id="Email"> -->
<!-- 								</div> -->

<!-- 								<div class="form-group"> -->
<!-- 								    <label class="message-label" for="Message">Message</label> -->
<!-- 								  	<textarea class="form-control" id="Message" rows="2"></textarea> -->
<!-- 								</div> -->
							  
<!-- 							  	<button type="submit" class="btn btn-default pull-right">Send</button> -->

<!-- 							</form> -->

<!-- 						</div> -->

<!-- 					</div> -->

<!-- 				</div> -->

			</div>

		</section>

	</main>

	<footer id="footer">

		<!-- Section title -->
		<h1 class="sr-only">Footer section</h1>
		
		<div class="container">

			<div class="row">

				<div class="col-sm-6">
					<small class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

				</div>

				<div class="col-sm-6">
					<ul class="social-list">
						<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
					</ul>
				</div>

			</div>
			
		</div>

	</footer>

	<!-- Scripts -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/modus/js/smooth-scroll.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/modus/js/modernizr.mq.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/modus/js/slick.min.js"></script>

	<!-- Latest compiled and minified JavaScript Bootstrap-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<!-- Custom JS -->
	<script src="<%=request.getContextPath() %>/modus/js/custom.js"></script>

</body>
</html>