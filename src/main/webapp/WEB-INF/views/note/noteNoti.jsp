<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	
	$(function(){
 		notifyMe();
 	});
	
	//title : 알림창 제목 , options : 알림창에 들어갈 내용 (객체형태로 전달)
	var notification = new Notification(title, options);
	
	function notifyMe() {
		
		var parameter_noti = {
				title : " 쪽지가 도착했습니다^0^ ",
				icon : "https://image-proxy.namuwikiusercontent.com/r/https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fen%2F7%2F7e%2FPatrick_Star.png",
				body: " 확인해보세요!(수줍수줍) "
		};
		
		//브라우저가 Notification 기능을 지원하는지 체크
		if (!"Notification" in window) {
			alert("이 브라우저는 noti를 제공하지 않아요!");
		}
		//사용자가 Notification 사용을 허락했는지 체크
		else if (Notification.permission === "granted") {
			//허락했다면 Notification을 생성
			var notification = new Notification(parameter_noti.title,{
				icon : parameter_noti.icon,
				body : parameter_noti.body
			});
		}
		//크롬 브라우저는 permission 속성이 구현되어 있지 않기 때문에
		//사용자가 의도적으로 'denied' 한 경우만 체크
		else if (Notification.permission !== 'denied') {
			Notification.requestPermission(function (permission) {
				//사용자가 사용 여부를 체크했다면, 크롬 Notification 상태를 갱신
				if(!('permission' in Notification)) {
					Notification.permission = permission;
				}
				//사용자가 승낙했다면, Notifiation을 생성
				if (permission === "granted") {
					var notification = new Notification(parameter_noti.title,{
						icon : parameter_noti.icon,
						body : parameter_noti.body
					});
				}
			});
		}
	}//notifyMe
	</script>
</head>
<body>

</body>
</html>