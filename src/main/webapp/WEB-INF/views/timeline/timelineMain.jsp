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

* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -ms-box-sizing: border-box;
}
/* a { */
/*   text-decoration: none; */
/* } */

/* body { */
/*   -webkit-font-smoothing: antialiased; */
/*   font-family: 'Roboto', sans-serif; */
/* } */


/* .container { */
/*   max-width: 1200px; */
/*   display: -webkit-box; */
/*   display: -moz-box; */
/*   display: -ms-flexbox; */
/*   display: -webkit-flex; */
/*   display: flex; */
/*   -webkit-flex-flow: row wrap; */
/*   flex-flow: row wrap; */
/*   justify-content: center; */
/*   margin: 100px auto; */
/* } */
.container .news-item {
  width: 45%;
  height: 510px;
  margin: 15px;
  padding-left:10px;
  -webkit-box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.55);
  -moz-box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.55);
  box-shadow: 0px 0px 30px 0px rgba(50, 50, 50, 0.55);
  border-radius: 5px;
}
.container .news-item .news-image {
  width: 100%;
  height: 350px;
  background-size: cover;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  position: relative;
}
.container .news-item .news-image ul {
  margin: 0;
  padding: 0;
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  height: 100%;
  background: #95b0ff;
  border-top-right-radius: 5px;
}
.container .news-item .news-image ul li {
  list-style: none;
  color: #FFF;
  padding: 5px 10px;
}
.container .news-item .news-infor-content {
/*   padding: 0 10px; */
}
.container .news-item .time-to-read {
  padding: 0;
  margin: 10px 0 0;
  font-size: 1em;
  max-width: 110px;
  color: #999;
  border-bottom: 1px solid;
}
.container .news-item .tittle, .container .news-item .paragraph {
  max-width: 300px;
  padding: 0;
  margin: 0;
  font-size: .9rem;
}
.container .news-item .tittle {
  color: #333333;
  border-width: 0px;
  background-color: transparent;
  background-image: none;
  box-shadow: none;
  filter: blur(0px);
  font-size: 24px;
  text-transform: none;
  color: black;
  font-weight: 100;
  font-style: normal;
  z-index: 46;
  font-family: 'Roboto', sans-serif;
  line-height: 24px;
  overflow: visible;
}
.container .news-item .paragraph {
  font-size: .9rem;
  color: #8b8b8b;
  font-weight: 900;
}
.container .news-item .bottom-content {
  -webkit-box-flex: 1;
  -webkit-flex: 1 0 auto;
  -ms-flex: 1 0 auto;
  flex: 1 0 auto;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-pack: end;
  -webkit-justify-content: flex-end;
  -ms-flex-pack: end;
  justify-content: flex-end;
  min-height: 30px;
  color: #008299;
  opacity: .7;
  font-size: 1em;
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
							<div class="container">
								<div class="news-item">
    								<div class="news-image" ><img class="cont_img" src="{{imgPath}}" />
   									</div>
    								<div class="news-infor-content">
    									<p  class="time-to-read">{{userId}}</p>
      									<div><img class="likeImg" style="vertical-align:top;margin-top:5px;width:25px;height:25px;" id="likeImg{{bno}}" src={{check checkfavorite}} onclick="like({{bno}})"/>
										<h4><strong><a href="/board/category/detailContent?bno={{bno}}&pageNo=1" style="display:inline-block; max-width:80%; min-width:20%;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">{{btitle}}</a></strong></h4>
    									</div>
										<div class="paragraph">
      										 <h5><span class="glyphicon glyphicon-tags" style="color: #F29661;"/>&nbsp; {{cateName}} &nbsp;
											 <span class="glyphicon glyphicon-road" style="color: #9FC93C;"/>&nbsp; {{distanceVal distance}} &nbsp;
											 <span class="glyphicon glyphicon-usd" style="color: #FFBB00;"/>&nbsp; {{value}} 원</h5>
    									</div>
    									<div class="bottom-content" style="text-align:right; margin-right:10px;">
                							<time class="timeago">{{dateVal bregdate}}</time>
    									</div>
      								</div>
  								</div>
							</div>
           				 </script>
					</ul>
					<!--     <p><ul id="showTimeline"></ul></p>  -->
			


			<!-- <div class="col-sm-offset-10 col-sm-4">
				<div class="app">
					<aside class="side">
					<ul class="tabs">
						<li><a href="index.html"><i class="icon-dribbble icon2"></i>
								Dribbble</a></li>


						<li class="active"><a href="index.html"><i
								class="icon-twitter icon2"></i> Twitter</a></li>


						<li><a href="index.html"><i class="icon-rss icon2"></i>
								RSS</a></li>


						<li><a href="index.html"><i class="icon-facebook icon2"></i>
								Facebook</a></li>
					</ul>
					<a href="index.html" class="add"><i class="icon-plus icon2"></i>
						Add</a> </aside>


					<section class="main"> <article class="item">
					<p>혜연바보</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic1.png"></a> <a href="index.html">@한혜연</a>
					<time datetime="2012-04-05T10:30:21+00:00" pubdate>4 minutes
					ago</time> </footer> </article> <article class="item">
					<p>주희는 진짜로 천재같다..</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic3.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:26:27+00:00" pubdate>8 minutes
					ago</time> </footer> </article> <article class="item">
					<p>Anim pariatur cliche reprehenderit, enim eiusmod high life
						accusamus terry richardson ad squid.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic2.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:15:45+00:00" pubdate>15
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> <article class="item">
					<p>Praesent arcu in mauris bibendum id ornare tortor
						scelerisque.</p>
					<footer> <a href="index.html" class="avatar"><img
						src="resources/images/pic4.png"></a> <a href="index.html">@someone</a>
					<time datetime="2012-04-05T10:14:01+00:00" pubdate>16
					minutes ago</time> </footer> </article> </section>
				</div>

			</div> -->
			</div>
		</div>
	</div>
</body>
</html>