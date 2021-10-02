/**
 * 
 */
function okpro(ele){
	vs = $(ele).parents(".form-group").find('.sp');
	
	vs.empty();
	
	$("<img>",{
		'src' : '../images/check.png',
		'width' : '10px',
		'height' : '10px'
	}).appendTo(vs)
	//$(ele).css('border','2px solid blue')
}

function nopro(ele, str){
	vs = $(ele).parents(".form-group").find('.sp');
	
	vs.empty();
	
	$(vs).html(str).css('color', 'red');
}

function idcheck(){
	// 입력한 id값 가져오기
	idvalue = $('#id').val().trim();
	// 공백체크
	if(idvalue.length < 1){
		alert("ID를 입력하세요");
		return false;
	}
	// 최소 최대 길이 4~8
	if(idvalue.length < 4 || idvalue > 8){
		alert("아이디는 4~8자리 입니다");
		return false;
	}
	// 정규식- 영문 대소문자로 시작 숫자와 조합
	regid  = /^[a-zA-Z][a-zA-Z0-9]{3,7}$/;
	
	// 입력한 값과 정규식에 맞는지 비교
	// 정규식.test(value)
	if(regid.test(idvalue)){
		return true;
	}else{
		alert("입력형식오류")
		return false;
	}
}

// 이름 체크
function nameCheck(){
	
	namevalue = $('#name').val().trim();
	
}












