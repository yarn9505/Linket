<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/resources/js/timelineJS.js"></script>
<script type="text/javascript" src="/resources/js/handlebars-v4.0.10.js"></script>
<link rel="stylesheet" href="/resources/css/timeline.css">

<script>
 
    var sock = null;
    $(document).ready(function(){
        sock = new SockJS("/echo-ws");
          sock.onopen=function(){
             sock.send("접속${loginSession.userId}");
             
          }
          sock.onmessage=function(evt){
               // alert(evt.data);
                notifyMe(evt.data);//Notification
          }
          sock.onclose = function(){
          }      
       
    });

    function notifyMe(data) {
         // Let's check if the browser supports notifications

         var options = {
                body: data,
                icon: "/resources/images/notiImg.jpg"
        }
         
         if (!("Notification" in window)) {
           alert("This browser does not support desktop notification");
         }

         
         // Let's check whether notification permissions have already been granted
         else if (Notification.permission === "granted") {
           // If it's okay let's create a notification
           var notification = new Notification("쪽지가 도착했습니다.",options);
         }

         // Otherwise, we need to ask the user for permission
         else if (Notification.permission !== 'denied') {
           Notification.requestPermission(function (permission) {
             // If the user accepts, let's create a notification
             if (permission === "granted") {
               var notification = new Notification(data);
             }
           });
         }

         // At last, if the user has denied notifications, and you 
         // want to be respectful there is no need to bother them any more.
       }
 
   
</script>
</head>
<body>
   <div class="container">
      <div class="row">
         <div class="col-md-10 col-md-offset-1">
            <h3>
               <span class="glyphicon glyphicon-tasks" style="color: #0E3E59;">&nbsp;TimeLine</span>
            </h3>
            <br /> <br />
            <div class="panel panel-primary">
               <div class="panel-heading">
                  <span class="glyphicon glyphicon-check">&nbsp;검색조건</span>
               </div>
               <div class="panel-body">
                  
               		<span class="glyphicon glyphicon-hand-right" aria-hidden="true">
               			 <font style="font-weight: bold;font-size: 13px;">&nbsp;관심분야</font>
               		</span>
                  	
                  	
                  	<br/><br /> 
                  	
                  	<span class="input-group"> <label
                     class="checkbox-inline"> <input type="checkbox"
                        name="checkbox" id="cateId1"> <label for="cateId1">도서/음반
                     </label>
                  </label> <label class="checkbox-inline"> <input type="checkbox"
                        name="checkbox" id="cateId2" /> <label for="cateId2">뷰티/패션/잡화
                     </label>
                  </label> <label class="checkbox-inline"> <input type="checkbox"
                        name="checkbox" id="cateId3"> <label for="cateId3">음식/음료
                     </label>
                  </label> <label class="checkbox-inline"> <input type="checkbox"
                        name="checkbox" id="cateId4"> <label for="cateId4">인테리어/생활용품
                     </label>
                  </label> <label class="checkbox-inline"> <input type="checkbox"
                        name="checkbox" id="cateId5"> <label for="cateId5">유아/취미/완구
                     </label>
                  </label> <label class="checkbox-inline"> <input type="checkbox"
                        name="checkbox" id="cateId6"> <label for="cateId6">지역할인쿠폰
                     </label>
                  </label>
                  </span> <br /> 
                  
                  
                  	
          		<span class="glyphicon glyphicon-hand-right" aria-hidden="true">
          			<font style="font-weight: bold;font-size: 13px;">&nbsp;상품가치</font>
          		</span>
                  	

                 <br /><br />
                  <table style="width: 100%;">
                     <tr>
                        <td style="width: 20%;"><input type="text" id="fvalue1" class="form-control"></td>
                        <td style="width: 10%; text-align: center;">~</td>
                        <td style="width: 20%;"><input type="text" id="fvalue2" class="form-control"></td>
                        <td style="float: right;"><button type="button" id="filterBtn" class="btn btn-sm btn-default">찾기</button></td>
                     </tr>
                  </table>
               </div>
            </div>


            <div style="position: fixed; left: 0px; bottom: 20px; font-size: 20px; margin: 3%;">
               <a href="#above"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true">
               </span>&nbsp;top</a>
            </div>


            <a name="above"></a>

            <ul id="showTimeline" class="timeline">
               <script id="entry-template2" type="text/x-handlebars-template"> 
                     <div id="timeline">    
                         <!-- item -->
                         <div class="item " style="padding-left:15px;"> 
                             <div class="cont_pic" >
                              <img class="cont_img" src="{{imgPath}}" width="100%" height="300px"/> 
                             </div> <!-- #cont_pic -->
                             <div class="info">
                                    <div class="up_cont">
                                     <h3 style="margin-top:5px;"><strong><a href="/board/category/detailContent?bno={{bno}}&pageNo=1" style="display:block;margin:0 auto; max-width:500px; min-width:200px;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">{{btitle}}</a></strong></h3>
                                  <h5><p><span class="glyphicon glyphicon-tags" style="color: #F29661;"/>&nbsp; {{cateName}}</p></h5>
                                  <h5><p><span class="glyphicon glyphicon-road" style="color: #9FC93C;"/>&nbsp; {{distanceVal distance}}</p></h5>
                                  <h5><p><span class="glyphicon glyphicon-usd" style="color: #FFBB00;"/>&nbsp; {{value}} 원</p></h5>
                                 </div> <!-- #up_cont -->
                                 <div class="down_cont">
                                    <span class="like_pic"><img class="likeImg" style="margin-top:5px;width:25px;height:25px;" id="likeImg{{bno}}" src={{check checkfavorite}} onclick="like({{bno}})"/></span>
                                     <time class="timeago">{{dateVal bregdate}}</time>
                                 </div> <!-- #down_cont -->
                             </div> <!-- #info -->
                         </div>
                     </div>
                           
                        </script>
            </ul>
         </div>
      </div>
   </div>
</body>
</html>