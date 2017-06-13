/**
 * @JavaScript : join
 * @author Areum
 * @Desc 회원가입 유효성 체크
 */



/**
 * @JavaScript : 카테고리 버튼 값 변화
 * @author 김용래
 */
$(document).ready(function(){
	
	$('#cancelBtn').click(function(){
		location.replace("/");
		});
	
    $("#cateId1").change(function(){
        if($("#cateId1").is(":checked")){
        	$("#cateId1").val("y");
        }else{
        	$("#cateId1").val("n");
        }
    });
    
    $("#cateId2").change(function(){
        if($("#cateId2").is(":checked")){
        	$("#cateId2").val("y");
        }else{
        	$("#cateId2").val("n");
        }
    });
    
    $("#cateId3").change(function(){
        if($("#cateId3").is(":checked")){
        	$("#cateId3").val("y");
        }else{
        	$("#cateId3").val("n");
        }
    });
    
    $("#cateId4").change(function(){
        if($("#cateId4").is(":checked")){
        	$("#cateId4").val("y");
        }else{
        	$("#cateId4").val("n");
        }
    });
    
    $("#cateId5").change(function(){
        if($("#cateId5").is(":checked")){
        	$("#cateId5").val("y");
        }else{
        	$("#cateId5").val("n");
        }
    });
    
    $("#cateId6").change(function(){
        if($("#cateId6").is(":checked")){
        	$("#cateId6").val("y");
        }else{
        	$("#cateId6").val("n");
        }
    });
    
});



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
	 * @JavaScript : ajax를 통한 회원가입
	 * @author 김용래
	 * 
	 */
	
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
		
		//회원가입
		$.ajax({
			type : 'POST',  
			url : '/user/join',  
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
			  "idCheckboolean":idCheckboolean
			},
			dataType : 'json',
			success : function(data) {
				if(data.result == "ok"){
					location.replace("/");
					alert(data.resultMsg);  
					return;
				}else{
//					location.replace("/user/subscribeJoin?"+uniqId); 로그인 실패시 정보만 뜨게하고 안넘어가게함 
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
 * @JavaScript : join
 * @author Areum
 * @Desc 아이디 중복체크
 */
function idCheck(){

	var userId = $('#userId').val();
	
	if($("#userId").val() == ''){
		alert('아이디를 입력해주세요.'); 
		return;
	}

	$.ajax({
		type :'GET',  
		url :'/user/idCheck',  
		data: {
			userId : userId,
		},
		dataType : 'json',
		success : function(data) {
			if(data.result == "ok"){
				$("#idchk-error").html("<div style='color:blue'>사용가능한 아이디입니다.</div>");
				$("#idCheckboolean").val('y')
				return;
			}else{
				$("#idchk-error").html("<div style='color:red'>이미 사용중인 아이디입니다.</div>");
				$("#idCheckboolean").val('n')
				return;
			}
		},

		error : function(xhr, status, e) {  
			alert(e);
		}
	});  
}


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




/**
 * @JavaScript : join
 * @author Areum
 * @Desc 다음 api 를 통해 주소 입력
 */

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