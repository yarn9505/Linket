<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${cateDTO.cateName}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/resources/js/fileupload.js"></script>
<script type="text/javascript" src="/resources/jquery-3.2.1.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h3>
					<span class="glyphicon glyphicon-volume-up" style="color: #0E3E59;">&nbsp;${cateDTO.cateName} 작성하기</span>
				</h3>
				<br/><br/>
				<form name="tx_editor_form" id="tx_editor_form" method="post" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<th style="width: 10%;">카테고리</th>
							<td><input type="text" class="form-control" value = "${cateDTO.cateName}" readonly>
								<input type="hidden" name="cateId" value="${boardDTO.cateId}" />
						</tr>
						<tr>
							<th style="width: 10%;">작성자</th>
							<td><input type="text" class="form-control" value = "${boardDTO.userId}" readonly>
								<input type="hidden" name="userId" value="${boardDTO.userId}" />
							</td>
						</tr>
						<tr>
						
							<th style="width: 10%;">제목</th>
							<td><input type="text" class="form-control" id="bTitle" name="bTitle" required="required"/></td>
						</tr>
						<tr>
							<th style="width: 10%">상품가치</th>
							<td><input type="text" id="value" name="value" class="form-control" placeholder="숫자로 입력" /> 원</td>
						</tr>
						<tr>
							<th style="width: 10%;">내용</th>
							<td id="editor_frame"></td>
						</tr>
					</table>
					
					<div align="right">
						<input type="hidden" value="${loginSession.lat }" name="lat" /> 
						<input type="hidden" value="${loginSession.lon }" name="lon" />
						<button type="button" class="btn btn-defalut" onclick="javascript:history.back();">취소</button>
						<button type="button"  class="btn btn-defalut" id="save"  onclick="insertBoard(); return false;">
						<img src="/resources/images/writeBtn.png" style="width: 60px;"></button>
					</div>
				</form>
				<br /> <br /> <br />
			</div>
		</div>
		<script type="text/javascript">
		
			var editorObj;
		
			$(function() {
		
				$.ajax({
					type : "get",
					url : "/resources/daumEditor/editor_template.html",
					success : function(data) {
						$("#editor_frame").html(data);
						// 에디터UI load
						var config = {
							/* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
							txHost : '',
							/* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
							txPath : '',
							/* 수정필요없음. */
							txService : 'sample',
							/* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
							txProject : 'sample',
							/* 대부분의 경우에 빈문자열 */
							initializedId : "",
							/* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
							wrapper : "tx_trex_container",
							/* 등록하기 위한 Form 이름 */
							form : "tx_editor_form",
							/*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
							txIconPath : "/resources/daumEditor/images/icon/editor/",
							/*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
							txDecoPath : "/resources/daumEditor/images/deco/contents/",
							canvas : {
								minHeight : 100,
								maxHeight : 500,
								autoSize : true,
								exitEditor : {
									/*
									desc:'빠져 나오시려면 shift+b를 누르세요.',
									hotKey: {
									    shiftKey:true,
									    keyCode:66
									},
									nextElement: document.getElementsByTagName('button')[0]
									*/
								},
								styles : {
									color : "#123456", /* 기본 글자색 */
									fontFamily : "굴림", /* 기본 글자체 */
									fontSize : "10pt", /* 기본 글자크기 */
									backgroundColor : "#fff", /*기본 배경색 */
									lineHeight : "1.5", /*기본 줄간격 */
									padding : "8px" /* 위지윅 영역의 여백 */
								},
								showGuideArea : false
							},
							events : {
								preventUnload : false
							},
							sidebar : {
								attachbox : {
									show : true,
									confirmForDeleteAll : true
								},
								attacher : {
									file : {
										boxonly : true
									}
								}
							},
							size : {
								contentWidth : 850 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
							}
						};
						EditorJSLoader.ready(function(Editor) {
							//에디터내에 환경설정 적용하기
							editorObj = new Editor(config);
						});
		
					}
				}); //end Ajax
		
		
			});
		
			/**
			 * Editor.save()를 호출한 경우 데이터가 유효한지 검사하기 위해 부르는 콜백함수로
			 * 상황에 맞게 수정하여 사용한다.
			 * 모든 데이터가 유효할 경우에 true를 리턴한다.
			 * @function
			 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
			 * @returns {Boolean} 모든 데이터가 유효할 경우에 true
			 */
			function validForm(editor) {
				// Place your validation logic here
				var title = $("#bTitle").val(); // 제목	(빈 값 검사하기 위해)
				var value = $("#value").val(); // 상품가치 (정규표현식을 위해 가져옴)
		
				if (title.trim() == "" /* || content.trim() == "" */ ) { // trim() 앞,뒤 공백 제거
					alert("제목은 필수 입력사항입니다.");
					return false;
				}
		
				// sample : validate that content exists
				var validator = new Trex.Validator();
				var content = editor.getContent();
				if (!validator.exists(content)) {
					alert('내용을 입력하세요');
					return false;
				}
		
				var pattern = /^[0-9]*$/; // 정규표현식 숫자만
				if (value.trim() == "" || !pattern.test(value)) {
					alert("상품가치는 숫자만 입력 가능합니다.");
					return false;
				}
		
		
				return true;
			}
		
			/**
			* Editor.save()를 호출한 경우 validForm callback 이 수행된 이후
			* 실제 form submit을 위해 form 필드를 생성, 변경하기 위해 부르는 콜백함수로
			* 각자 상황에 맞게 적절히 응용하여 사용한다.
			* @function
			* @param {Object} editor - 에디터에서 넘겨주는 editor 객체
			* @returns {Boolean} 정상적인 경우에 true
			*/
			function setForm(editor) {
				var i,
					input;
				var form = editor.getForm();
				var content = editor.getContent();
		
				// 본문 내용을 필드를 생성하여 값을 할당하는 부분
				var textarea = document.createElement('textarea');
				textarea.name = 'bContent';
				textarea.style = '"display: none;"';
				textarea.value = content;
				form.createField(textarea);
		
				/* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
						 첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */
				var images = editor.getAttachments('image', true);
				for (i = 0; i < images.length; i++) {
					// existStage는 현재 본문에 존재하는지 여부
					if (images[i].existStage) {
						// data는 팝업에서 execAttach 등을 통해 넘긴 데이터
						//alert('attachment information - image[' + i + '] \r\n' + JSON.stringify(images[i].data));
						input = document.createElement('input');
						input.type = 'hidden';
						input.name = 'imgPath';
						input.value = images[i].data.imageurl; // 이미지 경로
						form.createField(input);
						input = document.createElement('input');
						input.type = 'hidden';
						input.name = 'imgOriginName';
						input.value = images[i].data.filename // 이미지 원본 이름
						form.createField(input);
						input = document.createElement('input');
						input.type = 'hidden';
						input.name = 'imgSize';
						input.value = images[i].data.filesize; // 이미지 크기
						form.createField(input);
					}
				}
		
				var files = editor.getAttachments('file', true);
				for (i = 0; i < files.length; i++) {
					input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'filePath';
					input.value = files[i].data.attachurl;
					form.createField(input);
					input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'fileOriginName';
					input.value = files[i].data.filename // 파일 원본 이름
					form.createField(input);
					input = document.createElement('input');
					input.type = 'hidden';
					input.name = 'fileSize';
					input.value = files[i].data.filesize; // 파일 크기
					form.createField(input);
				}
				return true;
			}
			; //end setForm
		
		
			//게시글 저장
			function insertBoard() {
				if (confirm("등록 하시겠습니까?")) {
		
					if (!validForm(Editor)) return false; //유효성 검사
		
					setForm(Editor);
		
					var param = $("#tx_editor_form").serialize();
		
					console.log(param);
		
					$.ajax({
						url : "/board/category/writeBoardProc",
						method : "post",
						data : param,
						success : function(data) {
							if (data.result == "ok") {
								alert("작성이 완료되었습니다.");
							} else {
								alert("글저장 실패");
								return false;
							}
		
							location.href = "/board/category/detailContent?bno=" + data.bNo + "&pageNo=1";
		
						}
					});
		
					return false;
				}
		
			}
			;
		
			/* $("#insertForm").submit(function(event){
				event.preventDefault ? event.preventDefault() : (event.returnValue = false);
				console.log("insertForm");
				var that = $(this);	//insertForm
				var title = $("#bTitle").val();		// 제목	(빈 값 검사하기 위해)
				var content = $("#bContent").val();	// 내용
				var value = $("#value").val();		// 상품가치 (정규표현식을 위해 가져옴)
				
				if(title.trim() == "" || content.trim() == ""){		// trim() 앞,뒤 공백 제거
					alert("제목과 내용은 필수 입력사항입니다.");
					return;
				}
				
				var pattern = /^[0-9]*$/;	// 정규표현식 숫자만
				if(value.trim() == "" || !pattern.test(value)){
					alert("상품가치는 숫자만 입력 가능합니다.");
					return;
				}
				var str = "";
				
				//fileDrop 클래스의 samll 태그 각각의 값을 가져와서 str에 input hidden 속성으로 붙임 value = file fullName
				$(".fileDrop small").each(function(index){
					str += "<input type='hidden' name='files' value='" + $(this).attr("data-src") +"'>";
				});
				that.append(str);
				that.action="/board/category/writeBoardProc";
				that.method="post";
				alert("게시글 작성이 완료되었습니다.");
				that.get(0).submit();	// get(0) : 순수 DOM 객체를 얻어냄
				
			});
			
			$(".fileDrop").on("dragenter dragover", function(event){
				//event.preventDefault();	//기본 동작 막음 => 파일 끌어다 놓아도 아무 동작 하지않음
				event.preventDefault ? event.preventDefault() : (event.returnValue = false);	//브라우저에서 지원을 막은 경우
						
			});
					
			$(".fileDrop").on("drop", function(event){
				event.preventDefault ? event.preventDefault() : (event.returnValue = false);
						
				var files = event.originalEvent.dataTransfer.files;	// DOM 이벤트를 가져와서 전달된 파일 데이터를 가져옴
				var file = files[0];
				if(!checkImageType(file.name)){
					alert("이미지 파일(jpg/png/gif)만 업로드 가능합니다.");
					return;
				}
				
				var formData = new FormData();
				formData.append("file", file);	//<form> 태그와 동일한 전송받식으로 파일 데이터 전송 (file 객체 생성)
				
						
				$.ajax({
					url: '/board/uploadAjax',
					data: formData,
					dataType: 'text',
					processData:false,	// query string을 변환하지 않음
					contentType: false,	// multipart/form-data 방식으로 전송하기 위해 false로 지정
					type: 'POST',
					success: function(data){
						
						var str="";
						
						if(checkImageType(data)){
							str = "<span>" +
								"<a href='/board/displayFile?fileName=" + getImageLink(data) + "' target='_blank'>" +
								"<img src='/board/displayFile?fileName=" + data + "' border='1px'/></a>" + 
								"<small data-src=" + data + ">X</small></span>&nbsp;";
						}
						
						//$(".uploadedList").append(str);
						$(".fileDrop").append(str);
					}
				});
				
			});
			
			$(".fileDrop").on("click", "small", function(event){
				var that = $(this);		//this = small태그
				console.log("small");
				console.log(that.attr("data-src"));
				$.ajax({
					url:"/board/deleteFile",
					type:"post",
					data: {
						fileName : that.attr("data-src")
					},
					dataType:"text",
					success:function(data){
						console.log(data);
						if(data == "deleted"){
							that.parent("span").remove();
						}
					}
				});
			}); */
		</script>
		<script>
			$(document).ready(function() {
				$("#portfolio").attr("class", "active");
			})
		</script>
	</div>

</body>
</html>