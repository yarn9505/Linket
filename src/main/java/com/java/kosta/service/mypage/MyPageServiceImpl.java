package com.java.kosta.service.mypage;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.java.kosta.dao.mypage.MyPageDAO;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardFavoriteDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.mypage.Mypagepaging;
import com.java.kosta.dto.transaction.TransactionDTO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Inject
	MyPageDAO mDAO;

	@Override
	public int selectMyFavoriteListTotalCount(Mypagepaging pagingDTO, String userId) {
		return mDAO.selectMyFavoriteListTotalCount(pagingDTO, userId);
	}

//	@Override
//	public List<BoardDTO> selectMyFavoriteList(String bno, String userId) {
//		return mDAO.selectMyFavoriteList(bno, userId);
//	}

	@Override
	public int searchFavorite(String userId, String bNo) {
		return mDAO.searchFavorite(userId, bNo);
	}

	@Override
	public void unfavoriteBoard(String userId, String bNo) {
		mDAO.unfavoriteBoard(userId, bNo);
	}

	@Override
	public int countMyFavorite(String bNo) {
		return mDAO.countMyFavorite(bNo);
	}

	@Override
	public List<BoardDTO> searchFavoriteList(String userId) {
		return mDAO.searchFavoriteList(userId);
	}

//	@Override
//	public List<BoardDTO> selectMyFavoriteList(BoardDTO boardDTO, String userId) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<BoardDTO> selectMyFavoriteList(String bno, String userId) {
		return mDAO.selectMyFavoriteList(bno, userId);
	}

	@Override
	public List<BoardDTO> selectWritedList(String userId) throws Exception {
		return mDAO.selectWritedList(userId);
	}


	@Override
	public int selectMyBoardListCount(Mypagepaging pagingDTO, String userId) {
		return mDAO.selectMyBoardListCount(pagingDTO, userId);
	}

	@Override
	public int existIdCheck(TransactionDTO dto) {
		return mDAO.existIdCheck(dto);
	}

	@Override
	public void insertTransaction(TransactionDTO dto) {
		mDAO.insertTransaction(dto);
	}

	@Override
	public int duplicateId(TransactionDTO dto) {
		return mDAO.duplicateId(dto);
	}

	@Override
	public int countClient(TransactionDTO dto) {
		return mDAO.countClient(dto);
	}

	@Override
	public List<BoardDTO> clientTransactionList(TransactionDTO dto) {
		return mDAO.clientTransactionList(dto);
	}

	@Override
	public String getCustomerId(String bno) {
		return mDAO.getCustomerId(bno);
	}

	public List<BoardDTO> selectFavoriteList(Mypagepaging pagingDTO, String userId) {
		return mDAO.selectFavoriteList(pagingDTO,userId);
	}

	//페이징 처리해서 좋아요 갯수 세기
	public int selectFavoritecount(Mypagepaging pagingDTO, String userId) {
		return mDAO.selectFavoritecount(pagingDTO,userId);
	}

	public int selectMyExchangeListCount(BoardPagingDTO pagingDTO, String buyerId){
		return mDAO.selectMyExchangeListCount(pagingDTO, buyerId);
	}
	
	public List<BoardDTO> selectExchangeList(BoardPagingDTO pagingDTO, String buyerId){
		
		return mDAO.selectExchangeList(pagingDTO, buyerId);
	}

}
