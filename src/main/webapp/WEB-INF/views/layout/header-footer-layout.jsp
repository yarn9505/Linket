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

<link rel="stylesheet" href="/resources/css/custom.min.css">
<link rel="stylesheet" href="/resources/css/matching.css">
<link rel="stylesheet" href="/resources/fonts/glyphicons-halflings-regular.ttf">
<script type="text/javascript" src="/resources/js/json2.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/daumEditor/css/editor.css">
<script src="/resources/daumEditor/js/editor_loader.js?environment=production" type="text/javascript" charset="utf-8"></script>

<link rel= "stylesheet" type="text/css" href="/resources/css/totalCSS.css">
<script src="/resources/js/aside.js"></script>


<script type="text/javascript" src="/resources/js/fileupload.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/sidebarCSS.css" />
<link rel="stylesheet" href="/resources/css/bootstrap.css" media="screen">
<script type="text/javascript" src="/resources/js/matching/dashboard.js"></script>

<title><decorator:title default="Linket" /></title>
<link rel="shortcut icon" href="/resources/images/small_logo_ico.ico" /> 
<script>
	$(function(){
		if('${loginSession != null}'){
 		   poll();
 	   }//if
 	   
 	  function poll(){
 		 $.ajax({
             url : "/note/alarmNote",
             type : "POST",
             dateType : "json",
             success : function(value){
                console.log("변화감지");
                console.log("totalCnt : "+value);
                $("#noteBadge").html(value);
                poll();
             },
             error : function(){
                console.log("변화감지실패");
             },
          });
 	   }//poll()
	});//end of 함수
	
	
	
	
    
</script>
<style type="text/css">

.msg_a {
      position: relative; 
      text-decoration: none;
      top:-10px;
      left:-25px;
}
.Badge{
   background-color: #CB1C05;
   border-radius:10px;
   font-weight: bold;
   padding:0 5px 0 5px;
   color:white;
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
					<li><a href="/board/category/boardList?cateId=3&pageNo=1">음식/음료</a></li>
					<li class="divider"></li>
					<li><a href="/board/category/boardList?cateId=4&pageNo=1">인테리어/생활용품</a></li>
					<li class="divider"></li>
					<li><a href="/board/category/boardList?cateId=5&pageNo=1">유아/취미/완구</a></li>
					<li class="divider"></li>
					<li><a href="/board/category/boardList?cateId=6&pageNo=1">지역 할인 쿠폰</a></li>
				</ul></li>
				<li><a href="/matching/matchingMain">Smart Matching</a></li>
				<li><a href="/bestUser/bestUserSection">Power Dealer</a></li>
               <li><a id="talktous" href="/noticeBoardSection?cateId=0&pageNo=1">Notice</a></li>
               
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
                     		<a class="mypage" href="/mypage/myList">${loginSession.userId}</a> &nbsp;
                  		</span>
                  		<img class="msg_img" src="/resources/images/message.png" />
            		</li> 
                  	<li class="bedgeSt" style="width: 10%;">
                  		<a class="msg_a" href="/note/listReceive">
                     	<!-- 읽지 않은 쪽지 -->
                     	<span id="noteBadge" class="Badge">${sessionScope.notOpen}</span>
                  		</a>
                  	</li>
                  	<li id="sectionBar">
                  		┃ 
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