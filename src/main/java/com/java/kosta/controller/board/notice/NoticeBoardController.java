package com.java.kosta.controller.board.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.board.BoardService;

@Controller
@RequestMapping("/notice/*")
public class NoticeBoardController {

   @Inject
   BoardService service;
   
   /** 게시판 보기 */
   @RequestMapping("/boardList")
   public String noticeBoardList(BoardPagingDTO pagingDTO, Model model, @RequestParam(value="cateId") int cateId){
      try {
         // 전체 레코드 갯수 획득
         int totRecord = service.selectBoardListTotalCount(pagingDTO, cateId);
         // 페이징 계산
         pagingDTO.calcPage(totRecord);

         //받아온 cateId로 카테고리명 조회
         CategoryDTO cateDTO = service.selectCategory(cateId);
         model.addAttribute("cateDTO", cateDTO);
         
         // cateId에 해당하는 board 데이터 리스트로 가져와서 전달하기
         List<BoardDTO> list = service.selectBoardList(pagingDTO, cateId);
         model.addAttribute("boardList", list);
         model.addAttribute("pagingDTO", pagingDTO);
      
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "menu/notice/boardList";
   }
   
   /** 글작성 form */
   @RequestMapping("/writeBoardForm")
   public String writeBoardForm(Model model, HttpServletRequest req, @RequestParam(value="cateId")int cateId){
      
      try{
         //카테고리 조회해서 전달하기
         CategoryDTO cateDTO = service.selectCategory(cateId);
         model.addAttribute("cateDTO", cateDTO);
         
         UserVO loginSession= (UserVO) req.getSession().getAttribute(Constants.LOGINSESSION);   //로그인 세션 가져오기
         model.addAttribute("loginSession", loginSession);
         
      }catch(Exception e){
         e.printStackTrace();
      }
      return "/menu/notice/writeBoardForm";
   }
   
   /** 글작성 처리 insert */
   @RequestMapping("/writeBoardProc")
   public String writeBoardProc(BoardDTO boardDTO, RedirectAttributes redir){
      
      try {
         // board 테이블에 데이터 삽입하기
         service.insertBoard(boardDTO);
         
         redir.addAttribute("result", "ok");
      
      } catch (Exception e) {
         redir.addAttribute("result", "fail");
         e.printStackTrace();
      }
      
      return "redirect:/notice/boardList?cateId="+boardDTO.getCateId();
   }
   
   /** 선택 게시글 상세 보기 */
   @RequestMapping("/detailContent")
   public String detailContent(@RequestParam(value="bno") String bNo, Model model){
      try {
         // 게시글 한건 조회
         BoardDTO dto = service.selectBoardOne(bNo);
         
         // 해당 게시글 조회수 +1
         service.updateViewCnt(bNo);
         model.addAttribute("boardDTO", dto);
         
         //카테고리 조회
         CategoryDTO cateDTO = service.selectCategory(dto.getCateId());
         model.addAttribute("cateDTO", cateDTO);

      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "/menu/notice/detailContent";
   }
   
   /** 선택 게시글 수정 폼*/
   @RequestMapping("/updateContentForm")
   public String updateContentForm(BoardDTO boardDTO, Model model){
      try {
         // 게시글 한건 조회
         BoardDTO dto = service.selectBoardOne(boardDTO.getbNo());
         model.addAttribute("boardDTO", dto);
         
         //카테고리 조회
         CategoryDTO cateDTO = service.selectCategory(dto.getCateId());
         model.addAttribute("cateDTO", cateDTO);

      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/menu/notice/updateContentForm";
   }
   
   /** 선택 게시글 수정 처리 */
   @RequestMapping("/updateContentProc")
   public String updateContentProc(BoardDTO boardDTO, Model model, @RequestParam(value="pageNo")String pageNo){
      BoardDTO bDTO = null;
      try {
         // DB update
         service.updateBoard(boardDTO);
         //카테고리 아이디 가져오기 위한 게시글 한건 검색
         bDTO = service.selectBoardOne(boardDTO.getbNo());   
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "redirect:/notice/boardList?cateId="+bDTO.getCateId()+"&pageNo="+pageNo;
   }
   
   /** 선택 게시글 삭제 처리 */
   @RequestMapping("/deleteContentProc")
   public String deleteContentProc(@RequestParam(value="bno") String bNo, @RequestParam(value="cateId")int cateId
		   , @RequestParam(value="pageNo")String pageNo, Model model){
      try {

         // 댓글 table의 bno에 해당하는 댓글들 모두 삭제
         service.deleteBoardReplyAll(bNo);
         // DB delete
         service.deleteBoard(bNo);

      } catch (Exception e) {
         e.printStackTrace();
      }
      return "redirect:/notice/boardList?cateId="+cateId+"&pagNo="+pageNo;
   }
}