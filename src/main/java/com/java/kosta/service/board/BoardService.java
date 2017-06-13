package com.java.kosta.service.board;

import java.util.List;

import com.java.kosta.dto.board.BoardAttachDTO;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;

public interface BoardService {
	
//////////////////////////////// 게시판 /////////////////////////////////////
	public String getAddr(String userId);
	
	/** 게시글 정보 조회해서 가져온다  */
	public BoardDTO selectBoardOne(String bNo) throws Exception;

	/** 전체 레코드 갯수 가져옴 */
	public int selectBoardListTotalCount(BoardPagingDTO pagingDTO, int cateId) throws Exception;
	
	/** 게시판 정보를 조회해서 List로 가져온다  */
	public List<BoardDTO> selectBoardList(BoardPagingDTO pagingDTO, int cateId) throws Exception;
	
	/** 게시글 삽입한다 */
	public void insertBoard(BoardDTO boardDTO) throws Exception;	// 반환값 : insert된 row 갯수

	/** 게시글 수정 */
	public void updateBoard(BoardDTO boardDTO) throws Exception;
	
	/** 게시글 삭제 */
	public void deleteBoard(String bNo) throws Exception;
	
	/** 게시판 조회수 증가 */
	public void updateViewCnt(String bNo) throws Exception;
	
	//////////////////////////////// 카테고리 //////////////////////////////////////
	
	/** 카테고리명 조회 */
	public CategoryDTO selectCategory(int cateId) throws Exception;


	/** 게시글 삭제 시 해당 댓글 모두 삭제*/
	public void deleteBoardReplyAll(String bNo) throws Exception;
	
	//////////////////////////////// 좋아요////////////////////////////////////////////
	/** 좋아요 조회 */
	public int searchFavorite(String userId, String bNo) throws Exception;

	/** 좋아요 */
	public void favoriteBoard(String userId,String bNo) throws Exception; 

	/** 좋아요 취소 */
	public void unfavoriteBoard(String userId, String bNo) throws Exception;
	
	/** 테이블 삭제시 좋아요 테이블 데이터 삭제 */
	public void deleteFavorite(String bNo) throws Exception;
	
	/**좋아요 개수 조회 */
	public int countFavorite(String bNo) throws Exception;
	
	
	/** 게시글 + 파일 삽입  */
//	public void insertBoardAttach(BoardDTO boardDTO) throws Exception;
	
	/** 파일 리스트 가져오기 */
	public List<BoardAttachDTO> selectAttach(String bNo) throws Exception;
	
	/** 해당 게시글 파일 삭제 */
	public void deleteBoardAttach(String bNo) throws Exception;
	
	/** 다음에디터 이용한 게시글 삽입 처리 */
	public void insertBoardDaumAttach(BoardDTO boardDTO) throws Exception;
	
	/** 다음에디터 이용한 게시글 수정 처리*/
	public void updateBoardDaumAttach(BoardDTO boardDTO) throws Exception;
}
