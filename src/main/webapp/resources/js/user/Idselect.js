/**
 * @JavaScript : 아이디 js
 * @author 김용래
 * @Desc 아이디 찾기 
 * */


$(function(){
	// 회원가입 버튼 클릭 이벤트
	
	$('#cancelBtn').click(function(){
		location.replace("/");
		});
	
	
	$('#select').click(function() {
		 var userName=$('#userName').val();
		 var userHp=$('#userHp').val();
		 
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

		//회원수정 업데이트
		$.ajax({
			type : 'POST',  
			url : '/user/selectId',  
			data: {
			  userName:userName,
			  userHp:userHp
			},
			dataType : 'json',
			success : function(data) {
				if(data.result == "ok"){
					location.replace("/");
					alert(data.resultMsg);  
					return;
				}else{
					location.replace("/");  
					alert(data.resultMsg);  
					return;
				}
				
			},

			error : function(xhr, status, e) {  
				alert(e);
			}
		}); //end ajax
		

	});//end button
	
	

});//end function

