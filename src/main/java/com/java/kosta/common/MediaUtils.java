package com.java.kosta.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

/** 이미지(jpg, gif, png) 파일을 처리하기 위한 이미지 타입 식별 
 * 		jpeg 파일은 인식 못함!!!!!
 * */

public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	
	static{
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type){
		return mediaMap.get(type.toUpperCase());
	}
}
