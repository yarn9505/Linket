$(document).ready(function(){
	
	
   var page = 1;
   var keywords;
   var login;
   var statueFilter = false; //필터를 적용했는지 확인하기 위한 전역변수
    var allData; // 필터조건을 controller에 넘겨주기 위한 전역변수
    // 핸들바스 가져오기
    //핸들바 템플릿 가져온다.
   var source = $("#entry-template2").html(); 
   //핸들바 템플릿 컴파일
   var template = Handlebars.compile(source); 
   // 붙일 녀석을 가져옴
    var placeHolder = $("#showTimeline");  
   
    Handlebars.registerHelper('distanceVal', function (distanceVal) {
       var distanceUp = Math.ceil(distanceVal);
        return distanceUp + "m";
   });
    
    Handlebars.registerHelper('dateVal', function (dateVal) {
       var d = new Date(dateVal);
       var str = (d.getFullYear() + " " + (d.getMonth()+1) + " " + d.getDate());
       return str;
    });
    
    Handlebars.registerHelper('check', function (checkVal) {
       
       var str = "";
       if ( checkVal == 0 ){
          str = "/resources/images/like1.png";
       }else if(checkVal == 1 ){
          str = "/resources/images/like2.png";
       }
       return str;
    });
    
   
    
    //////////////////핸들바스//////////////////
    
    
    function listAll(pageNum,searchText){
      $.getJSON("/timeline/listPaging?page="+pageNum+"&keywords="+encodeURIComponent(searchText),function(data){
         var temp = "";
         
         $(data.list).each(function(){
                var html = template(this);
                placeHolder.append(html);
          });
         
         $("#searchId").val(searchText);
      });
   } // end of listAll()

   
   // 최초, 1페이지 뿌려줌
   listAll(page,keywords);

   // 무한스크롤 인식
      $(window).scroll(function() {
         console.log("이거 찍히나");
         var maxHeight = $(document).height();
         var currentScroll = $(window).scrollTop() + $(window).height();
         
          if (maxHeight <= currentScroll) {
            console.log("스크롤 인식");
            page++;
            if(statueFilter == false){ // 필터가 안된 상태이면 내 관심사에 따라서 타임라인에 뿌려줌
               console.log("statueFilter false");
               listAll(page,keywords);
            }
            else if(statueFilter == true){// 필터가 적용되면 필터를 계산한 값을 뿌려줌
               listFilter(page,allData);
               
            }
            var height = $(document).scrollTop();
            //$('html, body').animate({scrollTop : height+400}, 600);
          }
      });//end of 무한스크롤
     
      /** [혜연] 필터된 타임라인 출력 **/
      
      // 1. 버튼을 클릭할때 필터값을 Controller에 넘겨줌
      $("#filterBtn").on("click",function(event){
         page = 1; // 필터링된 타임라인의 page=1 부터 뿌려줘야 하기 때문에 초기화 시켜줌
         statueFilter = true ; // 필터 조건을 설정
         $("#showTimeline").empty(); // 필터결과를 뿌리기 전에 한번 타임라인 창을 비워줌
         $.ajaxSettings.traditional = true;
         /* controller에 넣어줄 각 카테고리 배열 */
         //하나하나 선언해주고 넣지 않으면 출력값이 섞이는 현상이 발생함
         var cate1 = $("#cateId1").is(":checked");
         var cate2 = $("#cateId2").is(":checked");
         var cate3 = $("#cateId3").is(":checked");
         var cate4 = $("#cateId4").is(":checked");
         var cate5 = $("#cateId5").is(":checked");
         var cate6 = $("#cateId6").is(":checked");
         var fcateArr = [cate1, cate2, cate3, cate4, cate5, cate6];
         var count = 0;
         for(var i=0; i<fcateArr.length; i++){
        	 if ( fcateArr[i] == true ){
        		 count++;
        	 }
         }
         console.log("체크된 것 개수 : " + count);
         if ( count == 0 ){
        	 listAll(page,keywords);
        	 alert("관심사는 하나 이상을 선택해주세요.");
         }else{

             /* 가치의 범위값 가지고 오기 */
             var fvalue1 = document.getElementById("fvalue1").value;
             var fvalue2 = document.getElementById("fvalue2").value;
             console.log("fvalue1 : "+fvalue1);
             console.log("fvalue2 : "+fvalue2);

             /* 필수 필수 */
             allData = {"fcateArr" : fcateArr, "fvalue1" : fvalue1, "fvalue2" : fvalue2};
             console.log("page : "+page);

             listFilter(page,allData); // ajax로 호출
         }
         
      });//end of event( filterBtn )
      
      // 2. 필터된 데이터를 Ajax로 보내고 Controller에서 받아서 내용을 뿌려줌
            function listFilter(pageNum, allData){
               //////////////////////////
               console.log("listFilter실행되었음");
               
               $.ajax({
                  async : false,   
                  url : "timeline/filterList?page="+pageNum,
                  type : 'GET',
                  dataType : "json",
                  data : allData,
                  success : function(data){
                     //전송 성공 후 실행되는 코드
                     console.log("필터된 카테고리 전송 완료");
                     
                     var bno = "";
                     var temp = "";
                     $(data.list).each(function(){
                       var html = template(this);
                       placeHolder.append(html);
                     });// end of each
                     
                  },
                  error : function(){
                     //전송 실패
                     alert("전송실패");
                     
                  }
                  
               }); //ajax
            }//end of listFilter
            
            /* 더보기 버튼 클릭 (황영롱) */
            $(document).on("click",".moreBtn",function(event){
               
               var content = $(this).prev();
               var offset = content.prev().prev().parent().offset();
    
               if ( $(this).text() == '펼쳐보기' ){
                  content.attr("style","overflow:visible;min-height:100px;");
                  $(this).text("접기");
               }else if($(this).text() == '접기' ){
                  content.attr("style","height:100px;overflow-y:hidden;");
                  $(this).text("펼쳐보기");
               }
               $('html, body').animate({scrollTop : offset.top}, 400);

            });
            
   
            $("#searchBtn").on("click",function(event){
                var searchText = $("#searchId").val();
                page = 1;
                keywords = searchText;
                $("#showTimeline").empty();
                listAll(page,keywords);
             });
            
}); // end of ready()

function check(bno) {
   console.log("check bno : " + bno)
   var bno = bno;

   $ajax({
      type : 'get',
      headers : {
         "Content-Type" : "application/json",
         "X-HTTP-Method-Override" : "GET"
      },
      url:'/timeline/checkfavorite?bno='+bno,
      dataType:'text',
      sucess:function(data){
         console.log(data+"check")
         if(data!=null){
            if (data==1) {
               $("#likeImg").attr({"src":"/resources/images/like1.png"});
            }else if(data==0){
               $("#likeImg").attr({"src":"/resources/images/like2.png"});
            }
         }
      }
   });
}

function like(bno){
   console.log("bno=?"+bno)
   var bno=bno;
   
   $.ajax({
      type : 'get',
      headers : {
         "Content-Type" : "application/json",
         "X-HTTP-Method-Override" : "GET"
      },
      url : '/timeline/updatefavorite?bno='+bno,
      dataType : 'text',
      success : function(data) {
         console.log(data)
         if(data!=null){
            if (data==1) {
               $("#likeImg"+bno).attr({"src":"/resources/images/like1.png"});
            }else if(data==0){
               $("#likeImg"+bno).attr({"src":"/resources/images/like2.png"});
            }
         }
      }
   }); // end of ajax from like Img Click
}