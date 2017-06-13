/*package com.java.kosta.controller.board.category;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.junit.runner.Request;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.kosta.common.MediaUtils;
import com.java.kosta.common.UploadFileUtils;


@Controller
@RequestMapping("/board/*")
public class UploadControllerAjax {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws IOException{
		System.out.println("OriginalFilename : " + file.getOriginalFilename());
		System.out.println("size : " + file.getSize());
		
		String fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		return fileName;
	}
	
	
	*//** 파일 화면에 표시하기 *//*
	@RequestMapping(value="/displayFile")
	@ResponseBody
	public ResponseEntity<byte[]> displayFile(String fileName) throws IOException{
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);	//확장자 추출
			MediaType mType = MediaUtils.getMediaType(formatName);	// 이미지 파일인지 타입 검사
			
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null){		
				// 이미지 파일일 경우 그대로 타입 지정
				headers.setContentType(mType);	
			}else{
				// 일반 파일일 경우 다운로드 용으로 지정해서 헤더에 저장
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);	// MIME 타입을 다운로드 용으로 지정
				headers.add("Content-Disposition", "attachment; filename=\""+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");	// 한글처리 
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
			
		} catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		
		return entity;
	}
	
	
	*//** 이미지 파일 삭제(썸네일에서 X 표시 눌렀을 때) *//*
	@RequestMapping(value="/deleteFile")
	@ResponseBody
	public String deleteFile(String fileName){
		System.out.println("delete file : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);	//확장자 추출
		MediaType mType = MediaUtils.getMediaType(formatName);					//확장자가 이미지파일인지 
		
		if(mType != null){	//이미지 파일이면 썸네일을 제거한 원본 파일 경로 추출해서 삭제
			String front = fileName.substring(0, 12);	
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}
		
		// 썸네일 파일 삭제
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return "deleted";
	}
}
*/