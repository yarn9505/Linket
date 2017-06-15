<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!-- <link rel="stylesheet" href="/resources/css/custom.min.css">
<link rel="stylesheet" href="/resources/fonts/glyphicons-halflings-regular.ttf">
<link rel="stylesheet" href="/resources/css/bootstrap.css" media="screen">
<script type="text/javascript" src="/resources/js/json2.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<link rel="stylesheet" href="/resources/css/custom.min.css">
<link rel="stylesheet" href="/resources/fonts/glyphicons-halflings-regular.ttf">
<script type="text/javascript" src="/resources/js/json2.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/daumEditor/css/editor.css">
<script src="/resources/daumEditor/js/editor_loader.js?environment=production" type="text/javascript" charset="utf-8"></script>

<link rel= "stylesheet" type="text/css" href="/resources/css/totalCSS.css">
<script src="/resources/js/login/login.js"></script>
<script src="/resources/js/join/join.js"></script>
<script type="text/javascript" src="/resources/js/fileupload.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/timelineJS.js?ver=3"></script>
<link rel="stylesheet" href="/resources/css/sidebarCSS.css" />
<link rel="stylesheet" href="/resources/css/bootstrap.css" media="screen">

<title><decorator:title default="Linket" /></title>
<link rel="shortcut icon" href="/resources/images/small_logo_ico.ico" /> 
<script>
/* 
       
///         alert("제 이름은 폴링! 방금 실행되쬬^0^*");
       $(function(){
           poll();
        });
       
       function poll(){
          setTimeout(function(){
             $.ajax({
                url : "/note/alarmNote",
                type : "POST",
                success : function(){
                   console.log(new Date());
                },
                dateType : "json",
                complete : poll,
                timeout : 3000
                
             })
          },5000);
       }
           
     }//if
    
     function poll(){ 
       $.ajax({ 
       url: "/note/listNotOpen", 
       success: function(){
       }, 
       dataType: "json", 
       complete: poll, 
       timeout: 10000
       }); 
    } 
     */
</script>

<script>

//    var sock = null;
//    $(document).ready(function(){
//        sock = new SockJS("/echo-ws");
//          sock.onopen=function(){
//          }
//          sock.onmessage=function(evt){
//                console.log("안들어오나?");
//                notifyMe(evt.data);
//             /* if(${loginSession.userId eq sessionScope.NotiRecvId}){
//             } */
//          }
//          sock.onclose = function(){
//          }      
         
//    });
   
//    var notification = new Notification(title, options);
   
//    function notifyMe(data) {
//       console.log("노티함수 : " + data);
//       Notification.requestPermission(function (permission) {
//          Notification.requestPermission(function (result) {

//                 //요청을 거절하면,
//                 if (result === 'denied') {
//                     return;
//                 }
//                 //요청을 허용하면,
//                 else {
//                     return;
//                 }
//             });
//       var parameter_noti = {
//             icon : "https://image-proxy.namuwikiusercontent.com/r/https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fen%2F7%2F7e%2FPatrick_Star.png",
//             body: data
//       };
      
//       //브라우저가 Notification 기능을 지원하는지 체크
//       if (!"Notification" in window) {
//          alert("이 브라우저는 noti를 제공하지 않아요!");
//       }
//       //사용자가 Notification 사용을 허락했는지 체크
//       else if (Notification.permission === "granted") {
//          console.log("사용자가 승낙한 경우");
//          //허락했다면 Notification을 생성
//          var notification = new Notification(parameter_noti.title,{
//             icon : parameter_noti.icon,
//             body : parameter_noti.body
//          });
//       }
//       //크롬 브라우저는 permission 속성이 구현되어 있지 않기 때문에
//       //사용자가 의도적으로 'denied' 한 경우만 체크
//       else if (Notification.permission !== 'denied') {
//          console.log("사용자가 노티 사용 거부한 경우");
        
//             //사용자가 사용 여부를 체크했다면, 크롬 Notification 상태를 갱신
//             if(!('permission' in Notification)) {
               
//                Notification.permission = permission;
//             }
//             //사용자가 승낙했다면, Notifiation을 생성
//             if (permission === "granted") {
//                console.log("사용자가 노티 승낙했을 경우 들어오는 부분");
//                var notification = new Notification(parameter_noti.title,{
//                   icon : parameter_noti.icon,
//                   body : parameter_noti.body
//                });
//             }
//          });
//       }
//    }//notifyMe
    
</script>
<style type="text/css">

.msg_a {
      position: relative; 
       color:white;
       text-decoration: none;
       top:-10px;
       left:-25px;
}
.Badge{
   background-color: #CB1C05;
   border-radius:10px;
   font-weight: bold;
   padding:0 5px 0 5px;
}
.dropdownCus ul li a:hover{
	background: #ffffff !important;
}

.divider {
	background: #eeeeee !important;
}

</style>
<decorator:head />
</head>
<body>
   <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
         <div class="navbar-header">
            <div class="navbar-brand" style="line-height: 50px;"><img src="/resources/images/logo2.png" class="img-responsive"></div>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
               <span class="icon-bar"></span> 
               <span class="icon-bar"></span> 
               <span class="icon-bar"></span>
            </button>
         </div>
         
         <div class="navbar-collapse collapse" id="navbar-main">
			<ul class="nav navbar-nav">
				<li><a id="team" href="/timeline">TimeLine</a></li>
				<li class="dropdown dropdownCus"><a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Category 
				<span class="caret"></span></a>
				<ul class="dropdown-menu jungyo_menu" aria-labelledby="themes">
					<li><a href="/board/category/boardList?cateId=1&pageNo=1">도서/음반</a></li>
					<li class="divider"></li>
					<li><a href="/board/category/boardList?cateId=2&pageNo=1">뷰티/패션/잡화</a></li>
					<li class="divider"></li>
					<li><a href="/board/category/boardList?cateId=3&pageNo=1">애완동물용품</a></li>
					<li class="divider"></li>
					<li><a href="/board/category/boardList?cateId=4&pageNo=1">인테리어/생활용품</a></li>
					<li class="divider"></li>
					<li><a href="/board/category/boardList?cateId=5&pageNo=1">유아/취미/완구</a></li>
					<li class="divider"></li>
					<li><a href="/board/category/boardList?cateId=6&pageNo=1">지역 할인 쿠폰</a></li>
				</ul></li>
				<li><a href="#">Power Dealer</a></li>
               <li><a id="talktous" href="/noticeBoardSection?cateId=0&pageNo=1">Notice</a></li>
               <li><a id="about" href="/aboutUsSection">About Us</a></li>
               
               <form class="navbar-form navbar-left" role="search">
                  <div class="form-group">
                     <input type="text" class="form-control" placeholder="Search">
                  </div>
                  <button type="submit" class="btn btn-default">검색</button>
               </form>
            </ul>
            
            
            
            <ul class="nav navbar-nav navbar-right" style="line-height: 50px;">
            	<c:if test="${loginSession.userId != null}">
                	<li id="userIcon">
                 		<span style="font-weight: bold;">
                     		<a class="mypage" href="/mypage/myList">${loginSession.userId}</a>
                  		</span>
                  		<img class="msg_img" src="/resources/images/message.png" />
            		</li> 
                  	<li id="noteIcon">
                  		<a class="msg_a" href="/note/listReceive">
                     	<!-- 읽지 않은 쪽지 -->
                     	<span id="noteBadge" class="Badge" style="margin-right: -25px;">${sessionScope.notOpen}  </span>
                  		</a>
                  	</li>
                  	<li id="sectionBar">
                  		┃ &nbsp;
                  	</li>
                  	<li>
                  		<a class="logout" href="/user/Logout" style="font-weight: bold;">로그아웃</a>
                  	</li>
					</c:if>
               
               <c:if test="${loginSession.userId == null}">
                  <li><a href="/user/login">로그인</a>
                  <li><a href="/user/subscribeJoin" >회원가입</a></li>
               </c:if>
            </ul>     
         </div>
      </div>
   </div>
   
   <div style="margin-top: 5%;">
      <decorator:body></decorator:body>
   </div>
</body>
</html>