package com.java.kosta.controller.board.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.board.BoardAttachDTO;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.board.BoardServiceImpl;

@Controller
@RequestMapping("/board/category/*")
public class BoardController {
	Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Inject
	BoardServiceImpl service;

//	@Resource(name = "uploadPath")
//	private String uploadPath;

	// 한글을 넘기기 때문에 produces 를 기술해서 인코딩을 해서 넘겨주었다. 기술안하면 ajax에서 받았을 때 ???로 깨짐!
	@RequestMapping(value="/board/category/getAddr",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public @ResponseBody String getAddr(String userId){
		logger.info("주소얻기로 넘어온 아이디 : " + userId);
		String address = service.getAddr(userId);
		logger.info("얻어온 주소 : " + address);
		return address;
	}
	
	@RequestMapping(value="/testEditor")
	public String testEditor(){
		return "/board/category/testEditor";
	}
	
	/** 게시판 보기 */
	@RequestMapping("/boardList")
	public String boardList(BoardPagingDTO pagingDTO, Model model, @RequestParam(value = "cateId") int cateId) {
		try {
			// 전체 레코드 갯수 획득
			int totRecord = service.selectBoardListTotalCount(pagingDTO, cateId);
			// 페이징 계산
			pagingDTO.calcPage(totRecord);

			// 받아온 cateId로 카테고리명 조회
			CategoryDTO cateDTO = service.selectCategory(cateId);
			model.addAttribute("cateDTO", cateDTO);

			// cateId에 해당하는 board 데이터 리스트로 가져와서 전달하기
			List<BoardDTO> list = service.selectBoardList(pagingDTO, cateId);
			model.addAttribute("boardList", list);
			model.addAttribute("pagingDTO", pagingDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/board/category/boardList";
	}

	/** 글작성 form */
	@RequestMapping("/writeBoardForm")
	public String writePetForm(Model model, HttpServletRequest req, @RequestParam(value = "cateId") int cateId) {

		try {
			// 카테고리 조회해서 전달하기
			CategoryDTO cateDTO = service.selectCategory(cateId);
			model.addAttribute("cateDTO", cateDTO);

			// 로그인 세션 정보 넘기기
			UserVO loginSession = (UserVO) req.getSession().getAttribute(Constants.LOGINSESSION);
			model.addAttribute("loginSession", loginSession);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/category/writeBoardForm";
	}

	/** 글작성 처리 insert */
//	@RequestMapping(value = "/writeBoardProc", method = RequestMethod.POST)
//	public String writePetProc(BoardDTO boardDTO, RedirectAttributes redir) {
//
//		try {
//			// 게시글 및 파일 테이블에 삽입
//			service.insertBoardAttach(boardDTO);
//
//			redir.addAttribute("result", "ok");
//
//		} catch (Exception e) {
//			redir.addAttribute("result", "fail");
//			e.printStackTrace();
//		}
//
//		return "redirect:/board/category/boardList?cateId=" + boardDTO.getCateId();
//	}
	
	/** 글작성 처리 insert */
	@RequestMapping(value = "/writeBoardProc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> writeBoardProc(BoardDTO boardDTO) {

		Map<String,Object> resMap = new HashMap<String, Object>();
		
		try {
			// 게시글 및 파일 테이블에 삽입
//			service.insertBoardAttach(boardDTO);
			
			service.insertBoardDaumAttach(boardDTO);

			resMap.put(Constants.RESULT, Constants.RESULT_OK);
			resMap.put("bNo", boardDTO.getbNo());
		} catch (Exception e) {
			resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
			e.printStackTrace();
		}

		return resMap;
	}

	/** 선택 게시글 상세 보기 */
	@RequestMapping("/detailContent")
	public String detailContent(@RequestParam(value = "bno") String bNo, Model model, HttpServletRequest req) {
		try {
			// 게시글 한건 조회
			BoardDTO dto = service.selectBoardOne(bNo);

			// 해당 게시글 조회수 +1
			service.updateViewCnt(bNo);
			model.addAttribute("boardDTO", dto);

			// 카테고리 조회
			CategoryDTO cateDTO = service.selectCategory(dto.getCateId());
			model.addAttribute("cateDTO", cateDTO);

			// 로그인 세션 정보 넘기기
			// 작성자와 로그인 세션 아이디가 같을 경우만 글삭제/글수정 버튼 보이도록 하기 위해
			UserVO loginSession = (UserVO) req.getSession().getAttribute(Constants.LOGINSESSION);
			model.addAttribute("loginSession", loginSession);
			System.out.println(loginSession.getUserId());

			// 선택 게시글의 업로드 파일 리스트 가져오기
			List<BoardAttachDTO> baList = service.selectAttach(bNo);
			model.addAttribute("baList", baList); // 해당 게시물의 파일 리스트 넘기기

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/board/category/detailContent";
	}

	/** 선택 게시글 수정 폼 */
	@RequestMapping("/updateContentForm")
	public String updateContentForm(BoardDTO boardDTO, Model model) {
		try {
			// 게시글 한건 조회
			BoardDTO dto = service.selectBoardOne(boardDTO.getbNo());
			model.addAttribute("boardDTO", dto);
			
			//게시글의 업로드 파일리스트 가져오기
			List<BoardAttachDTO> baList = service.selectAttach(boardDTO.getbNo());
			model.addAttribute("baList", baList); // 해당 게시물의 파일 리스트 넘기기

			// 카테고리 조회
			CategoryDTO cateDTO = service.selectCategory(dto.getCateId());
			model.addAttribute("cateDTO", cateDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/category/updateContentForm";
	}
	
	/** 글 수정 처리  */
	@RequestMapping(value = "/updateBoardProc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateBoardProc(BoardDTO boardDTO, @RequestParam(value="pageNo")String pageNo) {

		Map<String,Object> resMap = new HashMap<String, Object>();
		
		try {
			// 게시글 및 파일 테이블 update
			service.updateBoardDaumAttach(boardDTO);
			
			resMap.put(Constants.RESULT, Constants.RESULT_OK);
			resMap.put("bNo", boardDTO.getbNo());
			resMap.put("pageNo", pageNo);
		} catch (Exception e) {
			resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
			e.printStackTrace();
		}

		return resMap;
	}

	/** 선택 게시글 수정 처리 */
//	@RequestMapping("/updateContentProc")
//	public String updateContentProc(BoardDTO boardDTO, Model model, @RequestParam(value="pageNo")String pageNo) {
//		BoardDTO bDTO = null;
//		try {
//			// DB update ( board 테이블, boardfile 테이블)
//			service.updateBoard(boardDTO);
//			
//			
//			// 카테고리 아이디 가져오기 위한 게시글 한건 검색
//			bDTO = service.selectBoardOne(boardDTO.getbNo());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/board/category/boardList?cateId=" + bDTO.getCateId()+"&pageNo="+pageNo;
//	}

	/** 선택 게시글 삭제 처리 */
	@RequestMapping("/deleteContentProc")
	public String deleteContentProc(@RequestParam(value = "bno") String bNo, @RequestParam(value = "cateId") int cateId,
			@RequestParam(value="pageNo")String pageNo, Model model) {
		try {

			// DB delete
			service.deleteBoard(bNo);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/category/boardList?cateId=" + cateId+"&pageNo="+pageNo;
	}
}