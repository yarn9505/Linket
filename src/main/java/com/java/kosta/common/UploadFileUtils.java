package com.java.kosta.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

/** 파일 업로드를 위한 클래스 */
public class UploadFileUtils {
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws IOException {	//파일 저장 경로, 원본 파일 이름, 파일 데이터
		
		UUID uid = UUID.randomUUID();
		originalName = originalName.toLowerCase();	//파일 이름을 소문자로 변환
		
		String savedName = uid.toString() + "_" + originalName;	// 고유아이디_파일이름
		String savedPath = calcPath(uploadPath);	// 파일 경로 (/년/월/일) 계산
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);	//원본 파일 저장
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);	// 원본 파일의 확장자
		String uploadedFileName = null;
		// MediaUtils 를 이용해 이미지 파일인지 검사하고 맞으면 썸네일 생성, 아니면 일반 아이콘 생성 
		// jpeg 파일은 인식 못하므로 썸네일 생성 못함
		if(MediaUtils.getMediaType(formatName) != null){	
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	// 이미지 파일이 아닐경우
	private static String makeIcon(String uploadPath, String path, String fileName) {
		String iconName = uploadPath + path + File.separator + fileName;	// 단순 파일 경로 반환
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	/** 파일 총 경로 반환 */
	private static String calcPath(String uploadPath){
		// 파일 업로드 경로 /년/월/일 
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);	
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		System.out.println(datePath);
		return datePath;
	}
	
	/** 디렉터리 경로 생성 */
	private static void makeDir(String uploadPath, String...paths){
		
		// 폴더가 존재하면 리턴
		if(new File(paths[paths.length-1]).exists()){
			return;
		}
		
		for(String path : paths){
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists()){
				dirPath.mkdir();
			}
		}
	}
	
	/** 썸네일 이미지 생성하기 
	 * @throws IOException 
	 * @param uploadPath : 기본경로
	 * @param path : 년/월/일  이미지 경로
	 * @param fileName : 파일 이름
	 * */
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws IOException{
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));	//파일경로에서 이미지 가져오기
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);	//썸네일 이미지 크기 지정하고 저장할 변수
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;	//썸네일 이름지정
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);	
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');	// '\'를  '/'로 치환
	}
	
}
