<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-------------------------------------------- category section 게시글 상세보기 ---------------------------------------------->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Best User</title>
<style>

#userBox:hover {
	background-color: #eee;
}

/* #lowerUserBox {
	padding: 20px;
	background-color: #FAFAFA;
	border: 1px solid #EFEFEF;
	border-radius: 10px;
	min-height: 150px;
	max-height: 150px;
}
 */
#lowerUserBox:hover {
	background-color: #eee;
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
	$(function() {
				
	 
	 	
		$.ajax({
			type : "post",
			url : "/bestUser/lowerUserList",
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (data.result == "ok") {

					var str = "";
					str += "<div id='lowerRow'>";
					
					$.each(data.lowerUserList, function(i, user) {
						str += "<div id='userBox' class='panel panel-default divClickClass'>" +
						"<div class='panel-heading'>" +
							"<font class='fontTagId' style='font-size:15px;'>" + user.userId + "</font>" +
						"</div>" +
						"<div class='panel-body'>"+
							"<h2 class='bold padding-bottom-7'>" +
								"<span style='color:#330099;font-weight: bold;' class='avgspan'>" + user.avg + "</span> <small>/ 5" +
								"<span style='font-size:14px;color:black;'> &nbsp;[" + user.totReviewCnt + "]</span></small>" +
							"</h2>" +
							"<a href='/bestUser/userReview?userId=" + user.userId + "&avg=" + user.avg + "'>" +
							"<span style='text-align:right; float:right;font-size:10px;margin:2%;'>" + "MORE >" +
						"</span></a></div></div>";
					});

					// 페이징 처리
					str += "<div align = 'center'>" +
						"<ul class='pagination pagination-sm'>";
					if (data.pagingDTO.groupNo > 1) {
						str += "<li>"
							+ "<a href='javascript:paging(" + 1 + ")'>처음</a>"
							+ "</li>"
							+ "<li>"
							+ "<a href='javascript:paging(" + (parseInt(data.pagingDTO.pageStartNo) - 1) + ")'>◀</a>"
							+ "</li>";
					}
					for (var i = data.pagingDTO.pageStartNo; i <= data.pagingDTO.pageEndNo; i++) {
						if (data.pagingDTO.pageNo != i) {
							str += "<li><a href='javascript:paging(" + i + ")'>" + i + "</a></li>";
						} else {
							str += "<li><a href='#' style='background-color: #085B86; color: white; font-weight: bold;'>&nbsp;" + i + "&nbsp;</a></li>";
						}

					}
					if (data.pagingDTO.groupNo < data.pagingDTO.totalGroupCount) {
						str += "<li><a href='javascript:paging(" + (parseInt(data.pagingDTO.pageEndNo) + 1) + ")'>▶</a></li>"
							+ "<li><a href='javascript:paging(" + data.pagingDTO.totalPageCount + ")'>마지막</a></li>";
					}
					str += "</ul>"
						+ "</div></div>";

					$("#lowerUserList").append(str);
				}
			}
			
		});
		
		$(document).on("click",".divClickClass",function(event){
			 var divObj = $(this);
	 		var fontObj = divObj.find(".fontTagId");
	 		var userId = fontObj.text();
	 		var avg = divObj.find(".panel-body").find(".avgspan").text();
	 		alert("userId : " + userId + " avg : " + avg);
	 		location.href="/bestUser/userReview?userId="+userId+"&avg="+ avg;
	 	});
	}); // end of ready

	// 페이징 처리 함수
	function paging(pageNoVal) {
		var type = $("#searchType").val();
		var text = $("#searchText").val();
		if (!text) {
			type = "";
		}

		$.ajax({
			type : "post",
			url : "/bestUser/lowerUserList?pageNo=" + pageNoVal + "&searchType=" + type + "&searchText=" + text,
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (data.result == "ok") {

					$("#lowerRow").remove();
					var str = "";
					str += "<div id='lowerRow'>";
					
					$.each(data.lowerUserList, function(i, user) {		
						
						str += "<div id='userBox' class='panel panel-default' >" +
						"<div class='panel-heading'>" +
							"<font style='font-size:15px;'>" + user.userId + "</font>" +
						"</div>" +
						"<div class='panel-body'>"+
							"<h2 class='bold padding-bottom-7'>" +
								"<span style='color:#330099;font-weight: bold;'>" + user.avg + "</span> <small>/ 5" +
								"<span style='font-size:14px;color:black;'> &nbsp;[" + user.totReviewCnt + "]</span></small>" +
							"</h2>" +
							"<a href='/bestUser/userReview?userId=" + user.userId + "&avg=" + user.avg + "'>" +
							"<span style='text-align:right; float:right;font-size:10px;margin:2%;'>" + "MORE >" +
						"</span></a></div></div>";
							
					});

					// 페이징 처리
					str += "<div align = 'center'>" +
						"<ul class='pagination pagination-sm'>";
					if (data.pagingDTO.groupNo > 1) {
						str += "<li>"
							+ "<a href='javascript:paging(" + 1 + ")'>처음</a>"
							+ "</li>"
							+ "<li>"
							+ "<a href='javascript:paging(" + (parseInt(data.pagingDTO.pageStartNo) - 1) + ")'>◀</a>"
							+ "</li>";
					}
					for (var i = data.pagingDTO.pageStartNo; i <= data.pagingDTO.pageEndNo; i++) {
						if (data.pagingDTO.pageNo != i) {
							str += "<li><a href='javascript:paging(" + i + ")'>" + i + "</a></li>";
						} else {
							str += "<li><a href='#' style='background-color: #158cba; color: white;'>&nbsp;" + i + "&nbsp;</a></li>";
						}

					}
					if (data.pagingDTO.groupNo < data.pagingDTO.totalGroupCount) {
						str += "<li><a href='javascript:paging(" + (parseInt(data.pagingDTO.pageEndNo) + 1) + ")'>▶</a></li>"
							+ "<li><a href='javascript:paging(" + data.pagingDTO.totalPageCount + ")'>마지막</a></li>";
					}
					str += "</ul>"
						+ "</div></div>";

					$("#lowerUserList").append(str);
				}
			}
		});

	} // end of paging
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<!-- 파워 딜러 10명의 리스트 뿌리기 (고정) -->
				<div id="powerDealer" class="col-sm-7">
					<h2 style="margin-left: 20px;">파워 딜러</h2>
					<br />
					<c:forEach items="${evalList}" var="evalDTO" varStatus="status">
						<div id="userBox" class="panel" onClick="location.href='/bestUser/userReview?userId=${evalDTO.userId}&avg=${evalDTO.avg}'">
							<div class="panel-heading"  style="background-color: #E4F7BA;">
								<font style="color: #dd0000;font-size:20px;">${status.count}. </font>
								<font style="font-size:20px;">${evalDTO.userId}</font>
								<c:if test="${status.count == 1}">
									<img src="/resources/images/crown.png" align="right" />
								</c:if>
							</div>
							<div class="panel-body">
								<h2 class="bold padding-bottom-7">
									<span style="color: #330099; font-weight: bold;">${evalDTO.avg}</span>
									<small>/ 5</small>
								</h2>
								
								<span class="star_rating"> <a href="#"
								id="${evalDTO.userId}1">★</a> <a href="#"
								id="${evalDTO.userId}2">★</a> <a href="#"
								id="${evalDTO.userId}3">★</a> <a href="#"
								id="${evalDTO.userId}4">★</a> <a href="#"
								id="${evalDTO.userId}5">★</a> <script type="text/javascript">
						var userId = "${evalDTO.userId}";
						var avgVal = ${evalDTO.avg};
						avgVal = Math.floor(avgVal);
						//console.log(avgVal);
						
						for(var i=1; i <= avgVal; i++){
							$("#"+userId+i).addClass("on");
						}	
						
					</script>
							</span><span> &nbsp;[${evalDTO.totReviewCnt }]</span> <a
								href="/bestUser/userReview?userId=${evalDTO.userId}&avg=${evalDTO.avg}">
								<span
								style="text-align: right; float: right; font-size: 10px; margin: 2%">
									MORE > &nbsp; </span>
							</a>
							</div>
							
						</div>
						<br />
					</c:forEach>
				</div>

				<!-- 상위 10명을 제외한 나머지 판매자들 리스트 뿌리기  -->
				<div class="col-sm-5" style="float: right;">
					<label style="font-style: bold;">판매자ID </label>
					<div id="search" style="float: right;" class="input-group">
						<input type="hidden" name="searchType" id="searchType" value="userId" /> 
							<input type="text" name="searchText" class="form-control" vid="searchText" value="${pagingDTO.searchText }" />
						<div class="input-group-btn">
							<button onclick="paging('1');" class="btn btn-default btn-lg" style="padding-bottom: 11px; padding-top: 11px;">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</div>

					</div>

					<!-- 하위 판매자들 ajax로 보여줄 공간 -->
					<div id="lowerUserList" style="margin-top: 60px; clear: both"></div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>