var notification = new Notification(title, options);

function notifyMe() {
	
	var parameter_noti = {
			title : " 쪽지가 도착했습니다^0^ ",
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
					body : parameter_noti.body
				});
			}
		});
	}
}//notifyMe