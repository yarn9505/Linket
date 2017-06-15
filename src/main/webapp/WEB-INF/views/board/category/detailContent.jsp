<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${cateDTO.cateName}</title>
<script type="text/javascript" src="/resources/js/fileupload.js"></script>
<%@include file="/WEB-INF/views/note/includeModalCSS.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#modDiv {
   width: 300px;
   height: 150px;
   background-color: #A6A6A6;
   border-radius: 10px;
   position: fixed;
   top: 50%;
   left: 50%;
   margin-top: -30%;
   margin-left: -150px;
   padding: 10px;
   z-index: 1000;
}
/* 구글맵 style 적용 */
#map {
        width: 100%;
        height: 350px;
        background-color: grey;
      }
<<<<<<< HEAD

=======
      
>>>>>>> branch 'master' of https://github.com/yarn9505/Linket.git
/*비밀댓글용*/
input[type=checkbox] {  
    display: none;  
}

input[type=checkbox] + label{
    display: inline-block;  
    cursor: pointer;  
    position: relative;  
    padding-left: 25px;  
    margin-right: 15px;  
    font-size: 13px;
}

input[type=checkbox]+ label:before {     

    content: "";  
    display: inline-block;  
  
    width: 20px;  
    height: 20px;  
  
    margin-right: 10px;  
    position: absolute;  
    left: 0;  
    bottom: 1px;  
    background-color: #ccc;  
    border-radius: 2px; 
    box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
}
input[type=checkbox]:checked + label:before { 

    content: "\2713";  /* 체크모양 */
    text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
    font-size: 18px; 
    font-weight:800; 
    color: #fff;  
    background:#2f87c1;
    text-align: center;  
    line-height: 18px;  

} 
</style>
 <script type="text/javascript">
        //게시글 삭제 버튼 클릭시
         function deleteContent() {
            if (confirm("정말 삭제하시겠습니까?")) {
               location.href = "/board/category/deleteContentProc?bno=${boardDTO.bNo}&cateId=${cateDTO.cateId}&pageNo=${param.pageNo}";
            } else {
               return;
            }
         }
      
         var replyListTotCnt = 0; // 댓글 총 갯수
         var replyStartRow = 0; // ajax로 가져올 댓글의 시작 행 번호
      
         //ready 함수
         $(function() {
      
            //좋아요 체크
            check();
      
            //댓글 리스트 가져와서 뿌려주는 함수
            showNextReplyList();
      
            // 쪽지 쓰기 모달창에 대한 처리
            var formN = $("#formName");
            var Esize = $("#errors.errorSize");
            $("#sendBtn").on("click", function(event) {
               if ($('#recvId').val() == "") {
                  alert("받는 사람 아이디를 입력해주세요.");
                  return false;
               }
      
               if ($('#mtitle').val() == "") {
                  alert("제목을 입력해주세요.");
                  return false;
               }
      
               if ($('#mcontent').val() == "") {
                  alert("내용을 입력해주세요.");
                  return false;
               }
      
               formN.submit();
            }); // end of sendBtn
            $("#cancelBtn").on("click", function(evnet) {
               history.back(); // 뒤로가기
            }); // end of cancelBtn
      
            // 댓글 등록 클릭했을 때
            $("#replyAddBtn").on("click", function() {
               // 입력한 댓글 값들을 가져옴
               //var replyer = $("#newReplyWriter").val();
               var replyer = "${loginSession.userId }";
               var replyText = $("#newReplyContent").val();
               var bno = "${boardDTO.bNo}";
               var secretReply = "N";
      
               if ($("#secretReply").is(":checked")) {
                  secretReply = "Y";
               }
      
               if (replyText.trim() == "") {
                  alert("내용을 작성해주세요.");
                  return;
               }
      
               $.ajax({
                  type : "post",
                  url : "/replies/insertBoardReply",
                  headers : {
                     "Content-Type" : "application/json",
                     "X-HTTP-Method-Override" : "POST"
                  },
                  dataType : "json",
                  data : JSON.stringify({
                     bNo : bno,
                     replyId : replyer,
                     rContent : replyText,
                     isSecret : secretReply
                  }),
                  success : function(data) {
                     console.log(data);
                     console.log(data.result);
                     if (data.result == "ok") {
                        getAllList(); //전체 목록 뿌리기
                     } else {
                        alert("등록 실패");
                     }
                  }
               }); // end of ajax
               // 댓글 초기화
               $("#newReplyWriter").val("");
               $("#newReplyContent").val("");
      
            }); // end of 댓글등록 클릭
      
            // 댓글 옆 수정 버튼
            $("#replyTable").on("click", "#replyDetail", function() {
               //#("#부모id").on("click","그 안의 id",function(event){})
      
               // 자신(this:#replyDetail) 의 앞에 있는 태그(prev)의 속성 값 가져오기
               var rno = $(this).parent().prev().prev().attr("value"); // rNo의 값
               var bno = "${boardDTO.bNo}";
               var replytext = $(this).parent().prev().attr("value"); // rContent의 값
      
               // 댓글 수정 버튼을 클릭했을 때, 수정폼에 해당 정보가 미리 입력되어 있을 수 있도록 세팅.
               $(".modal-title").val(rno);
               $("#replytext").val(replytext);
               $("#modDiv").show("slow");
            }); // end of 댓글등록 클릭
      
            // 댓글 삭제버튼 클릭시 
            $("#replyTable").on("click", "#replyDelBtn", function() {
      
               alert("rrr");
               var rno = $(this).parent().prev().prev().attr("value"); // rNo의 값
               $.ajax({
                  type : 'delete',
                  url : '/replies/' + rno,
                  headers : {
                     "Content-Type" : "application/json",
                     "X-HTTP-Method-Override" : "DELETE"
                  },
                  dataType : "json",
                  success : function(data) {
                     if (data.result == "ok") {
                        alert("삭제되었습니다.");
                        getAllList(); //전체 목록 뿌리기
                     }
                  }
               }); // end of ajax
            });
      
            // 댓글 수정버튼 클릭시
            $("#replyModBtn").on("click", function() {
               var rno = $(".modal-title").val();
               var replytext = $("#replytext").val();
      
               if (replytext.trim() == "") {
                  alert("내용을 작성해주세요.");
                  return;
               }
      
               $.ajax({
                  type : 'put',
                  url : "/replies/" + rno,
                  headers : {
                     "Content-Type" : "application/json",
                     "X-HTTP-Method-Override" : "PUT"
                  },
                  dataType : "json",
                  data : JSON.stringify({
                     rContent : replytext
                  }),
                  success : function(data) {
                     if (data.result == "ok") {
                        alert("수정되었습니다.");
                        $("#modDiv").hide("slow");
                        getAllList(); //전체 목록 뿌리기
                     }
                  }
               });
            }); // end of replyModeBtn
      
            // 댓글 수정 폼 닫기 클릭
            $("#closeBtn").on("click", function() {
               // 폼을 다시 안보이게 해줌
               $("#modDiv").hide("slow");
            })
      
            $("#likeButton").on("click", function(event) {
               update();
            });
      
      
         }); // end of ready
      
         /* 다음 댓글 리스트 표시하는 함수 */
         function showNextReplyList() {
            // 알고 있어야 되는 정보 : 전체 댓글 갯수, 현재 댓글의 startRow
            $.ajax({
               type : "post",
               /* headers:{
                  "Content-Type":"application/json"
               }, */
               url : "/replies/boardReplyAjax",
               data : {
                  bNo : "${param.bno}",
                  startRow : replyStartRow
               },
               dataType : "json",
               success : function(data) {
                  console.log(data);
                  console.log(data.loginUserId);
                  if (data.result == "ok") {
                     // 댓글 리스트 출력
                     $.each(data.replyList, function(i, rDTO) {
                        var str = "";

                        str += "<span style='font-weight:bold;'>" + rDTO.replyId + "</span><br><span style='float:right;'>" + rDTO.rRegDate + "<br></span>";
                        str += "<span>" + rDTO.rContent;
                        str += "<input type='hidden' id='rNo' value='" + rDTO.rNo + "'/>";
                        str += "<input type='hidden' id='rContent' value='" + rDTO.rContent + "'/>";
      
      
                        if (data.loginUserId == rDTO.replyId) {
                           str += "<span style ='font-size:8pt'>";
                           str += "<button type='button' class='btn-link' id='replyDetail'>수정</button>|<button type='button' class='btn-link' id='replyDelBtn'>삭제</button>";
                           str += "</span>";
                        }
      
                        str += "</span><br/><br/>"
      
                        $("#reply").append(str);
                     });
      
                     //더보기 버튼에 대한 처리
                     replyListTotCnt = data.replyTotCnt;
                     replyStartRow += data.replyList.length * 1; //startRow += 5;  ( *1은 String일 경우 강제로 숫자로 계산하기 위함 )
      
                     if (replyListTotCnt > replyStartRow) {
                        // 댓글 더보기 버튼 화면에 표시
                        $("#moreReplyList").show();
      
                     } else {
                        $("#moreReplyList").hide();
                        $("#allReplyList").hide();
                     }
      
                  } else {
                     alert(data.resultMag);
                  }
               },
               error : function(xhr, status, error) {
                  console.log(xhr);
                  alert("error\nxhr : " + xhr + ", status : "
                     + status + ", error : " + error);
               }
            });
         } // end of showNextReplyList()
      
         /**댓글 전체 리스트 보기*/
         function getAllList() {
            $.ajax({
               type : "post",
               url : "/replies/all",
               data : {
                  bNo : "${param.bno}"
               },
               dataType : "json",
               success : function(data) {
                  console.log(data);
                  if (data.result == "ok") {
                     // 댓글 리스트 모두 지우고 다시 출력
                     $("#replyTable").find("span").remove();
                     $("#replyTable").find("br").remove();
      
                     // 댓글 리스트 출력
                     $.each(data.replyAllList, function(i, rDTO) {
                        var str = "";

                        str += "<span style='font-weight:bold;'>" + rDTO.replyId + "</span><br><span style='float:right;'>" + rDTO.rRegDate + "<br></span>";
                        str += "<span>" + rDTO.rContent;
                        str += "<input type='hidden' id='rNo' value='" + rDTO.rNo + "'/>";
                        str += "<input type='hidden' id='rContent' value='" + rDTO.rContent + "'/>";
      
      
                        if (data.loginUserId == rDTO.replyId) {
                           str += "<span style ='font-size:8pt'>";
                           str += "<button type='button' class='btn-link' id='replyDetail'>수정</button>|<button type='button' class='btn-link' id='replyDelBtn'>삭제</button>";
                           str += "</span>";
                        }
      
                        str += "</span><br/><br/>"
      
      
                        $("#reply").append(str);
                     });
      
                     // 모든 댓글 리스트 출력 후 댓글 더보기 버튼 숨기기
                     $("#moreReplyList").hide();
                     $("#allReplyList").hide();
      
                  } else {
                     alert(data.resultMag);
                  }
      
               },
               error : function(xhr, status, error) {
                  console.log(xhr);
                  alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
               }
            });
         } // end of getAllList()
      
         /** 좋아요 체크 */
         function check() {
            var bno = "${boardDTO.bNo}";
            var userId = "${loginSession.userId}";
            $.ajax({
               type : 'get',
               url : '/category/checkFavorite?bno=' + bno + '&userId=' + userId,
               headers : {
                  "Content-Type" : "application/json",
                  "X-HTTP-Method-Override" : "GET"
               },
               dataType : 'text',
               success : function(result) {
      
                  if (result == "SUCCESS") {
                     $("#likeImage").attr("src", "/resources/images/like2.png");
                     count();
                  }
                  if (result == "FAIL") {
                     $("#likeImage").attr("src", "/resources/images/like1.png");
                     count();
                  }
               }
            });
         } // end of check()
      
         /** 좋아요 업데이트 */
         function update() {
            var bno = "${boardDTO.bNo}";
            var userId = "${loginSession.userId}";
            $.ajax({
               type : 'get',
               headers : {
                  "Content-Type" : "application/json",
                  "X-HTTP-Method-Override" : "GET"
               },
               url : '/category/handlingFavorite?bno=' + bno + '&userId=' + userId,
               dataType : 'text',
               success : function(data) {
                  /* if(result == "notLogin"){
                                           alert("로그인 후 이용하세요 :)");
                                          return;
                                         } */
      
                  check();
      
                  if (data == "안뇽") {
                     console.log("찍히나용?");
                  }
               }
            }); // end of ajax from likeBoard Btn Click
      
         } // end of update()
      
         /* 좋아요 갯수 세기 */
         function count() {
            var bno = "${boardDTO.bNo}";
            $.ajax({
               type : 'get',
               headers : {
                  "Content-Type" : "application/json",
                  "X-HTTP-Method-Override" : "GET"
               },
               url : '/category/countFavorite?bno=' + bno,
               dataType : 'text',
               success : function(data) {
                  //data-->likeCount
                  $("#likeCount").text(data);
               }
            }); // end of ajax from likeBoard Btn Clicks
         }

</script>
</head>
<body>

   <div class="container">
      <div class="row">
         <div class="col-md-10 col-md-offset-1">
            <h3>
               <span class="glyphicon glyphicon-list-alt" style="color: #0E3E59;">&nbsp;${cateDTO.cateName} 게시글 상세보기</span>
            </h3>
            <br> <br>
            <table class="table table-bordered">
               <tr>
                  <th style="width: 15%; background: #E9EFF5; text-align: center;">카테고리</th>
                  <td>${cateDTO.cateName}<input type="hidden" name="bCategory"
                     value="${boardDTO.cateId}" /></td>
                  <th style="width: 15%; background: #E9EFF5; text-align: center;">조회수</th>
                  <td>${boardDTO.viewCnt }</td>
               </tr>
               <tr>
                  <th style="width: 15%; background: #E9EFF5; text-align: center;">작성일</th>
                  <td>${boardDTO.bRegDate }</td>
                  <th style="width: 15%; background: #E9EFF5; text-align: center;">수정일</th>
                  <td>${boardDTO.bModifyDate }</td>
               </tr>
               <tr>
                  <th style="width: 15%; background: #E9EFF5; text-align: center;">작성자</th>
                  <td>${boardDTO.userId}
                  <!-- 쪽지쓰기 모달창 띄우기 -->
                     &nbsp;&nbsp;&nbsp; 
                      <button type="button" class="btn btn-link" data-toggle="modal" data-target="#login_form">
                      	 <span class="glyphicon glyphicon-envelope" aria-hidden="true">&nbsp;쪽지쓰기&nbsp;</span>
                      </button>
                  </td>
                  <th style="width: 15%; background: #E9EFF5; text-align: center; color: #0E3E59">상품가치</th>
                  <td colspan="3">${boardDTO.value}원</td>
               </tr>
               <tr>
                  <th style="width: 15%; background: #E9EFF5; text-align: center;">제목</th>
                  <td colspan="3">${boardDTO.bTitle}</td>
               </tr>
            </table>
            
            <br/><br/>
            
            <div align = "right">
               <c:forEach var="baList" items="${baList}">
                  <c:if test="${baList.attachType == '1'}">
                  <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                     <a href="${baList.fileName}" target="_blank">${baList.originName}</a>
                  </c:if>
               </c:forEach>
            </div>
            
            
            <span style="height: 500px;border: 1px solid #BDBDBD;overflow-x:hidden; overflow-y:scroll;" class="form-control"> 
               ${boardDTO.bContent}
        	 </span>
         
            <br/>
            <div align="right">

               <c:if test="${loginSession.userId != null }">
                  <button id="likeButton" type="button" class="btn btn-default">
                     <img id="likeImage" src="" style="width: 10px; height: 10px;" />
                     <span id="likeCount"></span>
                  </button>
               </c:if>
               <c:if test="${loginSession.userId == boardDTO.userId }">
                  <button type="button" class="btn btn-default"
                     onclick="location.href='/board/category/updateContentForm?bNo=${boardDTO.bNo}&pageNo=${param.pageNo }'">수정</button>

                  <button type="button" class="btn btn-default" onclick="deleteContent()">삭제</button>

               </c:if>

               <button type="button" class="btn btn-default" onclick="location.href='/board/category/boardList?cateId=${cateDTO.cateId}&pageNo=${param.pageNo == null ? 1 : param.pageNo}'">목록</button>
            </div>
            <br /> <br />

             <!-- 쪽지 쓰기  Modal -->
				<div class="modal fade" id="login_form" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"></button>
								<h3 class="glyphicon glyphicon-envelope" style="color: #0E3E59;" align="center">&nbsp;쪽지 쓰기</h3>
							</div>
							<div class="modal-body">
								<form id="formName" action="/note/insertNote" method="post">
									<h5 align="right" style="color: navy;">from: ${loginSession.userId}</h5>
									<table class="table-bordered" style="width: 100%;">
										<tr>
											<th style="text-align: center; background-color: #D1E0EF;height: 40px;">받는 사람</th>
											<td>&nbsp;&nbsp;${boardDTO.userId} 
											<input type="hidden" class="form-control" name="recvId" id="recvId"
												value="${boardDTO.userId}" />
											</td>
										</tr>

										<tr>
											<th style="text-align: center; background-color: #D1E0EF">제목</th>
											<td><input type="text" class="form-control" name="mtitle" id="mtitle" value="${NoteVO.mtitle}" /></td>
										</tr>

										<tr>
											<th style="text-align: center; background-color: #D1E0EF">내용</th>
											<td><textarea style="resize: none; height: 150px; vertical-align: middle;"
													name="mcontent" id="mcontent" class="form-control">${NoteVO.mcontent}</textarea></td>
										</tr>
									</table>
									<br/>
									<div align = "right">
										<button id="cancelBtn" type="button" class="btn btn-default">취소</button>
										<button id="sendBtn" type="button" class="btn btn-default">보내기</button>
									</div>
									<br/>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- GoogleMap API 연동(황영롱) -->
            <h4>
               <span class="glyphicon glyphicon-map-marker" style="color: #0E3E59;">&nbsp;작성자 위치</span>
            </h4>
            <div id="map"></div>
            
            <!-- 지도가 붙을 위치 -->
            <br /> <br />

            <!--------------------------- 댓글 리스트 ---------------------------------->
            <div class="panel panel-default">
                   <div class="panel-body">
                  <div id="reply"> </div>
               </div>
            </div>
            
               <table align="right">
                  <tr>
                     <td>
                        <button type="button" id="moreReplyList" class="btn btn-link" onclick="showNextReplyList()">더보기</button> &nbsp;&nbsp;
                        <button type="button" id="allReplyList" class="btn btn-link" onclick="getAllList()">전체보기</button>
                     </td>
                  </tr>
               </table>
            
            <table width="100%;">
               <tr>
                  <th style="width: 10%; text-align: center; " rowspan="2"> ${loginSession.userId } 
                  <input style="width: 100%; border: 0;" type="hidden" name="replyId" value="${loginSession.userId }" id="newReplyWriter" />
                  </th>
                  <td><textarea class="form-control" name="rContent" id="newReplyContent" style="resize: none; height: 4%; width: 100%;"></textarea></td>
                  <td style="width: 10%" rowspan="2">&nbsp;&nbsp;
                     <button style="font-size: 12pt;" class="btn btn-primary btn-lg" id="replyAddBtn" >입력</button>
                  </td>
               </tr>
               
               <tr>
               <td style="float:right; margin-top:8px;" ><input type="checkbox" id="secretReply" class="checkbox-style"  /><label for="secretReply">비밀댓글</label><td>
               </tr>
            </table>

            <br />

            <!--------------- 댓글 수정 폼 ---------------------->
            <div id="modDiv" style="display: none;">
               <div style="float: center; color: white;">댓글수정</div>
               <input type="hidden" class="modal-title" />
               <div>
                  <br> <input type="text" style="width: 100%" id="replytext" class="form-control" /><br />
               </div>
               <div align="center">
                  <button type="button" id="closeBtn" class="btn btn-default btn-sm">닫기</button>
                  <button type="button" id="replyModBtn" class="btn btn-default btn-sm">수정</button>
                  <br />
            </div>
         </div>
      </div>
   </div>
</div>
<script>

  var address = null;
  function getAddr(){
     $.ajax({
       type:'post',
       headers:{
          "Content-Type":"application/json"
       },
       async : false, // ajax를 동기화(순서대로) 처리해야하는 경우 true로하거나 기술하지 않으면 비동기로 작동한다.
       url:"/board/category/getAddr?userId=${boardDTO.userId}",
       dataType:"text",
       success : function(result){
          if ( result != null ){
             console.log("넘어온 값 : " + result);
           address = result;   
          }
       }
    });
  };
  
  function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수
     getAddr();
   var latVal = ${boardDTO.lat}; // 게시글 DTO에서 위도값을 가져옴
   var lngVal = ${boardDTO.lon}; // 게시글 DTO에서 경도값을 가져옴
    var mapLocation = {lat: latVal, lng: lngVal}; // 위도, 경도를 가지는 객체를 생성
    var mapOptions = {
            center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
            zoom: 18, // 지도 zoom단계
            mapTypeId: google.maps.MapTypeId.ROADMAP
          };
          var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
              mapOptions);
           
          var size_x = 60; // 마커로 사용할 이미지의 가로 크기
          var size_y = 60; // 마커로 사용할 이미지의 세로 크기
           
          // 마커로 사용할 이미지 주소
          var image = new google.maps.MarkerImage( 'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
                              new google.maps.Size(size_x, size_y),
                              '',
                              '',
                              new google.maps.Size(size_x, size_y));
           
          var marker;
          marker = new google.maps.Marker({
                 position: mapLocation, // 마커가 위치할 위도와 경도(변수)
                 map: map,
                 icon: image, // 마커로 사용할 이미지(변수)
                 title: "${boardDTO.userId}(님) 의 거래 희망 위치" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
          });
           
          var content = "${boardDTO.userId} 님은 "+address+" 근처에서 거래를 희망합니다."; // 말풍선 안에 들어갈 내용
           
          // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
          var infowindow = new google.maps.InfoWindow({ content: content});
   
          google.maps.event.addListener(marker, "click", function() {
              infowindow.open(map,marker);
          });
  }
      </script>
     <script async defer
             src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1I06mbe3rTV903iEx-aOyO4MFTnaDEvw&callback=initMap">
     </script>
</body>
</html>