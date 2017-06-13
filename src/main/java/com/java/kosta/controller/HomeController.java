package com.java.kosta.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;
import com.java.kosta.service.board.BoardServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   @Inject
   BoardServiceImpl service;   //notice 게시판으로 넘어가기위한 서비스
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   @RequestMapping(value = "/timelineSection", method = RequestMethod.GET)
   public String timeLineSection(Locale locale, Model model) {
      logger.info("timeLineSection Controller");
      
      return "timeline/timelineMain";
   }
   
   @RequestMapping(value = "/categorySection", method = RequestMethod.GET)
   public String categorySection(Locale locale, Model model) {
      logger.info("categorySection Controller");
      
      return "menu/categorySection";
   }
   
   @RequestMapping(value = "/noticeBoardSection", method = RequestMethod.GET)
   public String noticeBoardSection(BoardPagingDTO pagingDTO, Model model, @RequestParam(value="cateId") int cateId) {
      logger.info("noticeBoardSection Controller");
      
      // 전체 레코드 갯수 획득
      int totRecord;
      try {
         totRecord = service.selectBoardListTotalCount(pagingDTO, cateId);
         
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
   
   @RequestMapping(value = "/aboutUsSection", method = RequestMethod.GET)
   public String aboutUsSection(Locale locale, Model model) {
      logger.info("aboutUsSection Controller");
      
      return "menu/aboutUsSection";
   }
   
   @RequestMapping(value = "/handlebarsTest")
   public String handlebarsTest(Locale locale, Model model) {
	   logger.info("handlebars Controller");
	   
	   return "testView/handlebarsTest";
   }
   
/*
 * 안드로이드 연동 연습용(테스트 코드)
   @RequestMapping(value="/simpleTest",method=RequestMethod.POST,produces="application/json;charset=utf-8")
   public @ResponseBody JSONObject me() throws Exception{
	   
	   JSONObject objMain = new JSONObject();
	   List<BoardDTO> list = service.selectBoardList(null, 0);
	   JSONArray jr = new JSONArray();
	   for(int i=0; i<list.size(); i++){
		   JSONObject obj = new JSONObject();
		   BoardDTO dto = list.get(i);
		   obj.put("bcontent", dto.getbContent());
		   obj.put("bno", dto.getbNo());
		   jr.add(i,obj);
	   }
	   objMain.put("sendData", jr);
	   return objMain;
   }*/
}