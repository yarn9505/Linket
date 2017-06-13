package com.java.kosta.validation;

import java.util.HashMap;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.java.kosta.dto.note.NoteVO;

public class ValidationForNote implements Validator{
	HashMap<String, String> ErrorObj = new HashMap<String,String>();
	public int errorSize = 0;
	
	
	public int getErrorSize() {
		return errorSize;
	}


	public void setErrorSize(int errorSize) {
		this.errorSize = errorSize;
	}


	public ValidationForNote() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ValidationForNote(HashMap<String, String> errorObj) {
		super();
		ErrorObj = errorObj;
	}



	@Override
	public boolean supports(Class<?> arg0) {
		return false;
	}

	@Override
	public void validate(Object obj, Errors errors) {
		NoteVO check = null;
		String recvId = "";
		String mtitle = "";
		String mcontent = "";
		
		if ( obj != null ){
			check = (NoteVO)obj;
			recvId = check.getRecvId();
			mtitle = check.getMtitle();
			mcontent = check.getMcontent();
		}
		
		if ( recvId == null || recvId.equals("") ){
			errors.rejectValue("recvId", "보내는이 id를 입력하세요");
			ErrorObj.put("ErecvId", "보내는이를 입력하세요");
		}
		if ( mtitle == null || mtitle.equals("") ){
			errors.rejectValue("mtitle", "제목을 입력하세요");
			ErrorObj.put("Etitle", "제목을 입력하세요");
		}
		if ( mcontent == null || mcontent.equals("") ){
			errors.rejectValue("mcontent", "내용을 입력하세요");
			ErrorObj.put("Econtent", "내용을 입력하세요");
		}
		
		this.errorSize = ErrorObj.size();
	}

	public HashMap<String, String> result(){
		return ErrorObj;
	}
	
}
