package com.java.kosta.dto.mypage;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Mypagepaging {
	// 페이징 관련 클래스
		private int page; // 현재 페이지
		private int perPageNum; // 페이지당 출력할 게시글 수
		private int totalCount; // 전체 게시글 수(필수 세팅 필요 : 이 변수 setter에서 다른 것들도 다 계산시킬 것임)
		private int startPage; // 화면에서 현재 페이지 기준으로 몇번 페이지부터 표시되어야하는지
		private int endPage; // 현재페이지 기준 몇번째 페이지까지 표시되어야하는지
		private boolean prev; // 현재 페이지가 1페이지 일때는 prev가 false , 즉 이전 버튼이 생겨야하는 조건
		private boolean next; // 다음 버튼이 생겨야 하는 조건
		private int entireEndPage;
		
		/** 검색 타입  ex) 제목, 내용, 제목+내용**/
		private String searchType;
		/** 검색어 **/
		private String searchText;

		
		// page(현재페이지), perPageNum(페이지당 출력 게시글 수)를 이용해 쿼리문자열을 생성해주는 메서드입니다.
		public String pageQuery(int page){
			UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
					.queryParam("perPageNum", this.perPageNum).build();
			// ?page=this.page&perPageNum=this.perPageNum 으로 문자열을 생성하게 됨 이 메서드를 실행하면
			// 페이징 객체를 넘겨받은 뷰단에서 페이지를 이용한 쿼리문자열을 쓸 때 좀 더 편리하게 사용하기 위해 만들어 놓았음.
			return uriComponents.toUriString();
		} // end of pageQuery()
		
		// 전체 게시글 수 세팅 (반드시해줘야함...그래야 다른 것들도 계산이 가능)
		// 근대 이 전체 게시글 수가 세팅되어야 나머지도 계산이 가능함
		// 따라서 이거 세팅되는 이 곳 안에서 다른 녀석들 계산도 같이 되도록 해주자.
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
			// 마지막 페이지 계산(현재페이지기준...)
			endPage = (int)(Math.ceil(this.page / (double)this.perPageNum)*this.perPageNum);
			startPage = (endPage - perPageNum) + 1;
			// 페이지당 출력게시글 수를 기준으로한 전체 페이지 수
			entireEndPage = (int)(Math.ceil(this.totalCount/(double)this.perPageNum));
			
			// 현재페이지 기준 마지막 페이지가 총 게시글수에 대한 마지막 페이지보다 커지면 총 게시글 수에 대한 마지막 페이지로 세팅
			if ( endPage > entireEndPage ){
				endPage = entireEndPage;
			}
			
			// 이전 버튼은 1페이지일때만 안보이도록 false로하고 그 외에는 true
			prev = startPage == 1 ? false : true;
			next = endPage * this.perPageNum >= this.totalCount ? false : true;
		}
		
		public Mypagepaging() {
			this.page = 1; // 현재 페이지 기본값 설정
			this.perPageNum=10; // 별 지정 없으면 10개씩 출력하도록... 초기 세팅
		}

		// 왕중요! : BoardMapper.xml에서 페이지당 limit으로 가져올 행을 지정할 때
		// 사용할 getter임 Mapper에서 ${pageStart} 해놓으면 getPageStart()를 호출하기 때문에
		// 따로 필드변수 만들지 않고 이 메서드 호출시 내부에서 연산해서 반환하도록 하면 됨.
		public int getPageStart(){
			return (this.page -1) * perPageNum;
		}
		
		public void setPage(int page) {
			// 0보다 작은 페이지는 없음으로 0보다 작은 값이 들어오면 무조건 1페이지로 세팅되도록 함
			if ( page <= 0 ){
				this.page = 1;
				return;
			}
			this.page = page;
		}
		
		public void setPerPageNum(int perPageNum) {
			// 말도안되게 적거나 많은 페이지당 출력 게시글 수를 지정하면 기본 10개씩 출력으로 세팅함
			if( perPageNum <= 0 || perPageNum > 21 ){
				this.perPageNum = 10;
				return;
			}
			this.perPageNum = perPageNum;
		}
		
		public int getPage() {
			return page;
		}

		
		public int getEntireEndPage() {
			return entireEndPage;
		}

		public void setEntireEndPage(int entireEndPage) {
			this.entireEndPage = entireEndPage;
		}

		public int getPerPageNum() {
			return perPageNum;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setNext(boolean next) {
			this.next = next;
		}
		
		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public boolean isPrev() {
			return prev;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public boolean isNext() {
			return next;
		}

		public String getSearchType() {
			return searchType;
		}

		public void setSearchType(String searchType) {
			this.searchType = searchType;
		}

		public String getSearchText() {
			return searchText;
		}

		public void setSearchText(String searchText) {
			this.searchText = searchText;
		}
		
	}