package com.java.kosta.service.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.java.kosta.common.Constants;
import com.java.kosta.dao.board.BoardDAO;
import com.java.kosta.dto.board.BoardAttachDTO;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;

@Service
public class BoardServiceImpl implements BoardService{
	
	// 레파지토리 경로
	@Value("#{config['file.upload.path']}")
	private String FILE_UPLOAD_PATH;
	// 보드 이미지 폴더 경로
	@Value("#{config['upload.board.img.path']}")
	private String UPLOAD_BOARD_IMG_PATH;
	// 보드 파일 폴더 경로
	@Value("#{config['upload.board.file.path']}")
	private String UPLOAD_BOARD_FILE_PATH;
	// 다음 에디터 이미지 임시 폴더 경로
	@Value("#{config['upload.daum.editor.image.temp.path']}")
	private String UPLOAD_DAUM_EDITOR_IMAGE_TEMP_PATH;
	// 다음 에디터 파일 임시 폴더 경로
	@Value("#{config['upload.daum.editor.file.temp.path']}")
	private String UPLOAD_DAUM_EDITOR_FILE_TEMP_PATH;

	@Inject
	BoardDAO bDAO;
	
	
	@Override
	public BoardDTO selectBoardOne(String bNo) throws Exception {
		return bDAO.selectBoardOne(bNo);
	}

	@Override
	public int selectBoardListTotalCount(BoardPagingDTO pagingDTO, int cateId) throws Exception{
		return bDAO.selectBoardListTotalCount(pagingDTO, cateId);
	}

	@Override
	public List<BoardDTO> selectBoardList(BoardPagingDTO pagingDTO, int cateId) throws Exception{
		return bDAO.selectBoardList(pagingDTO, cateId);
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception{
		bDAO.insertBoard(boardDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) throws Exception{
		// board 테이블 수정
		bDAO.updateBoard(boardDTO);
		
		// boardfile 테이블  해당 게시글의 파일 삭제
//		bDAO.deleteAttach(boardDTO.getbNo());
//		
//		String[] files = boardDTO.getFiles();
//		
//		if(files == null){
//			System.out.println("updateBoard : 파일이 존재하지 않음");
//			return;
//		}
//		
//		for (String fileName : files) {
//			// 업로드 파일 다시 삽입
//			bDAO.addAttach(boardDTO.getbNo(), fileName);
//		}
//		
		
	}

	@Override
	public void deleteBoard(String bNo) throws Exception{
		// 댓글 table의 bno에 해당하는 댓글들 모두 삭제
		bDAO.deleteBoardReplyAll(bNo);

		// 좋아요 테이블에 해당 게시글 데이터 삭제
		bDAO.deleteFavorite(bNo);
		
		// 파일테이블에 있는 해당 파일들을 폴더 경로에서 삭제
		List<BoardAttachDTO> fileList = bDAO.selectAttach(bNo);
		for(BoardAttachDTO fileBean : fileList){
			// 파일 경로
			String filePath = fileBean.getFileName();
			File delFile = new File(FILE_UPLOAD_PATH + filePath);
			
			// 폴더에서 해당 파일 삭제
			delFile.delete();
			System.out.println("파일 삭제 : " +filePath);
		}
		
		// 업로드 파일 테이블 삭제
		bDAO.deleteAttach(bNo);
		
		// 게시글 삭제
		bDAO.deleteBoard(bNo);
		
	}

	@Override
	public void updateViewCnt(String bNo) throws Exception{
		bDAO.updateViewCnt(bNo);
	}

/////////////////////////////////////////// 카테고리 ////////////////////////////////////////////////	
	
	@Override
	public CategoryDTO selectCategory(int cateId) throws Exception{
		return bDAO.selectCategory(cateId);
	}

	@Override
	public void deleteBoardReplyAll(String bNo) throws Exception{
		bDAO.deleteBoardReplyAll(bNo);
	}
	
	/////////////////////////////////// 좋아요////////////////////////////////////////////
	@Override
	public int searchFavorite(String id, String bNo) {
		return bDAO.searchFavorite(id, bNo);
	}

	@Override
	public void favoriteBoard(String id, String bNo) {
		bDAO.favoriteBoard(id, bNo);
	}

	@Override
	public void unfavoriteBoard(String id, String bNo) {
		bDAO.unfavoriteBoard(id, bNo);
	}

	@Override
	public void deleteFavorite(String bNo){
		bDAO.deleteFavorite(bNo);
	}

	@Override
	public int countFavorite(String bNo) {
		return bDAO.countFavorite(bNo);
	}

	// 게시글 + 파일업로드 삽입
//	@Override
//	public void insertBoardAttach(BoardDTO boardDTO) {
//		bDAO.insertBoard(boardDTO);	// board 테이블에 게시글 삽입
//		System.out.println("게시글 삽입 성공");
//		
//		String[] files = boardDTO.getFiles();
//		
//		if(files == null){
//			System.out.println("insertBoardAttach : 파일이 존재하지 않음");
//			return;
//		}
//		
//		for (String fileName : files ) {
//			System.out.println("DB 삽입 "+ boardDTO.getbNo() +", " + fileName);
//			bDAO.addAttach(boardDTO.getbNo(), fileName);	// board_attach 테이블에 첨부파일 삽입
//		}
//		System.out.println("파일 테이블 삽입 성공");
//	}

	@Override
	public List<BoardAttachDTO> selectAttach(String bNo) {
		return bDAO.selectAttach(bNo);
	}

	@Override
	public void deleteBoardAttach(String bNo) throws Exception {
		bDAO.deleteAttach(bNo);
	}

	@Override
	public String getAddr(String id) {
		return bDAO.getAddr(id);
	}

	/** 다음에디터를 이용한 게시글 삽입 */
	@Override
	public void insertBoardDaumAttach(BoardDTO boardDTO) throws Exception {

		//경로변경 처리 (임시경로 -> 실제 저장 경로)
		String content = boardDTO.getbContent().replaceAll(UPLOAD_DAUM_EDITOR_IMAGE_TEMP_PATH, UPLOAD_BOARD_IMG_PATH );
		String content2 = content.replaceAll(UPLOAD_DAUM_EDITOR_FILE_TEMP_PATH, UPLOAD_BOARD_FILE_PATH );
		
		boardDTO.setbContent(content2);
		
		// 게시글 테이블 삽입
		bDAO.insertBoard(boardDTO);
		
		//이미지 처리
		if( boardDTO.getImgPath() != null && boardDTO.getImgPath().length > 0 ) {
			
			for(int i=0; i<boardDTO.getImgPath().length; i++) {
				
				String tmpImgPathName = boardDTO.getImgPath()[i];	//임시경로
				//path의 경로를 바꾼다.
				String orgImgPathName = tmpImgPathName.replace(UPLOAD_DAUM_EDITOR_IMAGE_TEMP_PATH, UPLOAD_BOARD_IMG_PATH);	
				
				//insert
				BoardAttachDTO boardAttachDTO = new BoardAttachDTO();
				boardAttachDTO.setbNo( boardDTO.getbNo() );
				boardAttachDTO.setAttachType(Constants.IMG_TYPE_BOARD);
				boardAttachDTO.setFileName( orgImgPathName );
				boardAttachDTO.setFileSize( boardDTO.getImgSize()[i] );
				boardAttachDTO.setOriginName( boardDTO.getImgOriginName()[i] );
				
				// 파일 DB 삽입
				bDAO.addAttach(boardAttachDTO);
				
				//파일 복사 작업 (템프 --> 원본 폴더로)
				File boardImgTempFile = new File(FILE_UPLOAD_PATH + tmpImgPathName);	// 임시경로의 파일 생성

				String boardImgPath = UPLOAD_BOARD_IMG_PATH + "/" + boardImgTempFile.getName();

				File boardImgFile = new File(FILE_UPLOAD_PATH + "/" + boardImgPath);	// 실제 경로의 파일 생성

				// 정상적인 프로세스상 파일 이동이 이동되어야 하지만,
				// 파일 복사로 변경
				try {
					FileUtils.copyFile(boardImgTempFile, boardImgFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}//end for
		}
		
		// temp 폴더 이미지 삭제
		File images[] = new File(FILE_UPLOAD_PATH + UPLOAD_DAUM_EDITOR_IMAGE_TEMP_PATH).listFiles();
		if(images !=null){
			for (int i = 0; i < images.length; i++) {
				System.out.println(images[i].getName());
				images[i].delete();
			}
		}
		
		
		//파일 처리
		if( boardDTO.getFilePath() != null && boardDTO.getFilePath().length > 0 ) {
			
			for(int i=0; i<boardDTO.getFilePath().length; i++) {
				
				String tmpFilePathName = boardDTO.getFilePath()[i];
				//path의 경로를 바꾼다.
				String orgFilePathName = tmpFilePathName.replace(UPLOAD_DAUM_EDITOR_FILE_TEMP_PATH, UPLOAD_BOARD_FILE_PATH);
				
				//insert
				BoardAttachDTO boardAttachDTO = new BoardAttachDTO();
				boardAttachDTO.setbNo( boardDTO.getbNo() );
				boardAttachDTO.setAttachType( Constants.FILE_TYPE_BOARD );
				boardAttachDTO.setFileName( orgFilePathName );
				boardAttachDTO.setFileSize( boardDTO.getFileSize()[i] );
				boardAttachDTO.setOriginName( boardDTO.getFileOriginName()[i] );
				//DB
//				boardAttachDao.insertBoardAttach( attachBean );
				bDAO.addAttach(boardAttachDTO);
				
				//파일 복사 작업 (템프 --> 원본 폴더로)
				File boardFileTempFile = new File(FILE_UPLOAD_PATH + tmpFilePathName);

				String boardFilePath = UPLOAD_BOARD_FILE_PATH + "/" + boardFileTempFile.getName();

				File boardFileFile = new File(FILE_UPLOAD_PATH + "/" + boardFilePath);

				// 정상적인 프로세스상 파일 이동이 이동되어야 하지만,
				// 파일 복사로 변경
				try {
					FileUtils.copyFile(boardFileTempFile, boardFileFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		// temp 폴더 이미지 삭제
		File files[] = new File(FILE_UPLOAD_PATH + UPLOAD_DAUM_EDITOR_FILE_TEMP_PATH).listFiles();
		if(files !=null){
			for (int i = 0; i < files.length; i++) {
				System.out.println(files[i].getName());
				files[i].delete();
			}
		}
	}

	
	/** 게시글 수정 처리 */
	@Override
	public void updateBoardDaumAttach(BoardDTO boardDTO) throws Exception {
		// 해당 게시글의 파일 데이터를 모두 삭제하고 다시 새로 삽입
		
		// 해당 게시글의 파일 리스트 조회
		List<BoardAttachDTO> fileList = bDAO.selectAttach(boardDTO.getbNo());
		
		// 실제 경로에서 해당 파일 삭제
//		for(BoardAttachDTO fileBean : fileList){
//			boolean isExist = false;
//			// 파일 경로
//			String filePath = fileBean.getFileName();
//			// 수정되지 않은 이미 존재하는  파일이면 삭제하지 않음
//			for (int i = 0; i < boardDTO.getImgPath().length; i++) {
//				if(filePath.equals(boardDTO.getImgPath()[i])){
//					isExist = true;
//				}
//			}
//			
//			// 파일 테이블의 경로가 새로 받아온 이미지 경로와 같은게 없으면 기존 파일 삭제 (수정되어서 없어진 파일)
//			if(!isExist){
//				File delFile = new File(FILE_UPLOAD_PATH + filePath);
//				
//				// 폴더에서 해당 파일 삭제
//				delFile.delete();
//				System.out.println("파일 삭제 : " +filePath);
//			}
//		}
		
		// 파일 테이블에서 모두 삭제
		bDAO.deleteAttach(boardDTO.getbNo());
		
		//경로변경 처리
		String content = boardDTO.getbContent().replaceAll(UPLOAD_DAUM_EDITOR_IMAGE_TEMP_PATH, UPLOAD_BOARD_IMG_PATH );
		String content2 = content.replaceAll(UPLOAD_DAUM_EDITOR_FILE_TEMP_PATH, UPLOAD_BOARD_FILE_PATH );
		boardDTO.setbContent(content2);
		
		// 게시글 업데이트
		bDAO.updateBoard(boardDTO);
		
		// 파일 테이블에 새로 추가
		//이미지 처리
		if( boardDTO.getImgPath() != null && boardDTO.getImgPath().length > 0 ) {
			
			for(int i=0; i<boardDTO.getImgPath().length; i++) {
				
				String tmpImgPathName = boardDTO.getImgPath()[i];	//임시경로
				//path의 경로를 바꾼다.
				String orgImgPathName = tmpImgPathName.replace(UPLOAD_DAUM_EDITOR_IMAGE_TEMP_PATH, UPLOAD_BOARD_IMG_PATH);	//실제경로로 교체
				
				//insert
				BoardAttachDTO baDTO = new BoardAttachDTO();
				baDTO.setbNo(boardDTO.getbNo());
				baDTO.setAttachType( Constants.IMG_TYPE_BOARD );
				baDTO.setFileName( orgImgPathName );
				baDTO.setFileSize( boardDTO.getImgSize()[i] );
				baDTO.setOriginName( boardDTO.getImgOriginName()[i] );
				//DB
				bDAO.addAttach(baDTO);
				
				//파일 복사 작업 (템프 --> 원본 폴더로)
				File boardImgTempFile = new File(FILE_UPLOAD_PATH + tmpImgPathName);

//				String boardImgPath = UPLOAD_BOARD_IMG_PATH + "/" + boardImgTempFile.getName();

				File boardImgFile = new File(FILE_UPLOAD_PATH + orgImgPathName);

				// 실제 경로에 이미 있는 파일이면 복사하지 않음. 없는 파일이면 복사
				if(!boardImgTempFile.getPath().equals(boardImgFile.getPath())){
					
					// 파일 복사
					try {
						FileUtils.copyFile(boardImgTempFile, boardImgFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
				
				}
			}//end for
		}
		// temp 폴더 이미지 삭제
		File images[] = new File(FILE_UPLOAD_PATH + UPLOAD_DAUM_EDITOR_IMAGE_TEMP_PATH).listFiles();
		if(images !=null){
			for (int i = 0; i < images.length; i++) {
				System.out.println(images[i].getName());
				images[i].delete();
			}
		}
		
		//파일 처리
		if( boardDTO.getFilePath() != null && boardDTO.getFilePath().length > 0 ) {
			
			for(int i=0; i<boardDTO.getFilePath().length; i++) {
				
				String tmpFilePathName = boardDTO.getFilePath()[i];
				//path의 경로를 바꾼다.
				String orgFilePathName = tmpFilePathName.replace(UPLOAD_DAUM_EDITOR_FILE_TEMP_PATH, UPLOAD_BOARD_FILE_PATH);
				
				//insert
				BoardAttachDTO baDTO = new BoardAttachDTO();
				baDTO.setbNo(boardDTO.getbNo());
				baDTO.setAttachType( Constants.FILE_TYPE_BOARD );
				baDTO.setFileName( orgFilePathName );
				baDTO.setFileSize( boardDTO.getFileSize()[i] );
				baDTO.setOriginName( boardDTO.getFileOriginName()[i] );
				//DB
				bDAO.addAttach(baDTO);
				
				//파일 복사 작업 (템프 --> 원본 폴더로)
				File boardFileTempFile = new File(FILE_UPLOAD_PATH + tmpFilePathName);

//				String boardFilePath = UPLOAD_BOARD_FILE_PATH + "/" + boardFileTempFile.getName();

				File boardFileFile = new File(FILE_UPLOAD_PATH + "/" + orgFilePathName);

				// 실제 경로에 이미 있는 파일이면 복사하지 않음. 없는 파일이면 복사
				if(!boardFileTempFile.getPath().equals(boardFileFile.getPath())){
				
					// 정상적인 프로세스상 파일 이동이 이동되어야 하지만,
					// 파일 복사로 변경
					try {
						FileUtils.copyFile(boardFileTempFile, boardFileFile);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}// end of for
		}
		// temp 폴더 이미지 삭제
		File files[] = new File(FILE_UPLOAD_PATH + UPLOAD_DAUM_EDITOR_FILE_TEMP_PATH).listFiles();
		if(files !=null){
			for (int i = 0; i < files.length; i++) {
				System.out.println(files[i].getName());
				files[i].delete();
			}
		}
	}
}// end of class

