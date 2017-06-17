<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-------------------------------------------- category section 게시글 상세보기 ---------------------------------------------->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Best User</title>
<style>

.rating-block {
	background-color: #FAFAFA;
	border: 1px solid #EFEFEF;
	padding: 15px 15px 20px 15px;
	border-radius: 3px;
	height: 100%;
}

.padding-bottom-7 {
	padding-bottom: 7px;
}

.review-block-name {
	font-size: 12px;
	margin: 10px 0;
}

.review-block-date {
	font-size: 12px;
}

.review-block-rate {
	font-size: 13px;
	margin-bottom: 15px;
}

.review-block-title {
	font-size: 15px;
	font-weight: 700;
	margin-bottom: 10px;
}

.review-block-description {
	font-size: 13px;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #F78E41;
}
</style>
<script type="text/javascript">
		$(function(){
			var avgVal = ${avgVal};
			avgVal = Math.floor(avgVal);
			//console.log(avgVal);
			
			for(var i=1; i <= avgVal; i++){
				$("#star"+i).addClass("on");
				console.log($("#star"+i));
			}
		});
		
	
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h3>
					<span class="glyphicon glyphicon glyphicon-link" style="color: #0E3E59;">&nbsp;파워딜러 후기</span>
				</h3>
				<br />
				<div class="col-sm-6">
					<div class="panel">
						<div class="panel-heading" style="background-color: #D1E0EF;">
							<h4 class="bold">${userId}</h4>
						</div>
						<div class="panel-body">
							<h2 class="bold padding-bottom-7">
								<span style="color: #330099;">${avgVal}</span> <small>/
									5</small>
							</h2>
							<div class="star_rating">
								<a href="#" id="star1">★</a> <a href="#" id="star2">★</a> <a
									href="#" id="star3">★</a> <a href="#" id="star4">★</a> <a
									href="#" id="star5">★</a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6" style="float: right;">
					<div class="pull-left">
						<div class="pull-left" style="width: 35px; line-height: 1;">
							<div style="height: 9px; margin: 5px 0;">
								5 <span class="glyphicon glyphicon-star"></span>
							</div>
						</div>
						<div class="pull-left" style="width: 180px;">
							<div class="progress" style="height: 9px; margin: 8px 0;">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="5" aria-valuemin="0"
									aria-valuemax="5" style="width: 1000%">
									<span class="sr-only">80% Complete (danger)</span>
								</div>
							</div>
						</div>
						<div class="pull-right" style="margin-left: 10px;">${scoreList["0"].count }</div>
					</div>
					<div class="pull-left">
						<div class="pull-left" style="width: 35px; line-height: 1;">
							<div style="height: 9px; margin: 5px 0;">
								4 <span class="glyphicon glyphicon-star"></span>
							</div>
						</div>
						<div class="pull-left" style="width: 180px;">
							<div class="progress" style="height: 9px; margin: 8px 0;">
								<div class="progress-bar progress-bar-primary"
									role="progressbar" aria-valuenow="4" aria-valuemin="0" aria-valuemax="5" style="width: 80%">
									<span class="sr-only">80% Complete (danger)</span>
								</div>
							</div>
						</div>
						<div class="pull-right" style="margin-left: 10px;">${scoreList["1"].count }</div>
					</div>
					<div class="pull-left">
						<div class="pull-left" style="width: 35px; line-height: 1;">
							<div style="height: 9px; margin: 5px 0;">
								3 <span class="glyphicon glyphicon-star"></span>
							</div>
						</div>
						<div class="pull-left" style="width: 180px;">
							<div class="progress" style="height: 9px; margin: 8px 0;">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="3" aria-valuemin="0" aria-valuemax="5" style="width: 60%">
									<span class="sr-only">80% Complete (danger)</span>
								</div>
							</div>
						</div>
						<div class="pull-right" style="margin-left: 10px;">${scoreList["2"].count }</div>
					</div>
					<div class="pull-left">
						<div class="pull-left" style="width: 35px; line-height: 1;">
							<div style="height: 9px; margin: 5px 0;">
								2 <span class="glyphicon glyphicon-star"></span>
							</div>
						</div>
						<div class="pull-left" style="width: 180px;">
							<div class="progress" style="height: 9px; margin: 8px 0;">
								<div class="progress-bar progress-bar-warning"
									role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="5" style="width: 40%">
									<span class="sr-only">80% Complete (danger)</span>
								</div>
							</div>
						</div>
						<div class="pull-right" style="margin-left: 10px;">${scoreList["3"].count }</div>
					</div>
					<div class="pull-left">
						<div class="pull-left" style="width: 35px; line-height: 1;">
							<div style="height: 9px; margin: 5px 0;">
								1 <span class="glyphicon glyphicon-star"></span>
							</div>
						</div>
						<div class="pull-left" style="width: 180px;">
							<div class="progress" style="height: 9px; margin: 8px 0;">
								<div class="progress-bar progress-bar-danger" role="progressbar"
									aria-valuenow="1" aria-valuemin="0" aria-valuemax="5" style="width: 20%">
									<span class="sr-only">80% Complete (danger)</span>
								</div>
							</div>
						</div>
						<div class="pull-right" style="margin-left: 10px;">${scoreList["4"].count }</div>
					</div>
				</div>

				<br /> <br />
				<!-- 리뷰 리스트에 대한 AJAX 처리할 부분 -->
				<div class="col-sm-12" style="margin: 5% 0% 5% 0%;">
					<div class="panel panel-default">
						<div class="panel-body review"> </div>
					</div>
					
					<div class="reviewBtn" style="float:left;">
						<a href="javascript:showNextReview()" class="btn btn-link">리뷰 더보기</a>
					</div>
					
					<button type="button" style="float: right;" class="btn btn-primary" onclick="location.href='/bestUser/bestUserSection'">돌아가기</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
			var reviewCnt = 0;	// 리뷰 총 갯수
			var reviewStartRow = 0;
			
			$(function(){
				
				// 리뷰 보여주는 함수 호출
				showNextReview();
				
			});// end of ready
			
			function showNextReview(){
				
				// 알고 있어야 되는 정보 : 전체 댓글 갯수, 현재 댓글의 startRow
				$.ajax({
					type : "post",
					url : "/bestUser/showReview",
					data : {
						userId : "${userId}",
						startRow : reviewStartRow
					},
					dataType : "json",
					success : function(data) {
						
						if (data.result == "ok") {
							// <div class="review-block"> 에 추가하기						
							$.each(data.reviewList, function(i, review) {
								
								var str = "";		

								str += "<div class='row'>"
									+  		"<div class='col-sm-3'>"
									+  			"<div class='review-block-name' style='font-size:20px;'><a href='#'>"+review.buyerId+"</a></div>"
									+  			"<div class='review-block-date'>"+review.pRegDate+"<br/>"+review.cateName+"</div>"
									+		"</div>"
									+		"<div class='col-sm-9'>"
									+			"<div class='star_rating'>"
							   		+				"<a href='#' id='"+review.postNum+"1'>★</a>"
							   		+				"<a href='#' id='"+review.postNum+"2'>★</a>"
							   		+				"<a href='#' id='"+review.postNum+"3'>★</a>"
							   		+				"<a href='#' id='"+review.postNum+"4'>★</a>"
							   		+				"<a href='#' id='"+review.postNum+"5'>★</a>"
								   	+			"</div>"
									+ 			"<div class='review-block-description bold' style='margin-top:10px;'>"+review.pcontent+"</div>"
									+		"</div>"
									+	"</div>";
									
									////// 마지막 hr에 대한 처리?????
									str += "<hr/>";
								
								$(".review").append(str);
								
								var postNo = review.postNum;
								var score = review.pscore;
								
								for(var j=1; j <= score; j++){
									$('#'+postNo+j).addClass('on');
								}
							});// end of each
						
							//더보기 버튼에 대한 처리
							reviewCnt = data.reviewCnt;
							reviewStartRow += data.reviewList.length * 1; //startRow += 5;  ( *1은 String일 경우 강제로 숫자로 계산하기 위함 )
							
							console.log("startRow : "+reviewStartRow);
							if (reviewCnt > reviewStartRow) {
								// 댓글 더보기 버튼 화면에 표시
								$(".reviewBtn").show();
		
							} else {
								$(".reviewBtn").hide();
							}
		
						} else {
							alert("조회 실패");
						}
					},
					error : function(xhr, status, error) {
						alert("error\nxhr : " + xhr + ", status : "
							+ status + ", error : " + error);
					}
				});
				
				
			}// end of showNextReview
			
		
		</script>
</body>
</html>