<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>http://www.blueb.co.kr</title>

<link rel="stylesheet" type="text/css" href="/resources/css/styleMatching.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/left-sidebar.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/matching.css" />
<script type="text/javascript" src="/resources/jquery-3.2.1.min.js"></script>

<style type="text/css">
body {background: #F9F9F9;}
#Dash {min-height: 500px;background: white;border: 1px solid #EEEEEE;margin: 20px;margin-top: 0;}
div.BoxTitle-title span.sub-title {display: inline;margin: 0;font-size: 11px;color: #888888;}

#example1,#example2 li {margin:0;padding:5px 0;list-style:none;font-family:돋움;font-size:11px;}
#screen-about{
width:100%;
}
</style>

<script type="text/javascript" src="/resources/js/jquery-1.4.3.min.js"></script>
 
<script type="text/javascript">
   $(document).ready(function(){
      $("#Dash").Dashboard({ columns:3 });
   });
</script>
  
<style>
   .rollOver{
      opacity:0.7;
   }
   .rollOver:hover{
      opacity:1;
      border:1px solid #8C8C8C;
   }
   button:hover{
      background:#ED0000;
   }
   ::-webkit-scrollbar {
      display:none;
   }
   
   /* 스위치 */
   /* Switch button */
   .btn-default.btn-on.active{background-color: #5BB75B;color: white;}
   .btn-default.btn-off.active{background-color: #DA4F49;color: white;}
   
   .btn-default.btn-on-1.active{background-color: #006FFC;color: white;}
   .btn-default.btn-off-1.active{background-color: #DA4F49;color: white;}
   
   .btn-default.btn-on-2.active{background-color: #00D590;color: white;}
   .btn-default.btn-off-2.active{background-color: #A7A7A7;color: white;}
   
   .btn-default.btn-on-3.active{color: #5BB75B;font-weight:bolder;}
   .btn-default.btn-off-3.active{color: #DA4F49;font-weight:bolder;}
   
   .btn-default.btn-on-4.active{background-color: #006FFC;color: #5BB75B;}
   .btn-default.btn-off-4.active{background-color: #DA4F49;color: #DA4F49;}
   
   /* 비교하기 누르면 나오는 모달창의 css */
   .modal-content.modal-fullsize {
	  height: auto;
	  min-height: 80%;
	  border-radius: 0; 
	}
	.modal-dialog.modal-fullsize { width: 100%; height: 80%; margin: 0; padding: 0; }
	
	
	/* 비교하기 누르면 나오는 모달창의 css안의 내용 */
	.hero-widget { text-align: center; padding-top: 20px; padding-bottom: 20px; }
	.hero-widget .icon { display: block; font-size: 96px; line-height: 96px; margin-bottom: 10px; text-align: center; }
	.hero-widget var { display: block; height: 64px; font-size: 64px; line-height: 64px; font-style: normal; }
	.hero-widget label { font-size: 17px; }
	.hero-widget .options { margin-top: 10px; }
	
</style>



</head>

<body>

     <!-- 비교하기 누르면 나타나는 모달창 -->
                <!-- 화면 꽉찬 modal -->
            <!-- Fullsize Modal -->
            <div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel">
              <div class="modal-dialog modal-fullsize" role="document">
                <div class="modal-content modal-fullsize">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">전지 Modal</h4>
                  </div>
                  <div class="modal-body" style="height: 500px;">
                     <!--  -->
                     <div class="container" >
                  <div class="row" style="padding-left:300px;">
                     <div class="col-sm-5" style="margin :0 auto;">
                           <div class="hero-widget well well-sm" style='height:318px;'>
                               <div class='col-sm-4' style='margin-left:20px;'>
                                  <div class="icon">
                                       <i>
                                         <img src = "/resources/images/circleuser.png" style="width:90px;height:90px;"></img>
                                       </i>
                                  </div>
                                  <div class="text">
                                      <div id="sellerRankId"><h1>My Post</h1 ></div>
                                      <div id="sellerDateId">등록일</div>
                                      <label class="text-muted"></label>
                                  </div>
                               </div>
                           <div class='col-sm-7' style='background-color:white;float:right;height:270px;margin-left:-10px;border-radius:5px;padding:0px;'>
                                 <div class="panel panel-default" style='width:100%;height:100%;'>
                                <!-- Default panel contents -->
                                <div class="panel-heading"><b>내가 올린 게시글 정보</b></div>
                                <div class="panel-body">
                                  <img src="/resources/images/messageImg.png" style='width:50px;height:50px;float:left;'/><p id='myTitleId' style='font-weight:bold;'>글제목</p>
                                </div>
                              
                                <!-- Table Seller Information-->
                                <table class="table" style='width:100%;'>
                                  <tr>
                                     <td>판매금액</td>
                                     <td id="sellerValueId">가격</td>
                                  </tr>
                                  <tr>
                                     <td>주소</td>
                                     <td id="sellerAddrId">내주소</td>
                                  </tr>
                                </table>
                              </div>
                              </div>                                
                          </div>
                           
                     </div>
                       <div id="1Container"  class="col-sm-5" style="margin :0 auto;">
                           <div class="hero-widget well well-sm" style='height:318px;'>
                               <div class='col-sm-4' style='margin-left:20px;'>
                                  <div class="icon">
                                       <i>
                                         <img src = "/resources/images/circlestar.png" style="margin-top : -16px;"></img>
                                       </i>
                                  </div>
                                  <div class="text">
                                      <div style="margin-top : -18px;"><var id="1UserId">614</var></div>
                                      <label class="text-muted">★추천합니다!★</label>
                                  </div>
                                  <div class="options" style='margin-left:-20px;'>
									<button id="1MapId">위치 보기</button>
                                  </div>
                               </div>
                           <div class='col-sm-7' style='background-color:white;float:right;height:270px;margin-left:-10px;border-radius:5px;padding:0px;'>
                                 <div class="panel panel-default" style='width:100%;height:100%;'>
                                <!-- Default panel contents -->
                                <div class="panel-heading">제시 사항</div>
                                <div class="panel-body">
                                  <img src="/resources/images/messageImg.png" style='width:50px;height:50px;float:left;'/><p id="1TitleId">추천제목</p>
                                </div>
                              
                                <!-- Table -->
                                <table class="table" style='width:100%;'>
                                  <tr>
                                     <td>가치</td>
                                     <td id="1ValueId">가치</td>
                                  </tr>
                                  <tr>
                                     <td>거리</td>
                                     <td id="1DistanceId">거리</td>
                                     <!-- mno정보값 가지고 있게... 최종 클릭시 반영될 수 있도록... -->
                                     <input id="1MnoId" type="hidden" style="display:none;"/>
                                  </tr>
                                </table>
                              </div>
                              </div>                                
                          </div>
                           
                     </div>
                  </div>
               </div>
                     
							
							<!--  -->
		               
				      </div>
				     
				     <!-- footer -->
				      <div class="modal-footer" style='clear:both:clear;display:block;'>
		                <div class="row" style="padding-left:300px;margin-left:-200px;">
		                     <div class="col-sm-3" style="margin :0 auto; display:none;" id = "2Container">
		                           <div class="hero-widget well well-sm" style='height:318px;'>
		                               <div class='col-sm-4' style='margin-left:20px;'>
		                                  <div class="icon">
		                                       <i>
		                                         <img src = "/resources/images/circleuser.png" style="width:90px;height:90px;"></img>
		                                       </i>
		                                  </div>
		                                  <div class="text">
		                                      <div><var id="2UserId">614</var></div>
		                                      <label class="text-muted">2th Recommandation</label>
		                                  </div>
		                                  <div class="options" style='margin-left:-20px;'>
											<button id="2MapId">위치 보기</button>
		                                  </div>
		                               </div>
		                           <div class='col-sm-7' style='background-color:white;float:right;height:270px;margin-left:-10px;border-radius:5px;padding:0px;'>
		                                 <div class="panel panel-default" style='width:100%;height:100%;'>
		                                <!-- Default panel contents -->
		                                <div class="panel-heading">제시 사항</div>
		                                <div class="panel-body">
		                                  <img src="/resources/images/messageImg.png" style='width:50px;height:50px;float:left;'/><p id="2TitleId">제목</p>
		                                </div>
		                              
		                                <!-- Table -->
		                                <table class="table" style='width:100%;'>
		                                  <tr>
		                                     <td>가치</td>
		                                     <td id="2ValueId">가치</td>
		                                  </tr>
		                                  <tr>
		                                     <td>거리</td>
		                                     <td id="2DistanceId">거리</td>
		                                  	<input type="hidden" id="2MnoId" style="display:none;" />
		                                  </tr>
		                                </table>
		                              </div>
		                              </div>                                
		                          </div>
		                           
		                     </div>
		                       <div class="col-sm-5" style="margin :0 auto; display:none;" id = "3Container">
		                           <div class="hero-widget well well-sm" style='height:318px;'>
		                               <div class='col-sm-4' style='margin-left:20px;'>
		                                  <div class="icon">
		                                       <i>
		                                         <img src = "/resources/images/circlestar.png" style="margin-top : -16px;"></img>
		                                       </i>
		                                  </div>
		                                  <div class="text">
		                                      <div style="margin-top : -18px;"><var id="3UserId">614</var></div>
		                                      <label class="text-muted">3th Recommandation</label>
		                                  </div>
		                                  <div class="options" style='margin-left:-20px;'>
											<button id="3MapId">위치 보기</button>
		                                  </div>
		                               </div>
		                           <div class='col-sm-7' style='background-color:white;float:right;height:270px;margin-left:-10px;border-radius:5px;padding:0px;'>
		                                 <div class="panel panel-default" style='width:100%;height:100%;'>
		                                <!-- Default panel contents -->
		                                <div class="panel-heading">제시 사항</div>
		                                <div class="panel-body">
		                                  <img src="/resources/images/messageImg.png" style='width:50px;height:50px;float:left;'/><p id="3TitleId">제목</p>
		                                </div>
		                              
		                                <!-- Table -->
		                                <table class="table" style='width:100%;'>
		                                  <tr>
		                                     <td>가치</td>
		                                     <td id="3ValueId">가치</td>
		                                  </tr>
		                                  <tr>
		                                     <td>거리</td>
		                                     <td id="3DistanceId">거리</td>
		                                  	 <input type="hidden" id="3MnoId" style="display:none;" />
		                                  </tr>
		                                </table>
		                              </div>
		                              </div>                                
		                          </div>
		                           
		                     </div>
		                     <div class="col-sm-3" style="margin :0 auto; display:none; " id = "4Container">
		                           <div class="hero-widget well well-sm" style='height:318px;'>
		                               <div class='col-sm-4' style='margin-left:20px;'>
		                                  <div class="icon">
		                                       <i>
		                                         <img src = "/resources/images/circlestar.png" style="margin-top : -16px;"></img>
		                                       </i>
		                                  </div>
		                                  <div class="text">
		                                      <div style="margin-top : -18px;"><var id="4UserId">614</var></div>
		                                      <label class="text-muted">4th Recommandation</label>
		                                  </div>
		                                  <div class="options" style='margin-left:-20px;'>
		                                 	<button id="4MapId">위치 보기</button>
		                                  </div>
		                               </div>
		                           <div class='col-sm-7' style='background-color:white;float:right;height:270px;margin-left:-10px;border-radius:5px;padding:0px;'>
		                                 <div class="panel panel-default" style='width:100%;height:100%;'>
		                                <!-- Default panel contents -->
		                                <div class="panel-heading">제시 사항</div>
		                                <div class="panel-body">
		                                  <img src="/resources/images/messageImg.png" style='width:50px;height:50px;float:left;'/><p id="4TitleId">제목</p>
		                                </div>
		                              
		                                <!-- Table -->
		                                <table class="table" style='width:100%;'>
		                                  <tr>
		                                     <td>가치</td>
		                                     <td id="4ValueId">가치</td>
		                                  </tr>
		                                  <tr>
		                                     <td>거리</td>
		                                     <td id="4DistanceId">거리</td>
		                                  	 <input type="hidden" id="4MnoId" style="display:none;"/>
		                                  </tr>
		                                </table>
		                              </div>
		                              </div>                                
		                          </div>
		                           
		                     </div>
		                  </div>                       
		                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		                  </div>
				     <!-- end of footer -->
				    </div>
				  </div>
				</div>  
				                        
               <!-- 클릭한 게시글 상세 보여주기 모달창 -->
               <!-- Modal -->
               <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                 <div class="modal-dialog">
                   <div class="modal-content">
                     <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                       <h4 id="modalTitle" class="modal-title" id="myModalLabel">Modal title</h4>
                     </div>
                     <div class="modal-body">
                      <%@include file="./modalImport.jsp" %>
                     <!-- 게시글 번호(hidden) -->
                     <input type="hidden" id="modalBno"/>                        
                        <input type="hidden" id="modalUserId" />
                        <input type="hidden" id="latId" />
                        <input type="hidden" id="lonId" />
                     </div>
                     <div class="modal-footer">
                     
                        <div class="row">
                        <!-- 가치, 주소  -->
                       <div class="col-lg-6">
                         <div class="input-group">
                           <span class="input-group-addon">가치 </span>
                           <input id="wantedValue" type="text" class="form-control" aria-label="..." placeholder="거래하고 싶은 금액 혹은 교환품목의 상응가액을 입력하세요">
                         </div><!-- end of 가치  -->
                       </div>
                       <!-- 거래희망지 -->
                       <div class="col-lg-6">
                         <div class="input-group">
                           <span class="input-group-addon">거래 희망지</span>
                           <input id="wantedArea" type="text" class="form-control" aria-label="..." readonly="readonly">
                         </div><!-- 거래희망지 -->
                       </div><!-- /.col-lg-6 -->
                     </div><!-- /.row -->
                        <!-- 가치, 주소 -->
                     <textarea class="form-control" rows="3" id="requestMsg"></textarea>
                       <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                       <button type="button" class="btn btn-primary" id="sendContent">요청하기</button>
                     </div>
                   </div>
                 </div>
               </div>
               <!-- END OF 모달 -->                 
                        
                        
                   <div id="Dash">
                  <div class="BoxContents" style="overflow:scroll;max-height:600px;-ms-overflow-style: none;">
                     <h1 class="BoxTitle" style='background-color:#D1E0EF;'>검색한 글</h1>
                     <div  class="BoxBody">
                        <ol id="keywordListOl">
                           <!-- keyword 검색한 것이 출력... -->
                        </ol>
                     </div>
                  </div>
               
                  <div class="BoxContents" style="overflow:scroll;max-height:600px;-ms-overflow-style: none;">
                     <h1 class="BoxTitle" style='background-color:#D1E0EF;'>요청받은 게시글</h1>
                     <div class="BoxBody">
                        <div  class="BoxBody">
                        <ol id="receiveShow">
                        
                        </ol>
                     </div>
                     </div>
                  </div>   
                  <!--  -->
                  
                  <div class="BoxContents" style="overflow:scroll;max-height:600px;-ms-overflow-style: none;">
                    <h1 class="BoxTitle" style='background-color:#D1E0EF;'><b>게시판별 요청받은 게시글</b>
               
               <!-- 비교하기 버튼 -->   
                <button id='compareBtn' style='border-radius: 5px;margin-left:10px;' data-toggle="modal" data-target="#myFullsizeModal">비교하기</button>                  
                     <!-- 스위치 -->
                     <div class="btn-group" id="status" data-toggle="buttons" style='float:right;'>
                    <label class="btn btn-default btn-on btn-xs active" id="checkedPrice" >
                    <input type="radio" value="1" name="multifeatured_module[module_id][status]" checked="checked">가격</label>
                    <label class="btn btn-default btn-off btn-xs " id="checkedDistance">
                    <input type="radio" value="0" name="multifeatured_module[module_id][status]">거리</label>
                  </div>
                     
                     </h1>
                     <div class="BoxBody">
                     <!-- 여기 안에 내용 -->
                        <ol id="listMatchContent">
                        
                        </ol>
                       <!-- 여기 위에 내용 -->
                     </div>
                  </div>
               
               
                  <div class="BoxContents" style="overflow:scroll;max-height:600px;-ms-overflow-style: none;">
                     <h1 class="BoxTitle" style='background-color:#D1E0EF;'>콘텐츠 박스</h1>
                     <div class="BoxBody">
                        이곳에 내용 작성
                     </div>
                  </div>
                  
                  <div class="BoxContents" style="overflow:scroll;max-height:600px;-ms-overflow-style: none;">
                     <h1 class="BoxTitle" style='background-color:#D1E0EF;'>
                        서브 버튼은 이렇게
                        <div class="BoxToolbar">
                           <button>버튼 1</button>
                           <button>버튼 2</button>
                           <button>버튼 3</button>
                           <button>버튼 4</button>
                        </div>
                     </h1>
                     <div class="BoxBody">
                        서브버튼등을 배치하여 탭메뉴 형식으로 만들수도 있겠죠..
                     </div>
                  </div>
                  
                  <div class="BoxContents" style="overflow:scroll;max-height:600px;-ms-overflow-style: none;">
                     <h1 class="BoxTitle" style='background-color:#D1E0EF;'>타이틀</h1>
                     <div class="BoxBody">
                     내용
                     </div>
                  </div>
               
                  <div class="BoxContents" style="overflow:scroll;max-height:600px;-ms-overflow-style: none;">
                     <h1 class="BoxTitle" style='background-color:#D1E0EF;'>게시판 최근글</h1>
                     <div class="BoxBody">
                     내용
                     </div>
                  </div>
                  
                  <div class="BoxContents" style="overflow:scroll;max-height:600px;-ms-overflow-style: none;">
                     <h1 class="BoxTitle" style='background-color:#D1E0EF;'>구매 희망 품목 설정창</h1>
                     <div class="BoxBody">
                        <p><b>구매를 희망하는 상품명을 등록하세요.</b></p>
                        <table cellpadding="5" cellspacing="0">
                           <tr>
                              <td valign="top"><label style="margin-right:10px;">상품명</label></td>
                              <td colspan="2"><input id="keywordId" type="text" name="productKeywords"/></td>
                              <td align="right"><button id="listBtn" style="margin-left:5px;">등록</button></td>
                           </tr>
                        </table>
                     </div>
                  </div>
                  <script type="text/javascript">
                     $(document).ready(function(){
                        
                        //button : 저기서 bno받아오는애...
                        var button ; 
                        // 요청받은 목록 띄우기
                        function receiveList(){
                           var str = "";
                           $.getJSON("/matching/receiveList",function(data){
                              $(data).each(function(){
                                 str += "<div class='panel panel-default rollOver' style='height:50px;'>"
                                          +"<div class='panel-body'>"
                                             +"No.<p class='bnoP' style='display:inline;'>"+this.bno+"</p>" 
                                             +"글제목 : <p class='btitleP' style='display:inline;'>"+this.btitle+"</p>" 
                                             +"가치 : <p class='valueP' style='display:inline;'>"+this.value+"</p>" 
                                             +"평균 요청가격 : <p class='avgValueP' style='display:inline;'>"+this.avgValue+"</p>원" 
                                             +"<span class='badge badge-danger' style='float:right;background-color:#ED0000;'>"+this.bnoNum+"</span>"
                                          +"</div>"
                                    +  "</div>";
                              });
                              $("#receiveShow").append(str);
                           });
                        }// end of receiveList()
                        // 요청받은 목록 함수 호출...
                        receiveList();
                        
                        //가격별 스위치 클릭되었을때 호출
                        $("#checkedPrice").on("click",function(){
                           listMatchContent(button, "price");
                        });
                        
                        //거리별 스위치 클릭되었을때 호출
                        $("#checkedDistance").on("click",function(){
                           listMatchContent(button, "distance");
                        });
                        
                        
                        /* 세부요청게시글 */
                        function listMatchContent(button, condi){
                              var parent = button;
                                    var bnoP = parent.find(".bnoP").text();
                                    var condi;
                                    if(condi == "distance"){
                                 condi = "distance";                                       
                                    }else{
                                       condi = "price";
                                    }
                                    console.log("bnoP : "+bnoP);
                                    $("#listMatchContent").empty();
                                    var str3="";
                                    
                                    $.ajax({
                                    type:'POST',
                                    url:"/matching/listMatchContent",
                                    headers:{
                                 "Content-Type":"application/json"
                              },
                              dataType:'json',
                              data:JSON.stringify({
                                 bno : bnoP,
                                 condi : condi
                              }),
                              success:function(list){
                                 
                                 $(list).each(function(index){
                                    str3 += "<div id='indexContent"+index+"' class='panel-group' id='accordion' role='tablist' aria-multiselectable='true'>"
                                       +"<div class='panel panel-default'>"
                                       +"<div class='panel-heading' role='tab' id='headingOne'>"
                                       +"<h4 class='panel-title'>"
                                             +"<input id='"+index+"' type='checkbox' name='checkCompareName' class='checkCompare' value='"+this.mno+"'/>"
                                          +"<span style='width:100px;float:right;margin-left:5px;'>"+this.wantedValue+"원</span>"
                                          +"<div style='width:140px;float:right;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;'>"+this.addr1+"</div>"
                                          +"<a data-toggle='collapse' data-parent='#accordion' href='#collapseOne"+index+"' aria-expanded='true' aria-controls='collapseOne' style='text-decoration:none;color:black;'>"
                                          +"<p style='width:200px;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;margin-top:-20px;'>"+this.requestMsg+"</p>"
                                          +"<img class='imgVictory' src='' width='20px' height='20px' style='border:0px;display:inline;float:right;margin-top:-28px;display:none;'/>"
                                          
                                          +"</a>"
                                       +"</h4>"
                                       +"</div>"
                                                +"<div id='collapseOne"+index+"' class='panel-collapse collapse in' role='tabpanel' aria-labelledby='headingOne'>"
                                                +"<div class='panel-body'>"+this.requestMsg+"</div>"
                                                +"</div>"
                                                +"</div>"
                                                +"</div>";

                                 });//each
                                 $("#listMatchContent").append(str3);
                                 // 추천하는 요청사항의 속성을 변경하는 부분
                              $("#indexContent0").attr("style","border:5px solid yellow;");
                                var i = $("#indexContent0").find(".imgVictory").attr("src","/resources/images/victory.png");
                                $("#indexContent0").find(".imgVictory").attr("style","border:0px;display:inline;float:right;margin-top:-28px;");
                              },
                              error:function(){
                                 console.log("실패");
                              }
                              
                             });//ajax 
                        }//end of listMatchContent()
                        
                        
                        // 비교하기 버튼을 클릭했을 때
                        $("#compareBtn").on("click",function(event){
                            // check된 것 저장할 배열
                              var checkObj=[];
                           jQuery.ajaxSettings.traditional = true;
	                     $("input:checkbox[name='checkCompareName']:checked").each(function(index){
	                        // 배열을 넘기기 위한 세팅.
	                        checkObj.push($(this).val());
	                     });
	                     if(checkObj.length<2){
	                    	 alert("2개 이상의 항목을 체크해주세요");
	                    	 $("#compareBtn").attr("data-target","");
	                    	 return ;
	                     }
	                     else if(checkObj.length>4){
	                    	alert("비교항목은 최대 4개까지 가능합니다");
	                    	$("#compareBtn").attr("data-target","");
	                    	return ;
	                     }
	                     else{
	                    	 $("#compareBtn").attr("data-target","#myFullsizeModal");
		                     var allData = {"sendData":checkObj};
		                     console.log("checkObj : "+ checkObj);
		                     $.ajax({
		                        type:'POST',
		                        data:allData,
		                        url:"/matching/compareMatching",
		                        dataType:"json",
		                        success:function(data){
		                        	
		                        	console.log(data);
		                        	console.log("check");
									// 게시글 등록일
		                        	$("#sellerDateId").text(data.myboard.bregdate);
		                        	// 제목
		                        	$("#myTitleId").text(data.myboard.btitle);
		                        	// 판매금액
		                        	$("#sellerValueId").text(data.myboard.value+"원");
		                        	// 주소
		                        	$("#sellerAddrId").text(data.myboard.addr1);
		                        	
		                        	// 요청 올린 사람들 데이터 바인딩...
		                        	
		                        	// 요청자 바인딩
		                        	for(var i=1; i<=data.list.length; i++){
		                        		$("#"+(i)+"Container").attr("style","margin :0 auto; display:block;");
		                        		/* 요청 아이디 */
		                        		$("#"+i+"UserId").text(data.list[i-1].userId);
		                        		/* 요청 금액 */
		                        		$("#"+i+"ValueId").text(data.list[i-1].wantedValue);
		                        		/* relValue */
		                        		if( parseInt(data.list[i-1].relValue) < 0 ){
		                        			$("#"+i+"ValueId").append("<p>"+data.list[i-1].relValue+"</p>");
			                        		$("#"+i+"ValueId").append("<img src='/resources/images/downImg.png' style='width:25px;height:25px;'/>");
		                        		}
		                        		else if(parseInt(data.list[i-1].relValue) >= 0){
		                        			$("#"+i+"ValueId").append("<p>"+"+"+data.list[i-1].relValue+"</p>");
			                        		$("#"+i+"ValueId").append("<img src='/resources/images/upImg.png' style='width:25px;height:25px;'/>");	
		                        		}
		                        		
		                        		/* 요청 거리 */
		                        		$("#"+i+"DistanceId").text(data.list[i-1].distance);
		                        		
		                        		/* 요청 글 제목 */
		                        		$("#"+i+"TitleId").text(data.list[i-1].requestMsg);
		                        		
		                        		/* 요청 mno 제목 */
		                        		$("#"+i+"MnoId").val(data.list[i-1].mno);
		                        	}
		                        }
		                     });//ajax
	                     	}//else
	                       }); // end of compareBtn click event
	                        
	                         
	                        
	                        // 동적으로 추가되는 요청받은 게시글 클릭시 이벤트 감지...
	                        
	                              $(document).on("click",".rollOver",function(event){
	                          		 button = $(this);                                 
	                                 listMatchContent(button);
	                                 
	                              });
	                        
	                        // 키워드 입력 버튼 클릭
	                        $("#listBtn").on("click",function(event){
	                           var keyword = $("#keywordId").val();
	                           var str2 = "";
	                           var keywordListOl = $("#keywordListOl");
	                           keywordListOl.empty();
	                           
	                           $.ajax({
	                              type:'POST',
	                              url:"/matching/requestList",
	                              headers:{
	                                 "Content-Type":"application/json"
	                              },
	                              dataType:'json',
	                              data:JSON.stringify({
	                                 productKeywords:keyword
	                              }),
	                              success:function(data){
	                                 $(data).each(function(){
	                                    str2 += "<div class='panel panel-default rollOver' style='height:50px;'>"
	                                             +"<div class='panel-body'>"
	                                                  +"<input class='bnoVal' type='hidden' value='"+this.bno+"' />"
	                                                +"<input class='userIdVal' type='hidden' value='"+this.userId+"' />"
	                                                +"<input class='bcontentVal' type='hidden' value='"+this.bcontent+"' />"
	                                                +"<input class='bregdateVal' type='hidden' value='"+this.bregdate+"' />"
	                                                +"<input class='isSwapVal' type='hidden' value='"+this.isSwap+"' />"
	                                                +"<input class='cateNameVal' type='hidden' value='"+this.cateName+"' />"
	                                                +"<input class='distanceVal' type='hidden' value='"+this.distance+"' />"
	                                                +"<input class='valueVal' type='hidden' value='"+this.value+"' />"  
	                                                +"<p class='btitleP' style='margin-top:-5px;'>"+this.btitle+"</p>" 
	                                                +"<button class='navbar-link btn btn-default sendBtn' data-toggle='modal' data-target='#myModal' style='margin-top:-30px;float:right;'>요청</button>"
	                                             +"</div>"
	                                       +  "</div>";
	                                 });
	                                 keywordListOl.append(str2);
	                              }
	                           });
	                        });// end of click
	                        
	                        // 모달 창 내에서 요청 버튼 클릭시...(insert 작업...)
	                         $("#sendContent").on("click",function(){
	                            
	                           
	                            var check = confirm("정말 요청하시겠습니까?");
	                            if(check==true){
	                               $.ajax({
	                                 type : 'POST',
	                                 url : "/matching/insertMatching",
	                                 headers:{
	                                    "Content-Type":"application/json"
	                                 },
	                                 dataType : 'text',
	                                 data : JSON.stringify({
	                                    bno : $("#modalBno").val(),
	                                    userId : $("#modalUserId").val(),
	                                    requestMsg : $("#requestMsg").val(),
	                                    lat:$("#latId").val(),
	                                    lon:$("#lonId").val(),
	                                    addr1:$("#wantedArea").val(),
	                                    wantedValue:$("#wantedValue").val()
	                                 }),
	                                 success:function(data){
	                                    console.log("success");
	                                    $("#wantedValue").val("");
	                                    $("#requestMsg").val("");
	                                    // 모달창 닫음
	                                    $("#myModal").fadeOut(500);
	                                 },
	                                 error:function(data){
	                                    console.log("error");
	                                 }
	                               });
	                            }//if
	                         });//삽입에 사용하기 위한 버튼
	                      
	                         
	                        // 요청하기 버튼 클릭시... 요청정보를 controller에 있는 애한테 정보를 보내야됨
	                        $(document).on("click",".sendBtn",function(event){
	                           
	                           $("#myModal").fadeOut(500);
	                           
	                           // 로그인된 회원의 주소정보를 가져오기
	                           $.getJSON("/matching/getAddr",function(data){
	                              var lat = data.lat;
	                              var lon = data.lon;
	                              var addr1 = data.addr1;
	                              $("#latId").val(lat);
	                              $("#lonId").val(lon);
	                              $("#addr1Id").val(addr1);
	                              $("#wantedArea").val(addr1);
	                           });
	                           
	                           var parent = $(this).parent();
	                           var titleObj = parent.find("p");
	                            var bnoObj = parent.find(".bnoVal");
	                           var userIdObj = parent.find(".userIdVal");
	                           var bcontentObj = parent.find(".bcontentVal");
	                           var bregdateObj = parent.find(".bregdateVal");
	                           var isSwapObj = parent.find(".isSwapVal");
	                           var cateNameObj = parent.find(".cateNameVal");
	                           var distanceObj = parent.find(".distanceVal");
	                           var valueObj = parent.find(".valueVal");
	                           var requestMsgObj = $("#requestMsg");
	                           // 모달에 세팅
	                           // 제목 전달
	                            $("#modalTitle").html(titleObj.text()); 
	                           $("#modalUserId").val(userIdObj.val());                           
	                           $("#modalBno").val(bnoObj.val());
	                           $("#modalCategory").html(cateNameObj.val());
	                           $("#modalDistance").html(distanceObj.val());
	                           $("#modalValue").html(valueObj.val());
	                           $("#modalRegdate").html(bregdateObj.val());
	                           $("#modalIsSwap").html(isSwapObj.val());
	                           $("#modalContent").html(bcontentObj.val());
	                              
	                           });//요청하기 ajax
                        
	                           
	                           var confirmVal;
	                           for(var i=1; i<=4; i++){
		                           $("#"+i+"Container").on("click",function(event){
										var parentObj = $(this);
										var mno = parentObj.find("#"+i+"MnoId").val();
										confirmVal = confirm("해당 요청을 선택하시겠습니까?");
										if(confirmVal){
											
										};
		                           });
	                           }
	                           
                     });// end of ready()
                  </script>
                  
                  </div>

</body>
</html>