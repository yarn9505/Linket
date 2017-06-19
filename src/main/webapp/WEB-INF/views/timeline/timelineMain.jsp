<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript" src="/resources/js/timelineJS.js?ver=3"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- handlebars 추가 -->
<script type="text/javascript" src="/resources/js/handlebars-v4.0.10.js"></script>
<link rel="stylesheet" href="/resources/css/sidebarCSS.css" />

<script>
 
    var sock = null;
    $(document).ready(function(){
        sock = new SockJS("/echo-ws");
          sock.onopen=function(){
          }
          sock.onmessage=function(evt){
                alert("테스트 소켓 : " + evt.data);
                console.log("안들어오나?" + evt.data);
               // notifyMe(evt.data); // notification
//               if(${loginSession.userId eq sessionScope.NotiRecvId}){
//              } 
          }
          sock.onclose = function(){
          }      
       
    });
     
   
</script>
<style>
.msg_a {
   position: relative;
   top: -10px;
   left: -25px;
   text-decoration: none;
}

#timeline   {
    width:100%;
    margin: 0 auto; 
}
#timeline .item {
    width: 60%;
    margin: 10px;
    float: left;
    margin-left:30px;
    margin-top:10px;
    background-color:#ffffff;
    border:solid 1px #B4BBCD;
    min-height:50px;
    text-align:justify;
    word-wrap:break-word; 
}
#timeline .item  .cont_pic{
    /* margin:10px; */
    padding: 10px;
    position: relative;
}
#timeline .item  .cont_pic .like_pic {
    position: absolute;
    right: 0;
    margin: 0 20px;
    border: 1px solid #000;
    /* background: #1c1c1c; */
    border-radius: 5px;
    cursor:pointer;
    width: 35px;
    height: 35px;
    text-align: center;
    color: #FFF;
    font-size: 23px;
    font-weight: 100;
    line-height: 36px;
    opacity: 0.4;
    transition: all 0.3s;
}
#timeline .item  .cont_pic .like_pic:hover {
    opacity: 0.8;
}
#timeline .item .info{
    color: #111;
    z-index: 10;
    position: relative;
    padding: 10px;
    overflow: hidden;
}
#timeline .item .info .up_cont{
    border-bottom: 1px dotted #ccc;
}
#timeline .item .info .up_cont h3{
    font-size: 24px;
}
#timeline .item .info .down_cont .left_icons .view{
    display: inline-block;
    float: left;
    padding-left: 24px;
    margin-top: 6px;
    margin-right: 10px;
}

#timeline .item .info .down_cont .left_icons .like{
    display: inline-block;
    float: left;
    padding-left: 24px;
    margin-top: 6px;
    margin-right: 10px;
}
#timeline .item .info .down_cont .left_icons .comment{
    display: inline-block;
    float: left;
    padding-left: 24px;
    margin-top: 6px;
    margin-right: 10px;
}
#timeline .item .info .down_cont .timeago{
    float: right;
    margin-top: 6px;
}

.rightCorner { 
    background-image: url("http://ciftslash.com/upload/MQ/timeline_sol.png");
    display: block;
    height: 15px;
    margin-left: 380px;
    margin-top: 8px;
    padding: 0;
    vertical-align: top;
    width: 13px;
    z-index:2;
    position: absolute;
}
.leftCorner{
    background-image: url("http://ciftslash.com/upload/MQ/timeline_sag.png");
    display: block;
    height: 15px;
    width: 13px;
    margin-left: -13px;
    margin-top: 8px;
    position: absolute;
    z-index:2;
}
.timeline_container{
    width: 16px;
    text-align: center;
    margin: 0 auto;
    display: block;
}
.timeline{
    display: block;
    height: 100%;
}
</style>

</head>
<body>
   <div class="container">
      <div class="row">
         <div class="col-md-10 col-md-offset-1">

            <fieldset class="scheduler-border">
               <legend class="scheduler-border">
                  <h4>
                     <span class="glyphicon glyphicon-check">&nbsp;검색조건&nbsp;</span>
                  </h4>
               </legend>
               <div class="control-group">
                  <div class="controls bootstrap-timepicker">
                     <div class="form-group" style="margin: 2%;">
                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true">
                           <label class="control-label">관심분야 </label>
                        </span> <br> <br> <span class="input-group"> <label
                           class="checkbox-inline"> <input type="checkbox"
                              name="checkbox" id="cateId1">도서/음반
                        </label> <label class="checkbox-inline"> <input type="checkbox"
                              name="checkbox" id="cateId2">뷰티/패션/잡화
                        </label> <label class="checkbox-inline"> <input type="checkbox"
                              name="checkbox" id="cateId3">애완동물용품
                        </label> <label class="checkbox-inline"> <input type="checkbox"
                              name="checkbox" id="cateId4">인테리어/생활용품
                        </label> <label class="checkbox-inline"> <input type="checkbox"
                              name="checkbox" id="cateId5">유아/취미/완구
                        </label> <label class="checkbox-inline"> <input type="checkbox"
                              name="checkbox" id="cateId6">지역할인쿠폰
                        </label>
                        </span>
                     </div>

                     <div class="form-group" style="margin: 2%;">
                        <span class="glyphicon glyphicon-hand-right" aria-hidden="true">
                           <label class="control-label">상품가치 </label>
                        </span> <br> <br>

                        <table>
                           <tr>
                              <td><input type="text" style="width: 80%;" id="fvalue1"
                                 class="form-control"></td>
                              <td width="10%;">~</td>
                              <td><input type="text" style="width: 80%;" id="fvalue2"
                                 class="form-control"></td>
                              <td width="20%;">
                                 <button type="button" id="filterBtn"
                                    class="btn btn-sm btn-default">찾기</button>
                              </td>
                           </tr>
                        </table>

                     </div>
                  </div>
               </div>

            </fieldset>


            <div
               style="position: fixed; left: 0px; bottom: 20px; font-size: 20px; margin: 3%;">
               <a href="#above"><span class="glyphicon glyphicon-chevron-up"
                  aria-hidden="true"></span>&nbsp;top</a>
            </div>


            <!-- 사이드바 추가 -->

            <!--  -->
            <a name="above"></a>

               <ul id="showTimeline" class="timeline">
                  <script id="entry-template2" type="text/x-handlebars-template"> 
                     <div id="timeline">    
                         <!-- item -->
                         <div class="item " style="padding-left:15px;"> 
                             <div class="cont_pic" >
                              <img class="cont_img" src="{{imgPath}}" width="100%" height="180px"/> 
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
               <!--     <p><ul id="showTimeline"></ul></p>  -->
         


<!--          <div class="col-sm-offset-10 col-sm-4"> -->
<!--             <div class="app"> -->
<!--                <section class="main"> <article class="item"> -->
<!--                <p>혜연바보</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic1.png"></a> <a href="index.html">@한혜연</a> -->
<!--                <time datetime="2012-04-05T10:30:21+00:00" pubdate>4 minutes -->
<!--                ago</time> </footer> </article> <article class="item"> -->
<!--                <p>주희는 진짜로 천재같다..</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic3.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:26:27+00:00" pubdate>8 minutes -->
<!--                ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Anim pariatur cliche reprehenderit, enim eiusmod high life -->
<!--                   accusamus terry richardson ad squid.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic2.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:15:45+00:00" pubdate>15 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> <article class="item"> -->
<!--                <p>Praesent arcu in mauris bibendum id ornare tortor -->
<!--                   scelerisque.</p> -->
<!--                <footer> <a href="index.html" class="avatar"><img -->
<!--                   src="resources/images/pic4.png"></a> <a href="index.html">@someone</a> -->
<!--                <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 -->
<!--                minutes ago</time> </footer> </article> </section> -->
<!--             </div> -->

         </div> 
         </div>
      </div>
   </div>
</body>
</html>