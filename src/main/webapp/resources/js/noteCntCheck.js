$(document).ready(function(){
	if( "${loginSession.userId}" != null && "${loginSession.userId}" != 'undefined' && "${loginSession.userId}" != "" ){
		poll();
	}// if
	
	
	 function poll(){
 		 $.ajax({
             url : "/note/alarmNote",
             type : "POST",
             dateType : "json",
             success : function(value){
                $("#noteBadge").html(value);
                poll();
             },
             error : function(){
             },
          });
 	   };// poll()
});

