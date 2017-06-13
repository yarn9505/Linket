package com.java.kosta.dao.note;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.note.NoteVO;
import com.java.kosta.dto.note.PagingDTO;

@Repository
public class NoteDAOImpl implements NoteDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void sendInsert(NoteVO vo) {
		sqlSession.insert("NoteMapper.sendInsert", vo);
	}

	@Override
	public void deliteFromSenderUpdate(String mno) {
		sqlSession.update("NoteMapper.delUpdateFromSender", mno);
	}

	@Override
	public void deliteFromReceiverUpdate(String mno) {
		sqlSession.update("NoteMapper.delUpdateFromRecv", mno);
	}

	@Override
	public void deleteBoth(String mno) {
		sqlSession.delete("NoteMapper.delBoth", mno);
	}
	
	@Override
	public int totalCntSend(NoteVO vo) throws Exception {
		return sqlSession.selectOne("NoteMapper.totalCntSend", vo);
	}

	@Override
	public List<NoteVO> listForSend(NoteVO vo,PagingDTO page) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("vo", vo);
		map.put("page", page);
		return sqlSession.selectList("NoteMapper.listForSend", map);
	}
	
	@Override
	public int totalCntRecv(NoteVO vo) throws Exception {
		return sqlSession.selectOne("NoteMapper.totalCntReceive", vo);
	}
	
	@Override
	public List<NoteVO> listForReceiver(NoteVO vo,PagingDTO page) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("vo", vo);
		map.put("page", page);
		return sqlSession.selectList("NoteMapper.listForReceive", map);
	}

	@Override
	public NoteVO readNote(String mno) {
		return sqlSession.selectOne("NoteMapper.readDetail", mno);
	}

	@Override
	public void readUpdate(String mno) {
		sqlSession.update("NoteMapper.readUpdate", mno);
	}
	
	@Override
	public int totalCntNotOpen(NoteVO vo) throws Exception {
		return sqlSession.selectOne("NoteMapper.totalCntNotOpen", vo);
	}


	@Override
	public List<NoteVO> listNotOpen(NoteVO vo,PagingDTO page) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("vo", vo);
		map.put("page", page);
		return sqlSession.selectList("NoteMapper.listNotOpen",map);
	}



	
	
	
	

}
