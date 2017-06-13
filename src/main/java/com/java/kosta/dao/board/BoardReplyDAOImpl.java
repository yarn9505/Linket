package com.java.kosta.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.BoardReplyDTO;

@Repository
public class BoardReplyDAOImpl implements BoardReplyDAO {

	String NameSpace = "com.java.kosta.dao.board.BoardReplyDAO";

	@Autowired
	SqlSession sqlSession;

	@Override
	public BoardReplyDTO selectBoardReply(BoardReplyDTO boardReplyDTO) {
		return sqlSession.selectOne(NameSpace + ".selectBoardReply", boardReplyDTO);
	}

	@Override
	public List<BoardReplyDTO> selectBoardReplyList(BoardPagingDTO pagingDTO) {
		return sqlSession.selectList(NameSpace + ".selectBoardReplyList", pagingDTO);
	}

	@Override
	public List<BoardReplyDTO> selectAllReplyList(BoardReplyDTO boardReplyDTO) {
		return sqlSession.selectList(NameSpace + ".selectAllReplyList", boardReplyDTO);
	}

	@Override
	public int selectReplyListTotCount(BoardPagingDTO pagingDTO) {
		return sqlSession.selectOne(NameSpace + ".selectReplyListTotCount", pagingDTO);
	}

	@Override
	public void insertBoardReply(BoardReplyDTO boardReplyDTO) {
		sqlSession.insert(NameSpace + ".insertBoardReply", boardReplyDTO);
	}

	@Override
	public void updateBoardReply(BoardReplyDTO boardReplyDTO) {
		sqlSession.update(NameSpace + ".updateBoardReply", boardReplyDTO);
	}

	@Override
	public void deleteBoardReply(String rNo) {
		sqlSession.delete(NameSpace + ".deleteBoardReply", rNo);
	}

	@Override
	public String findWriter(String bNo) {
		return sqlSession.selectOne(NameSpace + ".findWriter", bNo);
	}

}
