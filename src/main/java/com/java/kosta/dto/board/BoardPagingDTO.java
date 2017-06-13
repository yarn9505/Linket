package com.java.kosta.dto.board;
// 페이징 관련 클래스
public class BoardPagingDTO {
	public String bNo;	//댓글리스트를 조회하기 위한 게시글 번호
	
	/** 한 페이지 당 보여지는 레코드의 갯수 */
	public static final int COUNT_PER_RECORD = 10;
	
	/** 페이징 그룹 당 보여지는 페이지 갯수 */
	public static final int COUNT_PER_PAGE_GROUP = 5;
	
	/** 전체 레코드 갯수 */
	private int totalRecordCount;
	
	/** get방식으로 넘어가는 키값 - 요청 페이지 번호 */
	private int pageNo;
	
	/** 전체 페이지 갯수 */
	private int totalPageCount;
	
	/** DB 시작 행과 끝 행 */
	private int startRow;
	private int endRow;
	
	/** 전체 페이지의 그룹 갯수 */
	private int totalGroupCount;
	
	/** 현재 페이지의 그룹번호(그룹번호는 1부터 시작) */
	private int groupNo = 1;

	/** 그룹의 시작과 끝 페이지 번호 */
	private int pageStartNo;
	private int pageEndNo;
	
	/** 검색 타입  ex) 제목, 내용, 제목+내용**/
	private String searchType;
	/** 검색어 **/
	private String searchText;

	/**
	 * 	화면에 표시할 페이징 변수정보를 계산한다.
	 * @param totalRecordCount 전체 레코드 갯수
	 * */
	public void calcPage(int totalRecordCount){
		//페이지 디폴트 값은 무조건 1이다.
		this.pageNo = pageNo == 0 ? 1 : pageNo;
		
		//전체 레코드 값 저장
		this.totalRecordCount = totalRecordCount;
		
		//페이지 갯수 계산
		totalPageCount = calcTotalPageCount(this.totalRecordCount, COUNT_PER_RECORD);
		
		//전체 그룹의 갯수
		totalGroupCount = calcTotalPageCount(totalPageCount, COUNT_PER_PAGE_GROUP);

		// DB에서 가져올 시작행, 끝행 번호
		startRow = (pageNo - 1) * COUNT_PER_RECORD;
		endRow = COUNT_PER_RECORD;
		
		///////////////// 그룹 ///////////////////
		
		// 현재 페이지의 소속 그룹번호 계산
		groupNo = calcTotalPageCount(pageNo, COUNT_PER_PAGE_GROUP);
		
		// 현재 그룹의 시작 페이지와 끝 페이지 계산
		pageStartNo = (groupNo-1) * COUNT_PER_PAGE_GROUP + 1;
		pageEndNo = groupNo * COUNT_PER_PAGE_GROUP;
		
		// 마지막 페이지는 전체 페이지 수로 셍팅
		if(pageEndNo >= totalPageCount){
			pageEndNo = totalPageCount;
		}
		
	}// end of calcPage

	/**
	 * 전체 레코드 갯수에 대한 화면에 표시할 페이지수 계산
	 * @param totalRecordCount 전체 레코드 갯수
	 * @param countPerPageGroup 한 화면에 표시할 페이지 그룹 갯수
	 * @return totalPageCount
	 * */
	public int calcTotalPageCount(int totalRecordCount, int countPerPageGroup){
		int totalPageCount=0;
		if(totalRecordCount > 0){
			totalPageCount = totalRecordCount / countPerPageGroup;
			if(totalRecordCount % countPerPageGroup > 0){
				totalPageCount += 1;
			}
		}
		return totalPageCount;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getTotalGroupCount() {
		return totalGroupCount;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setTotalGroupCount(int totalGroupCount) {
		this.totalGroupCount = totalGroupCount;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getPageStartNo() {
		return pageStartNo;
	}

	public int getPageEndNo() {
		return pageEndNo;
	}

	public void setPageStartNo(int pageStartNo) {
		this.pageStartNo = pageStartNo;
	}

	public void setPageEndNo(int pageEndNo) {
		this.pageEndNo = pageEndNo;
	}

	public String getSearchType() {
		return searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getbNo() {
		return bNo;
	}

	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	
}