$(document).ready(function() {
	
   $("#login").click(function() {
	   
	    var useCookie= $("#useCookie").val();
	   
      if ($('#userId').val() == "") {
         alert("아이디를 입력하세요.");
         return false;
      }

      if ($('#userPw').val() == "") {
         alert("비밀번호를 입력하세요.");
         return false;
      }

      $.ajax({
         type : "post",
         url : "/user/loginProc",
         data : {
            userId : $("#userId").val(),
            userPw : $("#userPw").val(),
            useCookie:useCookie
         },
         dataType : "json",
         success : function(data) {
            console.log(data);

            if (data.result == "ok") {
               /*경로 변경해줘야 해 타임라인으로*/
               self.location="/timeline";
               return;
            } else {
               alert(data.resultMsg);
               return;
            }
         },
         error : function(xhr, status, error) {
            console.log(xhr);
            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
         }
      });

   });

});