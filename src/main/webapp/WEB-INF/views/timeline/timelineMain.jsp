<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.offcanvas.css" />
<link rel="stylesheet" href="/resources/css/exindex.css" />

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/resources/js/timelineJS.js?ver=3"></script>
    
    <link rel="stylesheet" href="/resources/css/sidebarCSS.css" />
    <!-- socket 사용을 위해 추가 -->
	<script type="text/javascript" src="/resources/sockjs.min.js"/>    
	<script type="text/javascript" src="/resources/js/json2.js"></script>

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
    	top:-10px;
    	left:-25px;
    	text-decoration: none;
	}
	
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="col-sm-6 col-sm-offset-2">
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
									</span> <br>
									<br> <span class="input-group"> <label
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
									</span> <br>
									<br>

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

					<div style="border: solid 1px #DDD !important; margin-top: 3%;">

						<ul id="showTimeline" class="timeline">
							<script id="entry-template2" type="text/x-handlebars-template"> 
                  <li class="timeline-event">
                   <label class="timeline-event-icon"></label>
                   <div class="timeline-event-copy">
                     <p class="timeline-event-thumbnail">{{dateVal bregdate}}</p>
                        <br/>
                     <div class='label label-danger'>카테고리</div>
                     <span><b>{{cateName}}</b></span><br/>
                     <div class='label label-warning'>거리</div>
                     <span><b>{{distanceVal distance}}</b></span><br/>
                     <div class='label label-warning'>금액</div>
                     <span><b>{{value}} 원</b></span>
                     <h2><strong><a href="/board/category/detailContent?bno={{bno}}&pageNo=1">{{btitle}}</a></strong></h2>
                     <i class='glyphicon glyphicon-time'></i> 등록일 : {{bregdate}}<br/><br/>
                     <span><b>{{userId}}</b></span><br/>
					<img src='{{imgPath}}'/>
					<hr/>	
					<span>
						<img id="likeImg{{bno}}" src={{check checkfavorite}} onclick="like({{bno}})"/>
					</span>
            </script>
						</ul>
						<!--     <p><ul id="showTimeline"></ul></p>  -->
					</div>
				</div>


				<div class="col-sm-offset-8 col-sm-4">
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
						<time datetime="2012-04-05T10:30:21+00:00" pubdate>4
						minutes ago</time> </footer> </article> <article class="item">
						<p>주희는 진짜로 천재같다..</p>
						<footer> <a href="index.html" class="avatar"><img
							src="resources/images/pic3.png"></a> <a href="index.html">@someone</a>
						<time datetime="2012-04-05T10:26:27+00:00" pubdate>8
						minutes ago</time> </footer> </article> <article class="item">
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

				</div>
			</div>
		</div>
	</div>
	
	
	<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="/resources/js/bootstrap.offcanvas.js"></script>
</body>
</html>