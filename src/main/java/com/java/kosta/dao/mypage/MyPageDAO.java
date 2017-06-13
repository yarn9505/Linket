package com.java.kosta.dao.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.mypage.Mypagepaging;
import com.java.kosta.dto.transaction.TransactionDTO;

public interface MyPageDAO {
	
	public String getCustomerId(String bno);
	
	//-- 고객이 후기를 쓸 게시글(거래) 수가 몇개인지를 조회 
	public int countClient(TransactionDTO dto);
	//고객이 후기를 쓸 게시글 목록 조회
	public List<BoardDTO> clientTransactionList(TransactionDTO dto);
	
	// 구매결정 삽입
	public void insertTransaction(TransactionDTO dto);
	
	/** 구매결정 모달창 존재하는 회원 아이디인지 체크 */
	public int existIdCheck(TransactionDTO dto);
	
	public int duplicateId(TransactionDTO dto);
	
	/** 전체 레코드 갯수 가져옴 */
	public int selectMyFavoriteListTotalCount(Mypagepaging pagingDTO, @Param("userId")String userId);	
	
	/** 나의좋아요 정보를 조회해서 List로 가져온다  */
	public List<BoardDTO> selectMyFavoriteList(@RequestParam("bNo")String bno, @Param("userId")String userId);
	
	/** 좋아요 조회 */
	public int searchFavorite(@Param("userId") String userId, @Param("bNo") String bNo);
	
	/** 좋아요 취소 */
	public void unfavoriteBoard(@Param("userId") String userId, @Param("bNo") String bNo);

	/**좋아요 개수 조회 */
	public int countMyFavorite(String bNo);
	
	public List<BoardDTO> searchFavoriteList(@Param("userId")String userId);

	/**마이페이지 내가 쓴 목록 가져오기*/
	public List<BoardDTO> selectWritedList(String userId);
	
	/**마이페이지 내가 쓴 목록 갯수 가져오기*/
	public int selectMyBoardListCount(Mypagepaging pagingDTO ,@Param("userId")String userId);

	/**페이징 처리*/
	public List<BoardDTO> selectFavoriteList(Mypagepaging pagingDTO, String userId);
	
	/**페이징 처리해서 갯수세기*/
	public int selectFavoritecount(Mypagepaging pagingDTO, String userId);
	
	/** 나의 거래중인 게시물 갯수 가져오기 */
	public int selectMyExchangeListCount(@Param("pagingDTO")BoardPagingDTO pagingDTO, @Param("buyerId")String buyerId);

	/** 나의 거래중인 게시물 리스트 */
	public List<BoardDTO> selectExchangeList(@Param("pagingDTO")BoardPagingDTO pagingDTO, @Param("buyerId")String buyerId);
}
