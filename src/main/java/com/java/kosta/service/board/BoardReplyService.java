package com.java.kosta.service.board;

import java.util.List;

import com.java.kosta.dto.board.BoardReplyDTO;
import com.java.kosta.dto.board.BoardPagingDTO;

public interface BoardReplyService {

	/** 댓글 정보 5개씩 조회해서 가져온다 */
	public BoardReplyDTO selectBoardReply(BoardReplyDTO boardReplyDTO) throws Exception;

	/** 댓글 정보를 조회해서 List로 가져온다 */
	public List<BoardReplyDTO> selectBoardReplyList(BoardPagingDTO pagingDTO) throws Exception;

	/** 댓글 전체 조회 */
	public List<BoardReplyDTO> selectAllReplyList(BoardReplyDTO boardReplyDTO) throws Exception;

	/** 댓글 총 갯수 */
	public int selectReplyListTotCount(BoardPagingDTO pagingDTO) throws Exception;

	/** 댓글 삽입한다 */
	public void insertBoardReply(BoardReplyDTO boardReplyDTO) throws Exception;

	/** 댓글 수정 */
	public void updateBoardReply(BoardReplyDTO boardReplyDTO) throws Exception;

	/** 댓글 삭제 */
	public void deleteBoardReply(String rNo) throws Exception;

	/** 게시글 작성자 조회(비밀댓글때문에) */
	public String findWriter(String bNo);

}
