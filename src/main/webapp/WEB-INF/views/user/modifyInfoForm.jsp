<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<style>
input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	margin-right: 15px;
	font-size: 13px;
}

input[type=checkbox]+label:before {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	bottom: 1px;
	background-color: #ccc;
	border-radius: 2px;
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

input[type=checkbox]:checked+label:before {
	content: "\2713"; /* 체크모양 */
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 18px;
	font-weight: 800;
	color: #fff;
	background: #2f87c1;
	text-align: center;
	line-height: 18px;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="page-header">
					<h3>
						<span class="glyphicon glyphicon-user" style="color: #0E3E59;"> &nbsp;회원정보수정</span>
					</h3>
				</div>
	
				<form role="form" id="form1">
					<div class="form-group">
						<label class="control-label">아이디</label>
						<input readonly="readonly" type="text" class="form-control"
								id="userId" name="userId" placeholder="아이디를 입력해주세요" value="${loginSession.userId}" /> 
						<div id="idchk-error"></div>
					</div>



					<div class="form-group">
						<label class="control-label">변경할 비밀번호 </label> 
						<input type="password" class="form-control" id="pw" name="userPw" placeholder="영문,숫자 조합해 6~15자이내 입력해주세요">
						<div id="pw-error"></div>
					</div>


					<div class="form-group">
						<label class="control-label">변경할 비밀번호 확인 </label> 
						<input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인">
						<div id="pw2-error"></div>
					</div>


					<div class="form-group">
						<label class="control-label">이름</label> 
						<input value="${loginSession.userName }" readonly="readonly" name="userName" type="text" class="form-control" id="userName"placeholder="이름을 입력해 주세요" />
						<div id="name-error"></div>
					</div>


					<div class="form-group">
						<label class="control-label">휴대폰 번호 </label> 
						<input value="${loginSession.userHp}" type="text" class="form-control"
							id="userHp" name="userHp" placeholder="-를 제외하고 숫자만 입력하세요">
						<div id="hp-error"></div>
					</div>


					<div class="form-group">
						<label class="control-label">이메일 </label> 
						<input type="email" class="form-control" id="userEmail" name="userEmail"
							placeholder="이메일을 입력해주세요" value="${loginSession.userEmail}">
						<div id="email-error"></div>
					</div>



					<div class="form-group">
						<label class="control-label">우편번호 </label>
						<div class="input-group">
							<input type="text" id="sample6_postcode" class="form-control" readonly> 
							<span class="input-group-btn"> 
								<input id="daumSearchId" type="button" class="btn btn-primary" value="우편번호 검색" />
							</span>
						</div>
					</div>


					<div class="form-group">
						<label class="control-label">상세주소 </label> 
						<input value="${loginSession.addr1}" type="text" id="addr1" name="addr1" class="d_form large form-control" readonly> 
						<input value="${loginSession.addr2}" type="text" id="addr2" name="addr2" class="form-control" placeholder="상세주소를 입력하세요."> 
						<input value="${loginSession.lat}" type="hidden" id="latId" name="lat" />
						<input value="${loginSession.lon}" type="hidden" id="lonId" name="lon" />
					</div>

					<div class="form-group">
						<label class="control-label">관심분야 </label> <br/>
						<div class="input-group">
							<label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId1" ${loginSession.cateId1 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId1 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId1">유아/취미/완구</label>
							</label> <label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId2" ${loginSession.cateId2 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId2 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId2">뷰티/패션/잡화</label>
							</label> 
							
							<label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId3" ${loginSession.cateId3 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId3 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId3">음식/음료</label>

							</label> <br /> <br /> 
							
							<label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId4" ${loginSession.cateId4 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId4 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId4">홈인테리어/생활용품</label>
							</label> 
							
							<label class="checkbox-inline"> <input type="checkbox" name="checkbox" id="cateId5"
								${loginSession.cateId5 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId5 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId5">도서/음반</label>
							</label> 
							
							<label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId6" ${loginSession.cateId6 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId6 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId6">지역 할인 쿠폰</label>

							</label> 
							<input type="hidden" name="uniqId" value="${loginSession.uniqId}" id="uniqId">
						</div>
					</div>

					<br /> <br />
					<div class="form-group text-center">
						<button id="cancelBtn1" type="button" class="btn btn-default" onclick="location.href='/mypage/myList'">취소</button>
						&nbsp;&nbsp;
						<button id="joinbtn" type="button" class="btn btn-primary">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			// 수정버튼 클릭시 welcome 페이지로 분기
			$('#cancelBtnModi').click(function(){
				location.replace("/mypage/myList");
				});
		    $("#cateId1").change(function(){
		        if($("#cateId1").is(":checked")){
		        	$("#cateId1").val("Y");
		        }else{
		        	$("#cateId1").val("N");
		        }
		    });
		    
		    $("#cateId2").change(function(){
		        if($("#cateId2").is(":checked")){
		        	$("#cateId2").val("Y");
		        }else{
		        	$("#cateId2").val("N");
		        }
		    });
		    
		    $("#cateId3").change(function(){
		        if($("#cateId3").is(":checked")){
		        	$("#cateId3").val("Y");
		        }else{
		        	$("#cateId3").val("N");
		        }
		    });
		    
		    $("#cateId4").change(function(){
		        if($("#cateId4").is(":checked")){
		        	$("#cateId4").val("Y");
		        }else{
		        	$("#cateId4").val("N");
		        }
		    });
		    
		    $("#cateId5").change(function(){
		        if($("#cateId5").is(":checked")){
		        	$("#cateId5").val("Y");
		        }else{
		        	$("#cateId5").val("N");
		        }
		    });
		    
		    $("#cateId6").change(function(){
		        if($("#cateId6").is(":checked")){
		        	$("#cateId6").val("Y");
		        }else{
		        	$("#cateId6").val("N");
		        }
		    });
		    
		}); // end of ready()
		
		$(function(){

			var reg_pw = /^.*(?=.{6,15})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; //비밀번호 정규표현식(영숫자 조합 6~15)
			var reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //이메일 정규표현식
			var reg_hp = /^((010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/; //휴대폰번호 정규표현식(010일때4자리 나머지3,4자리)
			
			$('#pw').keyup(function(){
				if(reg_pw.test($("#pw").val())){
					$("#pw-error").html("<div style='color:blue'>비밀번호 통과</div>");
				} else if(!reg_pw.test($('#pas').val())){
					$("#pw-error").html("<div style='color:red'>비밀번호 형식을 맞춰주세요</div>");
				}  
			});   


			$('#pw2').keyup(function(){
				if($("#pw").val()==$("#pw2").val()){ 
					$("#pw2-error").html("<div style='color:blue'>비밀번호 확인 통과</div>");
				}else{
					$("#pw2-error").html("<div style='color:red'>비밀번호가 일치하지 않습니다</div>");
					return false;
				}
			});


			$('#userHp').focusout(function() {
				if (reg_hp.test($('#userHp').val())) {
					$("#hp-error").html("<div style='color:blue'>핸드폰번호 통과</div>");
				} else if (!reg_hp.test($('#userHp').val())) {
					$("#hp-error").html("<div style='color:red'>핸드폰번호 형식을 맞춰주세요</div>");
				}
			});


			$('#userEmail').keyup(function(){
				if(reg_email.test($('#userEmail').val())){
					$("#email-error").html("<div style='color:blue'>이메일 통과</div>");
				}else if(!reg_email.test($('#userEmail').val())){
					$("#email-error").html("<div style='color:red'>이메일을 올바르게 입력해주세요</div>");
				} 
			});
			

			/**
			 * @JavaScript : join
			 * @author Areum
			 * @Desc 다음 api 를 통해 주소 입력
			 */
			$("#daumSearchId").on("click",function(){
				sample6_execDaumPostcode();
			});
			function sample6_execDaumPostcode() {
				
				new daum.Postcode({
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수
						
						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;
							
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}
						
						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
										: data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
						}
						
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr1').value = fullAddr;
						
						// 풀 주소를 가져와 네이버 api를 이용해 위도,경도로 변환하는 메서드 호출
						jusoCallBack(fullAddr);
						
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
			}
			
			
			
			// 회원가입 버튼 클릭 이벤트
			$('#joinbtn').click(function() {
				
				 var userId=$("#userId").val();
				 var uniqId=$("#uniqId").val();
				 var cateId1=$("#cateId1").val();
				 var cateId2=$("#cateId2").val();
				 var cateId3=$("#cateId3").val();
				 var cateId4=$("#cateId4").val();
				 var cateId5=$("#cateId5").val();
				 var cateId6=$("#cateId5").val();
				 var idCheckboolean=$('#idCheckboolean').val()
				 var pw=$('#pw').val() ;
				 var pw2=$('#pw2').val();
				 var userName=$('#userName').val();
				 var userHp=$('#userHp').val();
				 var userEmail=$('#userEmail').val();
				 var addr1=$('#addr1').val();
				 var addr2=$('#addr2').val();
				 

				 
				if(pw == "") {
					alert("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}

				if(pw2 == "") {
					alert("비밀번호 확인을 입력해주세요.");
					pw2.focus();
					return false;
				}
				
				if(pw != pw2) {
					alert("패스워드가 일치하지 않습니다.");
					pw.focus();
					return false;
				}

				if(userName== "") {
					alert("이름을 입력해주세요.");
					userName.focus();
					return false;
				}

				if(userHp == "") {
					alert("핸드폰번호를 입력해주세요.");
					userHp.focus();
					return false;
				}

				if(userEmail == "") {
					alert("이메일 주소를 입력해주세요.");
					userEmail.focus();
					return false;
				}

				if(addr1 == "") {
					alert("상세주소를 확인해주세요");
					addr1.focus();
					return false;
				}

				if(addr2 == "") {
					alert("상세주소를 확인해주세요");
					addr2.focus();
					return false;
				}
				
				// 네이버 api 호출해 위도,경도로 fullAddr를 변환하여, hidden으로 값을 가지고 있게하고
				// 회원가입시 같이 넘어가게 한다.
				//jusoCallBack($("#addr1").val()); // 회원가입 직전에 넣어서 보냄
				
				var lat = ($("#latId").val() + "");
				var lon = ($("#lonId").val() + "");
				
				//회원수정 업데이트
				$.ajax({
					type : 'POST',  
					url : '/user/modifyInfoProcess',  
					data: {
					  lat:lat,
					  lon:lon,
					  userId:userId,
					  userPw:pw,
					  userName:userName,
					  userHp:userHp,
					  userEmail:userEmail,
					  addr1:addr1,
					  addr2:addr2,
					  cateId1:cateId1,
					  cateId2:cateId2,
					  cateId3:cateId3,
					  cateId4:cateId4,
					  cateId5:cateId5,
					  cateId6:cateId6,
					  uniqId:uniqId,
					},
					dataType : 'json',
					success : function(data) {
						if(data.result == "ok"){
							location.replace("/");
							alert(data.resultMsg);  
							return;
						}else{
//							location.replace("/user/subscribeJoin?"+uniqId); 로그인 실패시 정보만 뜨게하고 안넘어가게함 
							alert(data.resultMsg);  
							return;
						}
						
					},

					error : function(xhr, status, e) {  
						alert(e);
					}
				});  
				

			});

		});


		/**
		 * @JavaScript : 네이버 api : 주소 -> 위도,경도로 변환(다음주소 api에서 얻어온 fullAddress를 이용해서 변환)
		 * @author 황영롱
		 */
		function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
				roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn) {
			$.ajax({
				type : 'post',
				url : '/address/trans',
				data : {
					'address' : encodeURIComponent(roadFullAddr)
				}, //encodeURIComponent로 인코딩하여 넘깁니다.
				dataType : 'json',
				timeout : 10000,
				cache : false,
				error : function(x, e) {
					alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');
				},
				success : function(data) {
					console.log(data); //결과값이 JSON으로 파싱되어 넘어옵니다.
					var lng = data.result.items[0].point.x; //결과의 첫번째 값의 좌표를 가져옵니다. 상세주소 없이 검색된 경우에는 결과가
					var lat = data.result.items[0].point.y; //여러개로 넘어 올 수 있습니다. 
					console.log("경도 : " + lng + "type : " + typeof(lng+"")); // 경도
					console.log("위도 : " + lat + typeof(lat+"")); // 위도
					document.getElementById("latId").value = (lat+""); // hidden값으로 넣기
					document.getElementById("lonId").value = (lng+"");
				}
			});
		}; // end of jusoCallBack() */




		
	</script>
	
</body>
</html>