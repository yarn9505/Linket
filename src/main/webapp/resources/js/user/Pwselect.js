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
		 var userName=$('#userName').val();
		 var userId=$('#userId').val()
		 
		 
	     if (userId == "") {
	         alert("아이디를 입력하세요.");
	         return false;
	     }
		 
		 
		if(userName== "") {
			alert("이름을 입력해주세요.");
			userName.focus();
			return false;
		}


		//패스워드 찾기
		$.ajax({
			type : 'POST',  
			url : '/user/selectPw',  
			data: {
				"Id":userId,
			  "Name":userName
			},
			
			dataType : 'json',
			success : function(data) {
				if(data.result == "ok"){
					location.replace('/user/pwmodify?userId='+userId);
					alert(data.resultMsg);  
					return;
				}else{
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