<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/WEB-INF/views/note/includeModalCSS.jsp"%>
<link rel="stylesheet" href="/resources/css/sidebar.css">

<style>
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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<!-- 네비게이션 -->
				<aside>
				<h3 class="navibar" style="margin-bottom: 20px;">
					My Page<span class="arrow-down glyphicon glyphicon-menu-down"
						aria-hidden="true" style="float: right;"></span>
				</h3>
				<ul class="navibar">
					<li><a href="javascript:favirtelist();"> 좋아요 목록</a></li>
					<li><a href="javascript:myWriteList();">내가 올린 글 </a></li>
					<li><a href="#"> 쪽지 보관함 <span class="caret"></span></a>
					<li style="margin-left: 7%;"><a href="/note/listReceive">받은쪽지함</a></li>
					<li style="margin-left: 7%;"><a href="/note/listSend">보낸쪽지함</a></li>
					<li><a data-toggle="modal" data-target="#myModal">회원정보 수정
					</a></li>
					<li><a href="javascript:myExchangeList();">거래중인 게시물 </a></li>
				</ul>
				</aside>
			</div>

			<div class="col-md-8 col-md-offset-1">
				
				<!-- 거래인 지정 모달창 -->
				<div class="modal fade" id="layerpop">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<!-- 닫기(x) 버튼 -->
								<button type="button" class="close" data-dismiss="modal"></button>
								<!-- header title -->
								<h4 class="modal-title">구매결정</h4>
							</div>
							<!-- body -->

							<div class="modal-body">
								<label>거래할 사용자 ID</label>
								<div class="input-group">
									<input type="hidden" id="bnoId" /><br /> 
									<input type="hidden" id="userIdVal" /> 
									<input type="hidden" id="cateIdVal" /> 
									<input type="text" class="determine form-control" /> 
									<span class="input-group-btn">
										<button type='button' class='btn btn-primary determineBtn' style="margin-top: 20px">결정</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 후기작성 모달창 -->
				<div class="modal fade" id="reviewModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<!-- 닫기(x) 버튼 -->
								<button type="button" class="close" data-dismiss="modal"></button>
								<!-- header title -->
								<h3 class="modal-title">구매 후기 작성</h3>
							</div>
							<!-- body -->
							<div class="modal-body">
								<br>
								<table class="table-bordered">
									<tr>
										<th style="text-align: center; width: 15%; height: 34px; background-color: #F6F6F6">판매자</th>
										<td><span id="userId" style="margin-left: 5px;"></span></td>
									</tr>
									<tr>
										<th style="text-align: center; width: 15%; height: 34px; background-color: #F6F6F6">거래인</th>
										<td><span id="buyerId" style="margin-left: 5px;"></span></td>
									</tr>
									<tr>
										<th style="text-align: center; background-color: #F6F6F6">내용</th>
										<td><textarea rows="10" cols="80" name="pcontent"
												id="pcontent" class="form-control"></textarea></td>
									</tr>
									<tr>
										<th
											style="text-align: center; height: 34px; background-color: #F6F6F6">별점</th>
										<td><p class="star_rating">
												<a href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a>
												<a href="#">★</a> <a href="#">★</a>
											</p> <input type="hidden" class="form-control" name="pscore" id="pscore" /></td>
									</tr>
								</table>

							</div>
							<!-- Footer -->
							<div class="modal-footer">
								<input type="hidden" name="bno" id="bno" />
								<button id="reviewBtn" type="button" class="btn btn-primary">작성하기</button>
								<button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>



				<!-- 회원수정 페이지로 이동하기 위한 패스워드 입력 모달창 -->
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"></button>
								<h4 class="modal-title">패스워드 확인</h4>
							</div>
							<div class="modal-body">
								<form id="form1" action="/user/modifyInfo" method="post">
									<p style="color:blue;">회원정보를 수정하기 위해 패스워드를 확인해주세요.</p> <br/><br/>
									<label>비밀번호</label>
									<input id="pwId" type="password" name="password" class="form-control" />
								</form>
							</div>
							<div class="modal-footer">
								<button id="btnClick" type="button" class="btn btn-primary">확인</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

				<div id="formWrapper" style="float: left;">
					<div id="form-contact" style="padding-left: 1%">
					<h3><span class="glyphicon glyphicon-ok-circle likeTitle" style="color: #0E3E59;">&nbsp;좋아요 목록</span></h3>
					<br/><br/>
						<table class="table table-hover" style="table-layout:fixed;">
							<tr style="background-color: #D1E0EF;">
								<th style="width: 10%; text-align: center;">글번호</th>
								<th style="width: 15%; text-align: center;">카테고리</th>
								<th style="width: 35%; text-align: center;">제목</th>
								<th style="width: 10%; text-align: center;">작성자</th>
								<th style="width: 20%; text-align: center;">작성날짜</th>
								<th style="width: 10%; text-align: center;">좋아요</th>
							</tr>
							<c:if test="${empty MyFavoriteList}">
								<tr>
									<td colspan="7" style="text-align: center">좋아요한 게시글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${MyFavoriteList}" var="boardDTO"
								varStatus="status">
								<tr id="table123" style="text-align: center">
									<td id="tablebNo">${boardDTO.bNo}</td>
									<td>${boardDTO.cateName}</td>
									<td><a
										href="/board/category/detailContent?bno=${boardDTO.bNo}" style="display:block;margin:0 auto; width:auto;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">${boardDTO.bTitle }</a></td>
									<td>${boardDTO.userId }</td>
									<td>${boardDTO.bRegDate }</td>
									<td>
										<%-- 	<button id="likeButton" type="button"
									value="${status.count}" style="width: 70px;"></button> --%> <img
										id="likeImage" src="/resources/images/like2.png"
										style="width: 20px; height: 20px;" /> <span id="likeCount"></span>
									</td>
								</tr>
							</c:forEach>
						</table>

						<!-- 
                       	[이전][1][2][3]...[10][다음] 부분 작성
                        -->
						<!-- [이전] -->
						<div class="text-center">
							<ul class="pagination">
								<li><a href="/mypage/myList${pageMaker.pageQuery(1)}">처음</a>
								</li>
								<c:if test="${pageMaker.prev}">
									<li><a
										href="/mypage/myList${pageMaker.pageQuery(pageMaker.startPage-1)}">◀</a>
									</li>
								</c:if>
								<!-- [1][2][3]...[10] -->
								<c:forEach var="index" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li ${pageMaker.page == index ? 'class=active' : '' }><a
										href="/mypage/myList${pageMaker.pageQuery(index)}">${index}</a>
									</li>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="/mypage/myList${pageMaker.pageQuery(pageMaker.endPage+1)}">▶</a>
									</li>
								</c:if>
								<!-- [마지막] -->
								<li><a
									href="/mypage/myList${pageMaker.pageQuery(pageMaker.entireEndPage)}">마지막</a>
								</li>
							</ul>
						</div>
						<!-- 쪽지 페이징 처리 -->

					</div>
				</div>


			</div>
			<!-- 회원정보수정 -->
			<c:if test="${map.msg eq 'FAIL'}">
				<script>
						alert("실패했습니다");
					</script>
			</c:if>


			<script>
					/* 회원정보수정 */
					
					$(document).ready(function() {
						$("#btnClick").on("click", function(event) {
							var formId = $("#form1");
							formId.submit();
						});// end of btnClick
					});// end of ready()

					// 거래인 지정용 전역변수
					var spanCustomer;
					// 거래인 지정하면 해당 버튼 비활성화하기 위한 객체 저장 전역변수
					var buyerBtn;

					var tablebno = null; //클릭한 버튼 bno를 저장할 변수
					var favoriteBtn = null; //버튼객체 하위 이미지 태크를 넣을 변수
					$(document).on(
							"click",
							"#likeImage",
							function(event) {
								//				var favoriteBtn = $(this).find("#likeImage");
								var favoriteBtn = $(this);
								tablebno = $(this).parent().parent().find(
										"#tablebNo").text();
								//alert($(this).val()); //현재 위치 값
								//alert("확인 : " + $(this).parent().parent().find("#tablebNo").text());
								update(tablebno, favoriteBtn);
							});

					/** 좋아요 체크 */
					function check(tablebno, favoriteBtn) {
						var bno = tablebno;
						var userId = "${loginSession.userId}";
						var btn = favoriteBtn;
						$.ajax({
							type : 'get',
							url : '/mypage/checkFavorite?bno=' + bno
									+ '&userId=' + userId,
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "GET"
							},
							dataType : 'text',
							success : function(result) {
								if (result == "SUCCESS") {
									btn.attr("src",
											"/resources/images/like2.png");
									//count(tablebno);
								}
								if (result == "FAIL") {
									btn.attr("src",
											"/resources/images/like1.png");
									//count(tablebno);
								}

							}
						});
					} // end of check()

					/** 좋아요 업데이트 */
					function update(tablebno, favoriteBtn) {
						var bno = tablebno;
						var userId = "${loginSession.userId}";
						var btn = favoriteBtn;
						$.ajax({
							type : 'get',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "GET"
							},
							url : '/mypage/handlingFavorite?bno=' + bno
									+ '&userId=' + userId,
							dataType : 'text',
							success : function(data) {
								check(tablebno, favoriteBtn);

							}
						}); // end of ajax from likeBoard Btn Click
					} // end of update()
					
					//마이페이지 좋아요 목록 첫번째 꺼 ajax로 통신
			        function favirtelist() {
			               $.ajax({
			                  type : 'get',
			                  headers : {
			                     "Content-Type" : "application/json",
			                     "X-HTTP-Method-Override" : "GET"
			                  },
			                  url : '/mypage/myfavorite',
			                  dataType : 'json',
			                  success : function(result) {
			                  if (result.success == "success") {
			                   	$("#form-contact").remove();
			                   	$(".likeTitle").remove();
			                   
			                   	var str = "";
			                    str += "<div id='form-contact' style='padding-left: 1%'>";
			                    str += "<table class='table table-hover' style='table-layout:fixed;'>";
								str += "<h3><span class='glyphicon glyphicon-ok-circle' style='color: #0E3E59;'>&nbsp;좋아요 목록</span></h3>";
								str += "<br/><br/>";
			                    str += "<tr style='background-color:#D1E0EF;'>";
			                 	str += "<th style='width: 10%; text-align: center;'>글번호</th>";
			                 	str += "<th style='width: 15%; text-align: center;'>카테고리</th>";
			                 	str += "<th style='width: 35%; text-align: center;'>제목</th>";
			                 	str += "<th style='width: 10%; text-align: center;'>작성자</th>";
			                 	str += "<th style='width: 20%; text-align: center;'>작성날짜</th>";
			                 	str += "<th style='width: 10%; text-align: center;'>좋아요</th>";
			                	str += "</tr>";  
			                   	  
			                    if(result.pageMaker.totalCount == 0){
			                        str +="<tr><td colspan='7' style='text-align:center;'> 좋아요를 누른 항목이 없습니다 </td></tr> ";   
			                        $("#formWrapper").append(str);
			                        return;
			                    }
			                    $.each(result.MyBoardList, function(i, board) {
			                       str += "<tr id='table123' style='text-align: center'>";
			                       str += "<td style='text-align: center;'>" + board.bNo + "</td>";
			                       str += "<td style='text-align: center;'>" + board.cateName + "</td>";
			                       str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+" style='display:block;margin:0 auto; width:auto;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;'>"+ board.bTitle +" </a> </td>";
			                       str += "<td style='text-align: center;'>" + board.userId + "</td>";
			                       str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
			                       str +="<td><img id='likeImage' src='/resources/images/like2.png' style='width:20px; height:20px;'/></td>";
			                       str +="<span id='likeCount'></span>";
			                       str += "</tr>";
			                    });
			                    str += "</div>";
			                    str += "</table>";
			                        
			                   var pageMaker=result.pageMaker;//페이징 객체
			                        // 페이징 처리
			                        str += "<div class='text-center' >" +
			                              		"<ul class='pagination'>";
			                        if(pageMaker.entireEndPage>1){
			                        	str +="<li><a href='javascript:myfavorListPaging("+1+','+pageMaker.perPageNum+")'>처음</a></li>" ;
			                        }
			                        if(pageMaker.prev){
			                       	 	str +="<li><a href='javascript:myfavorListPaging("+(parseInt(result.pageMaker.startPage)-1)+','+pageMaker.perPageNum+")'>◀</a></li>" ;
			                        } 		
			                        
			                      	for(i=pageMaker.startPage; i<=pageMaker.endPage; i++){
			                      		if(pageMaker.page==i){
			                      			str += "<li class='active'><a  href='javascript:myfavorListPaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
			                      		}else{
			                      			str += "<li><a href='javascript:myfavorListPaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
			                      		}
			                      		
			                      	}
			                      	if(pageMaker.next){
			                      	 	str +="<li><a href='javascript:myfavorListPaging("+(parseInt(result.pageMaker.endPage)+1)+','+pageMaker.perPageNum+")'>▶</a></li>" ;
			                      	}
			                     	if(pageMaker.entireEndPage>1){
			                      		str +="<li><a href='javascript:myfavorListPaging("+pageMaker.entireEndPage+','+pageMaker.perPageNum+")'>마지막</a></li>" ;
			                     	}
			                      	str +="</ul>"
			                       		+"</div>";
			                              
			                        $("#formWrapper").append(str);
			                     }
			               
			                  }
			           });
			         } 
					//end of favorite()                  
					
					//myfavorListPaging 마이페이지 ajax로 페이징 하기
		function myfavorListPaging(page,perPageNum) {
                $.ajax({
                   type : 'get',
                   headers : {
                      "Content-Type" : "application/json",
                      "X-HTTP-Method-Override" : "GET"
                   },
                   url : '/mypage/myfavorite?page='+page+'&perPageNum='+perPageNum,
                   dataType : 'json',
                   success : function(result) {
                   if (result.success == "success") {
                    	$("#form-contact").remove();
                    	$(".likeTitle").remove();
                    	var str = "";
                        str += "<div id='form-contact' style='padding-left: 1%'>";
                        str += "<h3><span class='glyphicon glyphicon-ok-circle' style='color: #0E3E59;'>&nbsp;좋아요 목록</span></h3>";
						str += "<br/><br/>";
                        str += "<table class='table table-hover' style='table-layout:fixed;'>";
                        str += "<tr style='background-color:#D1E0EF;'>";
                    	str += "<th style='width: 10%; text-align: center;'>글번호</th>";
                    	str += "<th style='width: 15%; text-align: center;'>카테고리</th>";
                    	str += "<th style='width: 35%; text-align: center;'>제목</th>";
                    	str += "<th style='width: 10%; text-align: center;'>작성자</th>";
                    	str += "<th style='width: 20%; text-align: center;'>작성날짜</th>";
                    	str += "<th style='width: 10%; text-align: center;'>좋아요</th>";
                    	str += "</tr>";  
                        if(result.pageMaker.totalCount == 0){
                         str +="<tr><td colspan='7' style='text-align:center;'> 좋아요를 누른 항목이 없습니다 </td></tr> ";   
                         $("#formWrapper").append(str);
                         return;
                        }
                         /* alert(result.pageMaker.totalCount+"");//갯수 */

                    /*<td>
                  <img id="likeImage" src="/resources/images/like2.png" style="width: 20px; height: 20px;" />
                   <span id="likeCount"></span>
                    </td> */
                         $.each(result.MyBoardList, function(i, board) {
                            str += "<tr id='table123' style='text-align: center'>";
                            str += "<td style='text-align: center;'>" + board.bNo + "</td>";
                            str += "<td style='text-align: center;'>" + board.cateName + "</td>";
                            str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+"' style='display:block;margin:0 auto; width:auto;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;'>"+ board.bTitle +" </a> </td>";
                            str += "<td style='text-align: center;'>" + board.userId + "</td>";
                            str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
                            str +="<td><img id='likeImage' src='/resources/images/like2.png' style='width:20px; height:20px;'/></td>";
                            str +="<span id='likeCount'></span>";
                            str += "</tr>";
                         });
                         str += "</div>";
                         str += "</table>";
                         
                    var pageMaker=result.pageMaker;//페이징 객체
                         // 페이징 처리
                         str += "<div class='text-center' >" +
                               		"<ul class='pagination'>";
                         if(pageMaker.entireEndPage>1){
                         	str +="<li><a href='javascript:myfavorListPaging("+1+','+pageMaker.perPageNum+")'>처음</a></li>" ;
                          }
                         if(pageMaker.prev){
                        	 str +="<li><a href='javascript:myfavorListPaging("+(parseInt(result.pageMaker.startPage)-1)+','+pageMaker.perPageNum+")'>◀</a></li>" ;
                         } 		
                         
                     	for(i=pageMaker.startPage; i<=pageMaker.endPage; i++){
                       		if(pageMaker.page==i){
                       		str += "<li class='active'><a  href='javascript:myfavorListPaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
                       		}else{
                       		str += "<li><a  href='javascript:myfavorListPaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
                       		}
                       	}
                         
                       	if(pageMaker.next){
                       	 str +="<li><a href='javascript:myfavorListPaging("+(parseInt(result.pageMaker.endPage)+1)+','+pageMaker.perPageNum+")'>▶</a></li>" ;
                       	}
                       if(pageMaker.entireEndPage>1){	
                        str +="<li><a href='javascript:myfavorListPaging("+pageMaker.entireEndPage+','+pageMaker.perPageNum+")'>마지막</a></li>" ;
                       }
                        str +="</ul>"
                        +"</div>";
                               
                         $("#formWrapper").append(str);
                      }
                   
                   		$(document).on("click",".atag",function(event){
                  	  		$(this).attr("style","background:blue;");
                    	}); 
                   }
               });
         } 
		//myfavorListPaging 마이페이지 ajax로 페이징 하기

			/** 내가 쓴 글  업데이트  2번째 꺼*/
		  function myWriteList() {
           $.ajax({
              type : 'get',
              headers : {
                 "Content-Type" : "application/json",
                 "X-HTTP-Method-Override" : "GET"
              },
              url : '/mypage/myBoardList',
              dataType : 'json',
              success : function(result) {
                 if (result.success == "success") {
                    var str = "";
                    $("#form-contact").remove();
                    $(".likeTitle").remove();
                    str += "<div id='form-contact' style='padding-left: 1%'>";
					str += "<h3><span class='glyphicon glyphicon-ok-circle' style='color: #0E3E59;'>&nbsp;내가 올린 글</span></h3>";
					str += "<br/><br/>";
                    str += "<table class='table table-hover' style='table-layout:fixed;'>";
                    str += "<tr style='background-color:#D1E0EF;'>";
                    str += "<th style='width: 10%; text-align: center;'>글번호</th>";
                    str += "<th style='width: 15%; text-align: center;'>카테고리</th>";
                    str += "<th style='width: 30%; text-align: center;'>제목</th>";
                    str += "<th style='width: 10%; text-align: center;'>작성자</th>";
                    str += "<th style='width: 15%; text-align: center;''>작성날짜</th>";
                    str += "<th style='text-align:center;'>구매결정</th>";
                    str += "<th>거래인</th>";
                    str += "</tr>";
                    
                    if(result.pageMaker.totalCount == 0){
                        str +="<tr><td colspan='7' style='text-align:center;'> 내가 올린글이 없습니다. </td></tr> ";   
                        $("#formWrapper").append(str);
                        return;
                     }
                    
                    /* alert(result.pageMaker.totalCount+"");//갯수 */
                    
                    $.each(result.MyBoardList, function(i, board) {
                       str += "<tr>";
                       str += "<td style='text-align: center;'>" + board.bNo + "</td>";
                       str += "<td>" + board.cateName + "</td>";
                       str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+"' style='display:block;margin:0 auto; width:auto;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;'>"+ board.bTitle +" </a> </td>";
                       str += "<td style='text-align: center;'>" + board.userId + "</td>";
                       str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
                       
                       // bno값가지고 eval 테이블에서 해당 거래자 id가져오기
                       $.ajax({
                          type:'GET',
                          async:false,
                          url:'/mypage/getCustomer?bno='+board.bNo,
                          headers:{
                             "Content-Type":"application/json"
                          },
                          success:function(result){
                        	 if(result.isSwap == 'Y'){
                        		 str += "<td style='text-align: center;'><span style='color:red; font-size:0.9em'>거래 완료</span></td>";
                        	 }else if ( result.customerId != null ){
                                str += "<td style='text-align: center;'><span style='color:gray; font-size:0.9em'>거래중</span></td>";
                             }else{
                                str += "<td style='text-align: center;'><button class='btn btn-link testBtn' data-target='#layerpop' data-toggle='modal'>거래인 지정</button></td>";
                             }
                             str += "<td style='text-align: center;'><span class='customerId'>"+ ((result.customerId == null) ? " " : result.customerId) +"</span></td>";
                          }
                       }); // end of ajax
                       str += "</tr>";
                    });
                    str += "</div>";
                    str += "</table>";
                    
               var pageMaker=result.pageMaker;//페이징 객체
                    // 페이징 처리
                    str += "<div class='text-center' >" +
                          		"<ul class='pagination'>";
                    if(pageMaker.entireEndPage>1){	      		
                    str +="<li><a href='javascript:myWritepaging("+1+','+pageMaker.perPageNum+")'>처음</a></li>" ;
                    }
                    if(pageMaker.prev){
                   	 str +="<li><a href='javascript:myWritepaging("+(parseInt(result.pageMaker.startPage)-1)+','+pageMaker.perPageNum+")'>◀</a></li>" ;
                    } 		
                    
                  	for(i=pageMaker.startPage; i<=pageMaker.endPage; i++){
                  		if(pageMaker.page==i){
                      		str += "<li class='active'><a  href='javascript:myWritepaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
                      		}else{
                      		str += "<li><a  href='javascript:myWritepaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
                      		}
                      	}
                  	}
                    
                  	if(pageMaker.next){
                  	 str +="<li><a href='javascript:myWritepaging("+(parseInt(result.pageMaker.endPage)+1)+','+pageMaker.perPageNum+")'>▶</a></li>" ;
                  	}
                  	if(pageMaker.entireEndPage>1){	
                  	str +="<li><a href='javascript:myWritepaging("+pageMaker.entireEndPage+','+pageMaker.perPageNum+")'>마지막</a></li>";
                  	}
                   str +="</ul>"
                   +"</div>";
            	   
                 $("#formWrapper").append(str);
                 
                 }
                 
 
              
              }
           
           );
        } // end of myWriteList()
        
        /** 내가 쓴 글  업데이트  2번째 꺼*/
        function myWriteList() {
           $.ajax({
              type : 'get',
              headers : {
                 "Content-Type" : "application/json",
                 "X-HTTP-Method-Override" : "GET"
              },
              url : '/mypage/myBoardList',
              dataType : 'json',
              success : function(result) {
                 if (result.success == "success") {
                    var str = "";
                    $("#form-contact").remove();
                    $(".likeTitle").remove();
                    str += "<div id='form-contact' style='padding-left: 1%'>";
                    str += "<h3><span class='glyphicon glyphicon-ok-circle' style='color: #0E3E59;'>&nbsp;내가 올린 글</span></h3>";
					str += "<br/><br/>";
                    str += "<table class='table table-bordered' style='table-layout:fixed;'>";
                    str += "<tr style='background-color: #D1E0EF;'>";
                    str += "<th style='width: 5%; text-align: center;'>No</th>";
                    str += "<th style='width: 10%; text-align: center;'>카테고리</th>";
                    str += "<th style='width: 35%; text-align: center;'>제목</th>";
                    str += "<th style='width: 10%; text-align: center;'>작성자</th>";
                    str += "<th style='width: 20%; text-align: center;''>작성날짜</th>";
                    str += "<th style='text-align:center;'>구매결정</th>";
                    str += "<th>거래인</th>";
                    str += "</tr>";
                    
                    if(result.pageMaker.totalCount == 0){
                        str +="<tr><td colspan='7' style='text-align:center;'> 내가 올린글이 없습니다. </td></tr> ";   
                        $("#formWrapper").append(str);
                        return;
                     }
                    
                    /* alert(result.pageMaker.totalCount+"");//갯수 */
                    
                    $.each(result.MyBoardList, function(i, board) {
                       str += "<tr>";
                       str += "<td style='text-align: center;'>" + board.bNo + "</td>";
                       str += "<td>" + board.cateName + "</td>";
                       str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+"' style='display:block;margin:0 auto; width:auto;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;'>"+ board.bTitle +" </a> </td>";
                       str += "<td style='text-align: center;'>" + board.userId + "</td>";
                       str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
                       if(board.isSwap == 'Y'){
                       		str += "<td style='text-align: center;'><span style='border:1px solid; padding:5px; border-radius:10px;border-color:red;'>거래 완료</span></td>";
                       }else if ( board.buyerId != null ){
                       		str += "<td style='text-align: center;'><button  disabled=true class='btn btn-default testBtn' data-target='#layerpop' data-toggle='modal'>거래중</button></td>";
                       }else{
                       		str += "<td style='text-align: center;'><button class='btn btn-default testBtn' data-target='#layerpop' data-toggle='modal'>거래인 지정</button></td>";
                       }
                       str += "<td style='text-align: center;'><span class='customerId'>"+ ((board.buyerId == null) ? " " : board.buyerId) +"</span></td>";
                       str += "</tr>";
                    });
                    str += "</div>";
                    str += "</table>";
                    
              		 var pageMaker=result.pageMaker;//페이징 객체
                    // 페이징 처리
                    str += "<div class='text-center' >" +
                                "<ul class='pagination'>";
                    if(pageMaker.entireEndPage>1){               
                    str +="<li><a href='javascript:myWritepaging("+1+','+pageMaker.perPageNum+")'>처음</a></li>" ;
                    }
                    if(pageMaker.prev){
                       str +="<li><a href='javascript:myWritepaging("+(parseInt(result.pageMaker.startPage)-1)+','+pageMaker.perPageNum+")'>◀</a></li>" ;
                    }       
                    
                     for(i=pageMaker.startPage; i<=pageMaker.endPage; i++){
                        if(pageMaker.page==i){
                            str += "<li class='active'><a  href='javascript:myWritepaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
                        }else{
                            str += "<li><a  href='javascript:myWritepaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
                        }
                     }
                     if(pageMaker.next){
                         str +="<li><a href='javascript:myWritepaging("+(parseInt(result.pageMaker.endPage)+1)+','+pageMaker.perPageNum+")'>▶</a></li>" ;
                     }
                     if(pageMaker.entireEndPage>1){   
                        str +="<li><a href='javascript:myWritepaging("+pageMaker.entireEndPage+','+pageMaker.perPageNum+")'>마지막</a></li>";
                     }
                     str +="</ul>"
                     +"</div>";
                     }
                  
                 $("#formWrapper").append(str);
                 
                 }
                 
 
              
              }
           
           );
        } // end of myWriteList()
        
      /*   
      * 내가 쓴글 AJAX 페이징 처리하는 함수 2번째 꺼
      */
      function myWritepaging(page,perPageNum){
           /* alert("page="+page+"perPageNum="+perPageNum); */
           $.ajax({
                type : 'get',
                headers : {
                   "Content-Type" : "application/json",
                   "X-HTTP-Method-Override" : "GET"
                },
                url : '/mypage/myBoardList?page='+page+'&perPageNum='+perPageNum,
                dataType : 'json',
                success : function(result) {
                   if (result.success == "success") {
                      var str = "";
                      $("#form-contact").remove();
                      $(".likeTitle").remove();
                      str += "<div id='form-contact' style='padding-left: 1%'>";
                      str += "<h3><span class='glyphicon glyphicon-ok-circle' style='color: #0E3E59;'>&nbsp;내가 올린 글</span></h3>";
  					  str += "<br/><br/>";
                      str += "<table class='table table-bordered' style='table-layout:fixed;'>";
                      str += "<tr style='background-color: #D1E0EF;'>";
                      str += "<th style='width: 5%; text-align: center;'>No</th>";
                      str += "<th style='width: 10%; text-align: center;'>카테고리</th>";
                      str += "<th style='width: 35%; text-align: center;'>제목</th>";
                      str += "<th style='width: 10%; text-align: center;'>작성자</th>";
                      str += "<th style='width: 20%; text-align: center;''>작성날짜</th>";
                      str += "<th style='text-align:center;'>구매결정</th>";
                      str += "<th>거래인</th>";
                      str += "</tr>";
                      
                      if(result.pageMaker.totalCount == 0){
                          str +="<tr><td colspan='7' style='text-align:center;'> 내가 올린글이 없습니다.</td></tr> ";   
                          $("#formWrapper").append(str);
                          return;
                       }
                      
                      /* alert(result.pageMaker.totalCount+"");//갯수 */
                      
                      $.each(result.MyBoardList, function(i, board) {
                          str += "<tr>";
                          str += "<td style='text-align: center;'>" + board.bNo + "</td>";
                          str += "<td>" + board.cateName + "</td>";
                          str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+"' style='display:block;margin:0 auto; width:auto;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;'>"+ board.bTitle +" </a> </td>";
                          str += "<td style='text-align: center;'>" + board.userId + "</td>";
                          str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
                           if(board.isSwap == 'Y'){
                                  str += "<td style='text-align: center;'><span style='border:1px solid; padding:5px; border-radius:10px;border-color:red;'>거래 완료</span></td>";
                               }else if ( board.buyerId != null ){
                                   str += "<td style='text-align: center;'><button  disabled=true class='btn btn-default testBtn' data-target='#layerpop' data-toggle='modal'>거래중</button></td>";
                                }else{
                                   str += "<td style='text-align: center;'><button class='btn btn-default testBtn' data-target='#layerpop' data-toggle='modal'>거래인 지정</button></td>";
                                }
                                str += "<td style='text-align: center;'><span class='customerId'>"+ ((board.buyerId == null) ? " " : board.buyerId) +"</span></td>";
                          str += "</tr>";
                       });
                       str += "</div>";
                       str += "</table>";
                       
                  var pageMaker=result.pageMaker;//페이징 객체
                       // 페이징 처리
                       str += "<div class='text-center' >" +
                                   "<ul class='pagination'>";
                       if(pageMaker.entireEndPage>1){               
                       str +="<li><a href='javascript:myWritepaging("+1+','+pageMaker.perPageNum+")'>처음</a></li>" ;
                       }
                       if(pageMaker.prev){
                          str +="<li><a href='javascript:myWritepaging("+(parseInt(result.pageMaker.startPage)-1)+','+pageMaker.perPageNum+")'>◀</a></li>" ;
                       }       
                       
                        for(i=pageMaker.startPage; i<=pageMaker.endPage; i++){
                           if(pageMaker.page==i){
                               str += "<li class='active'><a  href='javascript:myWritepaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
                               }else{
                               str += "<li><a  href='javascript:myWritepaging("+i+','+pageMaker.perPageNum+")'>" +i +"</a></li>";
                               }
                            }
                         if(pageMaker.next){
                            str +="<li><a href='javascript:myWritepaging("+(parseInt(result.pageMaker.endPage)+1)+','+pageMaker.perPageNum+")'>▶</a></li>" ;
                           }
                           if(pageMaker.entireEndPage>1){   
                           str +="<li><a href='javascript:myWritepaging("+pageMaker.entireEndPage+','+pageMaker.perPageNum+")'>마지막</a></li>";
                           }
                         str +="</ul>"
                         +"</div>";
                        }
                     
                    $("#formWrapper").append(str);
                      
                   }
               
                }
             );
        }// end of myWritePaging()
        
        $(document).on("click",".testBtn",function(event){
            var bno = $(this).parent().prev().prev().prev().prev().prev().text();
            var userId = $(this).parent().prev().prev().text();
            /* var cateId = $(this).parent().prev().prev().prev().prev().text(); */
            // 클릭했던 곳의 span 태그 객체를 저장
            spanCustomer = $(this).parent().next().find(".customerId");
            // 해당 버튼 객체 저장
            buyerBtn = $(this);
            $("#bnoId").val(bno);
            $("#userIdVal").val(userId);
            
        });
		
        $(document).on("click", "#closeBtn", function(event) {
			$(".determine").val("");
		});

		// 구매 결정 모달창에서 거래할 사람 아이디가 존재하는지 확인하고 있으면 검색처리 진행
		$(".determineBtn").on("click", function(event) {
			var txt = $(".determine").val();
			if(txt == "${loginSession.userId }"){
				alert("자신을 지정할 수 없습니다.");
				txt.focus();
				return;
			}
			if (txt == null || txt == '') {
				alert("사용자를 지정하세요.");
				txt.focus();
				return;
			} else {
				$.ajax({
					type : 'post',
					url : '/mypage/existIdCheck',
					headers : {
						"Content-Type" : "application/json"
					},
					dataType : 'text',
					data : JSON.stringify({
						userId : $("#userIdVal").val(),
						bno : $("#bnoId").val(),
						cateId : $("#cateIdVal").val(),
						buyerId : txt
					}),
					success : function(data) {
						if (data == 'FAIL') {
							alert("존재하지 않는 사용자 입니다. 다시 확인해주세요.");
							$(".determine").focus();
						} else if (data == 'SUCCESS') {
							alert("게시글의 상태가 거래중으로 바꼈습니다.");
							//해당 버튼 비활성화하기
							buyerBtn.prop("disabled", true);
							$("#layerpop").hide();
							$(".determine").val("");
							spanCustomer.html(txt);
						} else if (data == "DUPLICATE") {
							alert("이미 거래중인 고객입니다.");
							$(".determine").focus();
						}
					}
				});
			}
		});

					//5번 거래중인 게시물
					function myExchangeList(){
			           var form = $("#form-contact");
			           $.ajax({
			              type : 'get',
			              headers : {
			                 "Content-Type" : "application/json",
			                 "X-HTTP-Method-Override" : "GET"
			              },
			              url : '/mypage/myExchangeList',
			              dataType : 'json',
			              success : function(data) {
			                 if (data.result == "ok") {
			                    var str = "";
			                    
			                    $("#form-contact").remove();
			                    $(".likeTitle").remove();
			                    str += "<div id='form-contact' style='padding-left: 1%'>";
			                    str += "<h3><span class='glyphicon glyphicon-ok-circle' style='color: #0E3E59;'>&nbsp;거래중인 게시물</span></h3>";
								str += "<br/><br/>";
			                    str += "<table class='table table-hover' style='table-layout:fixed;'>";
			                    str += "<tr style='background-color:#D1E0EF;'>";
			                    str += "<th style='width: 10%; text-align: center;'>글번호</th>";
			                    str += "<th style='width: 15%; text-align: center;'>카테고리</th>";
			                    str += "<th style='width: 30%; text-align: center;'>제목</th>";
			                    str += "<th style='width: 10%; text-align: center;'>작성자</th>";
			                    str += "<th style='width: 15%; text-align: center;''>작성날짜</th>";
			                    str += "<th style='text-align:center;'>구매결정</th>";
			                    str += "<th>거래인</th>";
			                    str += "</tr>";
			                    if( data.pagingDTO.totalRecordCount == 0){
			                       str +="<tr><td colspan='6' style='text-align:center;'> 거래중인 게시글이 없습니다. </td></tr> ";   
			                       $("#formWrapper").append(str);
			                       return;
			                    }
			                    
			                    $.each(data.MyExchangeList, function(i, board) {
			                       str += "<tr>";
			                       str += "<td style='text-align: center;'>" + board.bNo + "</td>";
			                       str += "<td>" + board.cateName + "</td>";
			                       str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+"' style='display:block;margin:0 auto; width:auto;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;'>"+ board.bTitle +" </a> </td>";
			                       str += "<td style='text-align: center;'>" + board.userId + "</td>";
			                       str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
			                       str += "<td style='text-align: center;'>"
			                          	+ 	"<button class='btn btn-default writePost' data-target='#reviewModal' data-toggle='modal'>후기 작성</button></td>";
			                       str += "</tr>";
			                    });
			                    str += "</div>";
			                    str += "</table>";
			                    
			                    // 페이징 처리
			                    str += "<div align = 'center'>" +
			                             "<ul class='pagination pagination-sm'>";
			                             if(data.pagingDTO.groupNo > 1){
			                                str += "<li><a href='javascript:paging("+1+")'>처음</a></li>" 
			                                   + "<li><a href='javascript:paging("+(parseInt(data.pagingDTO.pageStartNo) - 1)+")'>◀</a></li>";
			                             }
			                             for(var i=data.pagingDTO.pageStartNo; i <= data.pagingDTO.pageEndNo; i++){
			                                if(data.pagingDTO.pageNo != i){
			                                   str += "<li><a href='javascript:paging("+i+")'>" +i +"</a></li>";
			                                }else{
			                                   str += "<li><a href='#' style='background-color: #085B86; color: white; font-weight: bold;'>&nbsp;"+ i +"&nbsp;</a></li>";
			                                }
			                                
			                             }
			                             if(data.pagingDTO.groupNo < data.pagingDTO.totalGroupCount){
			                                str += "<li><a href='javascript:paging("+ (parseInt(data.pagingDTO.pageEndNo) + 1) +")'>▶</a></li>"
			                                   + "<li><a href='javascript:paging("+data.pagingDTO.totalPageCount+")'>마지막</a></li>";
			                             }      
			                          str +="</ul>"
			                          +"</div>";
			                    
			                    $("#formWrapper").append(str);
			                 }
			              }
			           });
			        } // end of myExchangeList()
			        
			     // AJAX 페이징 처리하는 함수
					function paging(pageNoVal){
						$.ajax({
							type : 'get',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "GET"
							},
							url : '/mypage/myExchangeList?pageNo='+pageNoVal,
							dataType : 'json',
							success : function(data) {
								if (data.result == "ok") {
									var str = "";
									
									$("#form-contact").remove();
									$(".likeTitle").remove();
									str += "<div id='form-contact' style='padding-left: 1%'>";
									str += "<h3><span class='glyphicon glyphicon-ok-circle' style='color: #0E3E59;'>&nbsp;거래중인 게시물</span></h3>";
									str += "<br/><br/>";
				                    str += "<table class='table table-hover' style='table-layout:fixed;'>";
				                    str += "<tr style='background-color:#D1E0EF;'>";
				                    str += "<th style='width: 10%; text-align: center;'>글번호</th>";
				                    str += "<th style='width: 15%; text-align: center;'>카테고리</th>";
				                    str += "<th style='width: 30%; text-align: center;'>제목</th>";
				                    str += "<th style='width: 10%; text-align: center;'>작성자</th>";
				                    str += "<th style='width: 15%; text-align: center;'>작성날짜</th>";
				                    str += "<th style='text-align:center;'>구매결정</th>";
				                    str += "<th>거래인</th>";
				                    str += "</tr>";
									$.each(data.MyExchangeList, function(i, board) {
										str += "<tr>";
										str += "<td style='text-align: center;'>" + board.bNo + "</td>";
										str += "<td>" + board.cateName + "</td>";
										str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+"' style='display:block;margin:0 auto; width:auto;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;'>"+ board.bTitle +" </a> </td>";
										str += "<td style='text-align: center;'>" + board.userId + "</td>";
										str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
										str += "<td style='text-align: center;'>"
											+ "<button class='btn btn-default writePost' data-target='#reviewModal' data-toggle='modal'>후기 작성</button></td>"
										str += "</tr>";
									});
									str += "</div>";
									str += "</table>";
									
									// 페이징 처리
									str += "<div align = 'center'>" +
												"<ul class='pagination pagination-sm'>";
												if(data.pagingDTO.groupNo > 1){
													str += "<li>" 
														+	"<a href='javascript:paging("+1+")'>처음</a>" 
														+ "</li>" 
														+ "<li>"
														+ 	"<a href='javascript:paging("+(parseInt(data.pagingDTO.pageStartNo) - 1)+")'>◀</a>" 
														+ "</li>";
												}
												for(var i=data.pagingDTO.pageStartNo; i <= data.pagingDTO.pageEndNo; i++){
													if(data.pagingDTO.pageNo != i){
														str += "<li><a href='javascript:paging("+i+")'>" +i +"</a></li>";
													}else{
														str += "<li><a href='#' style='background-color: #085B86; color: white; font-weight: bold;'>&nbsp;"+ i +"&nbsp;</a></li>";
													}
													
												}
												if(data.pagingDTO.groupNo < data.pagingDTO.totalGroupCount){
													str += "<li><a href='javascript:paging("+(parseInt(data.pagingDTO.pageEndNo) + 1) +")'>▶</a></li>"
														+ "<li><a href='javascript:paging("+data.pagingDTO.totalPageCount+")'>마지막</a></li>";
												}		
											str +="</ul>"
											+"</div>";
									
									$("#formWrapper").append(str);
								}
							}
						});
						
						
					}

					// 후기 작성 버튼 눌렀을 때 데이터 저장 처리
					$(document).on("click",".writePost",function(event) {
						var bno = $(this).parent().prev().prev().prev().prev().prev().text();
						var userId = $(this).parent().prev().prev().text();
						var buyerId = "${loginSession.userId }";
						$("#bno").val(bno);
						$("#userId").text(userId);
						$("#buyerId").text(buyerId);

					});

					// 별점 클릭했을 때 동작하는 함수
					$(".star_rating a").click(function() {
						$(this).parent().children("a").removeClass("on");
						$(this).addClass("on").prevAll("a").addClass("on");
						return false;
					});

					var formName = $("#formName");
					// 후기 작성 모달창에서 작성을 누르면 호출되는 이벤트 함수 
					$("#reviewBtn").on("click",function(event){
						var score = $(".star_rating").find(".on").length;
						
						// 후기 내용과 별점 데이터 넘기기
						if($("#pcontent").val().trim() == ""){
							alert("내용을 작성해주세요 :)");
							return false;
						}
						if(score == "0"){
							alert("별점은 1점 이상이어야합니다.");	
							return false;
						}
						
						$.ajax({
							type : 'post',
							url : '/mypage/writeReview',
							contentType : "application/json; charset=UTF-8",
							dataType : 'text',
							data:JSON.stringify({
								bno : $("#bno").val(),
								pcontent : $("#pcontent").val(),
								/* encodeURI(encodeURIComponent()) */	
								pscore : score
							}),
							success : function(result) {
								if(result == "ok"){
									alert("등록되었습니다.");
									$("#reviewModal").hide();
									//$("#a_review").val("수정");
								}else{
									alert("등록 실패");
								}
							}
						});
						
						//초기값으로 세팅해주기
						$("#pcontent").val("");
						$(".star_rating").children("a").removeClass("on");
						// 데이터 리스트 다시 뿌려주기 위해 함수 호출
						myExchangeList();
					});

					$("#cancelBtn").on("click", function(evnet) {
						$("#pcontent").val(""); // 내용 비우기
						$(".star_rating").children("a").removeClass("on"); // 별점 지우기
						history.back(); // 뒤로가기
					}); // end of cancelBtn
					

					function htmlbodyHeightUpdate() {
					    var height3 = $(window).height();
					    var height1 = $('.nav').height() + 50;
					    height2 = $('.container-main').height();
					    if (height2 > height3) {
					        $('html').height(Math.max(height1, height3, height2) + 10);
					        $('body').height(Math.max(height1, height3, height2) + 10);
					       
					    } else
					    {
					        $('html').height(Math.max(height1, height3, height2));
					        $('body').height(Math.max(height1, height3, height2));
					    }

					}
					$(document).ready(function () {
					    htmlbodyHeightUpdate();
					    $(window).resize(function () {
					        htmlbodyHeightUpdate();
					    });
					    
					    $(window).scroll(function () {
					        height2 = $('.container-main').height();
					        htmlbodyHeightUpdate();
					    });
					    
					});
				</script>
			<script type="text/javascript">
				$(document).ready(function () {
					  
					$(window).resize(function() {
					  
					        $checkWidth = $(window).width();

					        if ($checkWidth > 1000) {
					           	$("aside ul").css( "display", "block" );
					        } else {
					            	$("aside ul").css( "display", "none" );
					        }
					});

					  
					  $("aside h3").click(function () {
					    
						      if( $(window).width() < 1000) {   
				     	     $(this).next("ul").slideToggle();
					           
					       } 
					   });
					 });

				</script>
		</div>
	</div>
</body>
</html>