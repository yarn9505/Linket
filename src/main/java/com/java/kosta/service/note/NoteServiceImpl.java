package com.java.kosta.service.note;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.note.NoteDAO;
import com.java.kosta.dto.note.NoteVO;
import com.java.kosta.dto.note.PagingDTO;

@Service
public class NoteServiceImpl implements NoteService {

	@Inject
	NoteDAO dao;
	
	@Override
	public void sendInsert(NoteVO vo) {
		dao.sendInsert(vo);
	}

	@Override
	public void deliteFromSenderUpdate(String mno) {
		dao.deliteFromSenderUpdate(mno);
	}

	@Override
	public void deliteFromReceiverUpdate(String mno) {
		dao.deliteFromReceiverUpdate(mno);
	}

	@Override
	public void deleteBoth(String mno) {
		dao.deleteBoth(mno);
	}
	
	@Override
	public int totalCntSend(NoteVO vo) throws Exception {
		return dao.totalCntSend(vo);
	}

	@Override
	public List<NoteVO> listForSend(NoteVO vo, PagingDTO page) {
		return dao.listForSend(vo, page);
	}
	
	@Override
	public int totalCntRecv(NoteVO vo) throws Exception {
		return dao.totalCntRecv(vo);
	}

	@Override
	public List<NoteVO> listForReceiver(NoteVO vo, PagingDTO page) {
		return dao.listForReceiver(vo,page);
	}

	@Override
	public NoteVO readNote(String mno) {
		return dao.readNote(mno);
	}

	@Override
	public void readUpdate(String mno) {
		dao.readUpdate(mno);
	}
	
	@Override
	public int totalCntNotOpen(NoteVO vo) throws Exception {
		return dao.totalCntNotOpen(vo);
	}

	@Override
	public List<NoteVO> listNotOpen(NoteVO vo,PagingDTO page) {
		return dao.listNotOpen(vo, page);
	}

}
