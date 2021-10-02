<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.pag1{
	width : 80%;
	margin-left : 45%;
}

.container{
	width : 47%;
	margin-top:5%;
}

th{
	text-align : center;
}
.td_date{
	 text-align : center;
}

.td_no{
	 text-align : center;
}

.td_id{
	text-align: center;
}

.td_cnt{
	text-align: center;
}

.td_score{
	text-align: center;
	
}

#write{
	margin-left : 70%;
}
a:link{
    color : black;	
}
a:visited{
    color : black;
}

/* 	페이지 버튼 위치조정 */
.pagination{
	position : relative;
		left : 20px;
}
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

/* .starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;} */
</style>

<script>
	currentPage = 1;	//현재 페이지
	
	$(function(){
		
			readFboard = function(page){
				
				//공지사항 목록 보기
				$.ajax({
					url : '<%=request.getContextPath()%>/ReviewList.do',
					data : {"page" : page},
					success : function(res){
						code = '<div class="container">';
						code += '<h2>후기게시판</h2>'
						code += '<h4>An Die Musik</h4>';
						code += '<table class="table table-hover">';
						code += 	'<thead>';
						code += 		'<tr>';
						code +='		<th width="100px">번호</th>';
						code +='		<th width="250px">공연명</th>';
						code +='		<th width="300px">제목</th>';
						code +='		<th width="80px">작성자</th>';
						code +='		<th width="100px">날짜</th>';
						code +='		<th width="100px">조회수</th>';
						code +='		<th width="90px">평점</th>';
						code += 		'</tr>';
						code += 	'</thead>';
						code += 		'<tbody>';
						
						$.each(res.datas, function(i, v){
							code += '<tr>';
							code += 	'<td class="td_no">' + v.code + '</td>';
							code += 	'<td class="td_pbl">' + v.pblnm + '</td>';
							code += '	 <td><a href = "/ADM/ReviewDetail.do?rev_code=' + v.code +'&pbl_nm='+ v.pblnm +'" class = "tt" >' + v.title + '</a></td>';
							code += 	'<td class="td_id">' + v.writer + '</td>';
							code += '	 <td class="td_date">' + v.date.substr(0, 10) + '</td>';
							code += 	'<td class="td_cnt">' + v.cnt + '</td>';
							for(i=0; i<v.score; i++){
								
							    code += 	'<td class="td_score">'; 
								code += 	'           <span class="starR on">별1</span>'
// 								code += 	'           <span class="starR1 on">별1_왼쪽</span>'
// 								code += 	'           <span class="starR2">별1_오른쪽</span>'
							    code += 	'</td>'; 
								
							}
							/* code += 	'<td class="td_score">' + v.score + '</td>'; */
							code += '</tr>';	
							code += '</tr>';
						})
						
						code += 	'</table>';
						code += 		'</div>'
						
						$('#list').html(code);
						
						pages = '<div class="pag1">';
						
						//페이지 리스트 생성
						page += '<nav aria-label="Page navigation example">';
						
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
						pages += '<ul class="pagination">';
						
						//페이지 번호 출력
						for(i=res.sp; i<=res.ep; i++){
							//현재 페이지와 i값이 같은지
							if(currentPage == i){
								pages += '<li class="page-item"><a class="nowPage" href="#">' + i + '</a></li>';
							}else{
								pages += '<li><a class="nowPage" href="#">' + i + '</a></li>';
							}
						}
						pages += '</ul>';
						
						//다음 버튼 만들기 >
						if(res.ep < res.tp){
							pages += '<ul class="pagination">';
							pages += 	'<li class="next">';
							pages += 		'<a class="next" href="#" aria-label="Next">';
							pages += 		'<span aria-hidden="true">&raquo;</span>';
							pages += 		'</a>';
							pages += 	'</li>';
							pages += '</ul>';
						}
						pages += '</nav>';
						pages += '</div>';
						
						$('#pageList').html(pages);
					},
					
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					
					dataType : 'json'
					
				});
			}
	
			readFboard(1);
	
			//페이지번호
			$('#pageList').on('click', '.nowPage', function(){
				currentPage = $(this).text().trim();
				
				readFboard(currentPage);
				
			})
			
			//이전버튼
			$('#pageList').on('click', '.before', function(){
				vnext = $('.nowPage').first().text().trim();
				currentPage = parseInt(vnext) - 1;
				readFboard(currentPage);
				
			})
			
			//다음버튼
			$('#pageList').on('click', '.next', function(){
				vnext = $('.nowPage').last().text().trim();
				currentPage = parseInt(vnext) + 1;
				readFboard(currentPage);
			
			})
	
			//글 상세보기
			$('#list').on('click', '.tt', function(){
				vidx = $(this).attr('idx');
			})
			
			//글쓰기 버튼
			$('#write').on('click', function(){
				location.href = '<%=request.getContextPath()%>/ReviewinsertForm.do';
			});
	
	
	
	
});
</script>
</head>
<body>

<div id="list"></div>
<div id="pageList"></div>
<button type="button" class="btn btn-default" id="write">글쓰기</button>
</body>
</html>