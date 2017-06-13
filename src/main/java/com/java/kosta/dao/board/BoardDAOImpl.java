package com.java.kosta.dao.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.board.BoardAttachDTO;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	String NameSpace = "com.java.kosta.dao.board.BoardDAO";
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public BoardDTO selectBoardOne(String bNo) {
		return sqlSession.selectOne(NameSpace + ".selectBoardOne",bNo);
	}

	@Override
	public int selectBoardListTotalCount(BoardPagingDTO pagingDTO, int cateId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("pagingDTO", pagingDTO);
		map.put("cateId", cateId);
		return sqlSession.selectOne(NameSpace + ".selectBoardListTotalCount",map);
	}

	@Override
	public List<BoardDTO> selectBoardList(BoardPagingDTO pagingDTO, int cateId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("pagingDTO", pagingDTO);
		map.put("cateId", cateId);
		return sqlSession.selectList(NameSpace+".selectBoardList", map);
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) {
		sqlSession.insert(NameSpace+".insertBoard", boardDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		sqlSession.update(NameSpace+".updateBoard", boardDTO);
	}

	@Override
	public void updateViewCnt(String bNo) {
		sqlSession.update(NameSpace+".updateViewCnt", bNo);
	}

	@Override
	public void deleteBoard(String bNo) {
		sqlSession.delete(NameSpace+".deleteBoard", bNo);
	}

	@Override
	public CategoryDTO selectCategory(int cateId) {
		return sqlSession.selectOne(NameSpace+".selectCategory", cateId);
	}

	@Override
	public void deleteBoardReplyAll(String bNo) {
		sqlSession.delete(NameSpace + ".deleteBoardReplyAll", bNo);
	}

	@Override
	public int searchFavorite(String userId, String bNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bNo", bNo);
		map.put("userId", userId);
		return sqlSession.selectOne(NameSpace + ".searchFavorite", map);
	}

	@Override
	public void favoriteBoard(String userId, String bNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bNo", bNo);
		map.put("userId", userId);
		sqlSession.insert(NameSpace + ".favoriteBoard", map);

	}

	@Override
	public void unfavoriteBoard(String userId, String bNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bNo", bNo);
		map.put("userId", userId);
		sqlSession.delete(NameSpace + ".unfavoriteBoard", map);
		
	}
	
	@Override
	public void deleteFavorite(String bNo) {
		sqlSession.delete(NameSpace +".deleteFavorite",bNo);
	}
	
	@Override
	public int countFavorite(String bNo) {
		return sqlSession.selectOne(NameSpace + ".countFavorite",bNo);
	}

	@Override
	public void addAttach(BoardAttachDTO boardAttachDTO) {
		sqlSession.insert(NameSpace + ".addAttach", boardAttachDTO);
	}

	@Override
	public List<BoardAttachDTO> selectAttach(String bNo) {
		return sqlSession.selectList(NameSpace + ".selectAttach", bNo);
	}

	@Override
	public void deleteAttach(String bNo) {
		sqlSession.delete(NameSpace + ".deleteAttach", bNo);
	}
/*
	@Override
	public void updateAttach(String bNo, String fullName) {
		
	}
*/
	@Override
	public String getAddr(String userId) {
		return sqlSession.selectOne(NameSpace+".getAddr",userId);
	}

}
