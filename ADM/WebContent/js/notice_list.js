/**
 * 
 */

readNotice = function(page){
	//공지사항 목록 보기
	$.ajax({
		url : '/ADM/NoticeList.do',
		method : 'post',
		data : {"page" : page},
		success : function(res){
			code = '<div class="container">';
			code +=	'<h2>공지사항</h2>';
			code +=	'  <h4>An Die Musik 공지사항입니다.</h4> ';           
			code +=	'  <table class="table table-hover">';
			code +=	'    <thead>';
			code +=	'      <tr>';
			code +=	'        <th width="50px" >NO</th>';
			code +=	'        <th width="300px">TITLE</th>';
			code +=	'        <th width="60px">DATE</th>';
			code +=	'      </tr>';
			code +=	'    </thead>';
			code +=	'	    <tbody>';
			
			$.each(res.datas, function(i, v){
				code += '<tr>';
				code += '<td class="td_no">' + v.code + '</td>';
				code += '<td><a href = "/ADM/NoticeDetail.do?notice_code=' + v.code +'"class = "tt" >' + v.title + '</a></td>';
				code += '<td class="td_date">' + v.date.substr(0, 10) + '</td>';
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
}

	
