package com.java.kosta.dao.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.kosta.dto.board.BoardAttachDTO;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;

public interface BoardDAO {
	
	/** 주소 얻어오기 */
	public String getAddr(String id);
	
	/** 게시글 한건 조회해서 가져온다  */
	public BoardDTO selectBoardOne(String bNo);

	/** 전체 레코드 갯수 가져옴 */
	public int selectBoardListTotalCount(@Param("pagingDTO")BoardPagingDTO pagingDTO, @Param("cateId")int cateId);	// 파라미터 두개 이상일 경우는 @Param 어노테이션 사용해야함!!!!
	
	/** 게시판 정보를 조회해서 List로 가져온다  */
	public List<BoardDTO> selectBoardList(@Param("pagingDTO")BoardPagingDTO pagingDTO, @Param("cateId")int cateId);
	
	/** 게시글 삽입한다 */
	public void insertBoard(BoardDTO boardDTO);	

	/** 게시글 수정 */
	public void updateBoard(BoardDTO boardDTO);
	
	/** 게시판 조회수 증가 */
	public void updateViewCnt(String bNo);
	
	/** 게시글 삭제 */
	public void deleteBoard(String bNo);

	/** 카테고리명 조회 */
	public CategoryDTO selectCategory(int cateId);

	/** 게시글 삭제 시 해당 댓글 모두 삭제*/
	public void deleteBoardReplyAll(String bNo);
	
	/** 좋아요 조회 */
	public int searchFavorite( String id, @Param("bNo") String bNo);

	/** 좋아요 */
	public void favoriteBoard( String id, @Param("bNo") String bNo);

	/** 좋아요 취소 */
	public void unfavoriteBoard(String id,String bNo);
	
	/** 테이블 삭제시 좋아요 테이블 데이터 삭제 */
	public void deleteFavorite(String bNo);
	
	/**좋아요 개수 조회*/
	public int countFavorite(String bNo);
	
	/** 파일 삽입 */
	public void addAttach(BoardAttachDTO boardAttachDTO);
	
	/** 파일 리스트 가져오기*/
	public List<BoardAttachDTO> selectAttach(String bNo);
	
	/** 파일 테이블 삭제 */
	public void deleteAttach(String bNo);
	
	
}
