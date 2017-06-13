package com.java.kosta.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.board.BoardReplyDAO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.BoardReplyDTO;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {

	@Inject
	BoardReplyDAO brDAO;

	@Override
	public BoardReplyDTO selectBoardReply(BoardReplyDTO boardReplyDTO) throws Exception {

		return brDAO.selectBoardReply(boardReplyDTO);
	}

	@Override
	public List<BoardReplyDTO> selectBoardReplyList(BoardPagingDTO pagingDTO) throws Exception {
		return brDAO.selectBoardReplyList(pagingDTO);
	}

	@Override
	public int selectReplyListTotCount(BoardPagingDTO pagingDTO) throws Exception {
		return brDAO.selectReplyListTotCount(pagingDTO);
	}

	@Override
	public void insertBoardReply(BoardReplyDTO boardReplyDTO) throws Exception {
		brDAO.insertBoardReply(boardReplyDTO);
	}

	@Override
	public void deleteBoardReply(String rNo) throws Exception {
		brDAO.deleteBoardReply(rNo);
	}

	@Override
	public String findWriter(String bNo) {
		return brDAO.findWriter(bNo);
	}

	@Override
	public void updateBoardReply(BoardReplyDTO boardReplyDTO) throws Exception {
		brDAO.updateBoardReply(boardReplyDTO);
	}

	@Override
	public List<BoardReplyDTO> selectAllReplyList(BoardReplyDTO boardReplyDTO) throws Exception {
		return brDAO.selectAllReplyList(boardReplyDTO);
	}

}
