package com.java.kosta.controller.board.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.BoardReplyDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.board.BoardReplyServiceImpl;

@RestController
@RequestMapping("/replies")
public class BoardReplyController {
   Logger logger = LoggerFactory.getLogger(BoardReplyController.class);
   
   @Inject
   private BoardReplyServiceImpl service;
   
   /** 댓글 작성 */
   @RequestMapping(value="/insertBoardReply", method=RequestMethod.POST)
   public Map<String, Object> insertBoardReply(@RequestBody BoardReplyDTO brDTO){
      logger.info("insertBoardReply() : 댓글 삽입");
      
      Map<String, Object> resMap = new HashMap<String, Object>();
      resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
      resMap.put(Constants.RESULT_MSG, "댓글 삽입 실패");
      try {
         // DB에 댓글 삽입
         service.insertBoardReply(brDTO);
         resMap.put(Constants.RESULT, Constants.RESULT_OK);
         resMap.put(Constants.RESULT_MSG, "댓글 삽입 성공");
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return resMap;
   }
   
   
   /** 댓글 리스트  AJAX로 뿌려주기 */
   @RequestMapping("/boardReplyAjax")
   public Map<String, Object> boardReplyAjax(BoardPagingDTO pagingDTO, HttpServletRequest req) {
      logger.info("detailContentAjax() : 댓글 리스트 Json으로 뿌리기");
      
      int num=0;
      
      
      UserVO vo = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
      String userId = vo.getUserId();
      
      Map<String, Object> resMap = new HashMap<String, Object>();
      resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
      resMap.put(Constants.RESULT_MSG, "댓글 조회 실패");

      try {
         // 해당 게시글의 댓글 리스트 조회
         int cnt = service.selectReplyListTotCount(pagingDTO);
         List<BoardReplyDTO> replyList = service.selectBoardReplyList(pagingDTO);
         for (BoardReplyDTO dto : replyList) {//for each
            if (dto.getIsSecret().equals("Y")) {
               if (userId == null || userId.equals("")) {// 비로그인 상태
                  dto.setrContent("비밀댓글입니다.");
               } else {// 로그인 상태
                  String writer = service.findWriter(pagingDTO.getbNo());
                  String replyer = dto.getReplyId().toString();

                  if (!userId.equals(writer) && !userId.equals(replyer)) {
                     dto.setrContent("비밀댓글입니다.");
                  }
               }
            }
         }
         
         resMap.put("loginUserId", userId);
         resMap.put("replyTotCnt", cnt);
         resMap.put("replyList", replyList);
         resMap.put(Constants.RESULT, Constants.RESULT_OK);
         resMap.put(Constants.RESULT_MSG, "댓글 조회 성공");
         resMap.put("pagingDTO", pagingDTO);
         
//         resMap.put("filePath", FILE_UPLOAD_PATH);   //파일 경로도 보내줌
         
      } catch (Exception e) {
         e.printStackTrace();
      }

      return resMap;
   }
   
   /** 댓글 전체 목록 */
   @RequestMapping("/all")
   public Map<String, Object> boardReplyListAll(BoardReplyDTO brDTO, HttpServletRequest req){
      logger.info("boardReplyListAll() : 댓글 전체목록 조회");
      
      UserVO vo = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
      String userId = vo.getUserId();
      
      Map<String, Object> resMap = new HashMap<String, Object>();
      resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
      resMap.put(Constants.RESULT_MSG, "댓글 조회 실패");

      try {
         // 해당 게시글의 댓글 리스트 조회
         List<BoardReplyDTO> replyAllList = service.selectAllReplyList(brDTO);
         for (BoardReplyDTO dto : replyAllList) {
            if (dto.getIsSecret().equals("Y")) {
               if (userId == null) {//비로그인 상태
                  dto.setrContent("비밀댓글입니다.");
               } else {//로그인상태
                  String writer = service.findWriter(brDTO.getbNo());
                  String replyer =dto.getReplyId();
                  if (!userId.equals(writer) && !userId.equals(replyer)) {
                     dto.setrContent("비밀댓글입니다.");
                  }
               }
            }
         }
         
         resMap.put("loginUserId", userId);
         resMap.put("replyAllList", replyAllList);
         resMap.put(Constants.RESULT, Constants.RESULT_OK);
         resMap.put(Constants.RESULT_MSG, "댓글 조회 성공");
         
      } catch (Exception e) {
         e.printStackTrace();
      }

      return resMap;
   }
   
   /** 댓글 수정 */
   @RequestMapping(value="/{rno}",method={RequestMethod.PUT,RequestMethod.PATCH})
   public Map<String, Object> updateBoardReply(@PathVariable("rno") String rno, @RequestBody BoardReplyDTO brDTO){
      logger.info("updateBoardReply() : 댓글 수정");
      
      Map<String, Object> resMap = new HashMap<String, Object>();
      resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
      resMap.put(Constants.RESULT_MSG, "댓글 수정 실패");
      try {
         // DB에 댓글 수정
         brDTO.setrNo(rno);
         service.updateBoardReply(brDTO);
         resMap.put(Constants.RESULT, Constants.RESULT_OK);
         resMap.put(Constants.RESULT_MSG, "댓글 수정 성공");
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return resMap;
   }

   /** 댓글 삭제 */
   @RequestMapping(value="/{rno}",method=RequestMethod.DELETE)
   public Map<String, Object> deleteBoardReply(@PathVariable("rno") String rno){
      logger.info("deleteBoardReply() : 댓글 삭제");
      
      Map<String, Object> resMap = new HashMap<String, Object>();
      resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
      resMap.put(Constants.RESULT_MSG, "댓글 삭제 실패");
      try {
         // DB에 댓글 삭제
         service.deleteBoardReply(rno);
         resMap.put(Constants.RESULT, Constants.RESULT_OK);
         resMap.put(Constants.RESULT_MSG, "댓글 삭제 성공");
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return resMap;
   }
   
}


