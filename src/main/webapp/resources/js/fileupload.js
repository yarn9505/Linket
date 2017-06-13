/**
 * 	파일 업로드시 필요한 함수들 정의
 */


/** 이미지 타입 체크 */
function checkImageType(fileName){
	
	var pattern = /jpg|gif|png/i;
	return fileName.match(pattern);
}

/* 일반 이미지 파일 경로 추출 (썸네일 빼고) */
function getImageLink(fileName){
	if(!checkImageType(fileName)){		//이미지 파일이 아니면 종료
		return;
	}
	
	var front = fileName.substr(0, 12);	// 0~ 12개 : /년/월/일 경로 추출
	var end = fileName.substr(14);	// 14~ 끝까지 : 's_' 만 제거
	return front + end;
}

/** 일반 파일일 경우 이름 줄이기 (원래 이름만) */
function getOriginalName(fileName){
	if(checkImageType(fileName)){
		return;
	}
	var index = fileName.indexOf("_") +1;	// 첫번째 '_' 값 찾아서 index값 반환
	return fileName.substr(index);
}

function getDisplayLink(fileName){
	return "/board/displayFile?fileName=" + getImageLink(fileName);
}

/* href 클릭 함수 */
function hrefFunc(fileName){
	$("#hrefId").attr("target","_blank");
	location.href="/board/displayFile?fileName=" + getImageLink(fileName);
}
	