/**
 * @JavaScript : 패스워드 js
 * @author 김용래
 * @Desc 패스워드 찾기 
 * 
 * */

$(function(){
	
	$('#cancelBtn').click(function(){
		location.replace("/");
	});
	
	
	$('#select').click(function() {
		
		 var userId=$("#userId").val();
		 var pw=$('#pw').val() ;
		 var pw2=$('#pw2').val();
		 
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
		
		//패스워드 업데이트
		$.ajax({
			type : 'POST',  
			url : '/user/PwUpdate',  
			data: {
				"Id":userId,
				"Pw":pw
			},
			
			dataType : 'json',
			success : function(data) {
				if(data.result == "ok"){
					location.replace('/');
					alert(data.resultMsg);  
					return;
				}else{
					location.replace("/");
					alert(data.resultMsg);  
					return;
				}
				
			},//success

			error : function(xhr, status, e) {  
				alert(e);
			}//error
			
		}); //end ajax
		
		
	});//end button
	
	

});//end function