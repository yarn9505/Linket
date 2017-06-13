package com.java.kosta.dao.note;

import java.util.List;

import com.java.kosta.dto.note.NoteVO;
import com.java.kosta.dto.note.PagingDTO;

public interface NoteDAO {

	// 1. 쪽지 보내기(쪽지 내용 insert)
	public void sendInsert(NoteVO vo);
		
	// 2-1) 보낸이가 삭제한 경우 : update 쿼리 -> sender_del = Y 로 업데이트
	public void deliteFromSenderUpdate(String mno);
	
	// 2-2) 받은이가 삭제한 경우 : update 쿼리 -> recv_del = Y 로 업데이트
	public void deliteFromReceiverUpdate(String mno);
	
	// 2-3) sender_del과 recv_del 이 모두 Y 인 경우 해당 튜플을 delete하는 쿼리 // 둘 다 Y 인경우만 삭제되고 각 보낸보관함, 받는 보관함에서 삭제한 경우 Y로 업데이트만!
	public void deleteBoth(String mno);
	
	// 3. 쪽지 보관함 쿼리(쪽지 목록 가져오기)
	//보낸 쪽지함 쪽지 갯수
	public int totalCntSend(NoteVO vo) throws Exception;
	
	// 3-1) 보낸 보관함용 쿼리 : 보낸이 == ${보낸이} && sender_del=N 인 것들 List<VO>로 반환
	public List<NoteVO> listForSend(NoteVO vo,PagingDTO page);
	
	//받은 쪽지함의 쪽지 갯수
	public int totalCntRecv(NoteVO vo) throws Exception;
	
	// 3-2) 받은이 보관함용 쿼리 : 받은이 == ${받은이} && recv_del=N 인 것들 List<VO>로 반환
	public List<NoteVO> listForReceiver(NoteVO vo,PagingDTO page);
	
	// 4. 쪽지 읽기용 쿼리(상세 읽기) : 쪽지 정보 가져오기
	// 4-1) 쪽지의 정보를 읽는 쿼리 : 리스트에서 뿌려지고 있는 no를 이용해 VO를 반환하는 쿼리
	public NoteVO readNote(String mno);
	
	// 4-2) 쪽지를 읽는 순간 받은이가 읽은시간을 now()로 갱신(update)하고 받은이가 읽었는지 유무(recv_read)를 Y로 update(수정)하는 쿼리	  
	public void readUpdate(String mno);
	
	//안 읽은 쪽지함의 쪽지 갯수
	public int totalCntNotOpen(NoteVO vo) throws Exception;
	
	// 4-3) 안 읽은 쪽지 리스트 가져오기
	public List<NoteVO> listNotOpen(NoteVO vo,PagingDTO page);
	
}
