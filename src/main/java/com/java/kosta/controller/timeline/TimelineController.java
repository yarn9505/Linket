package com.java.kosta.controller.timeline;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.board.BoardAttachDTO;
import com.java.kosta.dto.note.NoteVO;
import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.FilterDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.board.BoardService;
import com.java.kosta.service.note.NoteService;
import com.java.kosta.service.timeline.TimelineService;

@Controller
public class TimelineController {
	
	@Inject
	TimelineService service;
	
	@Inject
	BoardService bService;
	

	Logger logger = LoggerFactory.getLogger(TimelineController.class);

	@Inject
	NoteService noteService;
	// 타임라인 메인으로 이동
	@RequestMapping(value = "/timeline")
	public String timelineMain(HttpServletRequest req, NoteVO vo) throws Exception {
		
		HttpSession session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("loginSession");
		if(uvo != null){
			vo.setRecvId(uvo.getUserId());
			String NotReadCnt = noteService.totalCntNotOpen(vo)+"";
			session.setAttribute("notOpen", NotReadCnt);
		}
		
		return "timeline/timelineMain";
	}

	// 타임라인 리스트 ajax 호출용
	@RequestMapping(value = "/timeline/listPaging")
	public @ResponseBody Map<String, Object> timelineMain(HttpSession session, PagingDTO page,
			@RequestParam("keywords") String keywords, Model model) {
		UserVO vo = null;
		List<TimelineDTO> list = null;
		// 현재 로그인되어 있는 사용자 객체 가져오기
		vo = (UserVO) session.getAttribute("loginSession");
		if (vo != null) {
			page.setTotalCount(service.countTimeline(vo, keywords));
			page.setPerPageNum(5); // 5개씩만 가져오도록...

			// 관심사, 거리에 따른 게시글 목록 가져오기
			list = service.listMatch(vo, page, keywords);
			
			// 해당 게시물의 파일 테이블을 리스트로 가져와서 첫번째 이미지 파일 경로를 TimelineDTO 에 set해줌
			// 타임라인에 이미지 하나만 보여주기 위함 (by.이윤지)
			try {
				for(TimelineDTO tlDTO : list){
					boolean exist = false;	// 파일 데이터에 이미지가 존재하지 않을 경우 로고 이미지를 뿌려주기위해 검사하는 변수
					List<BoardAttachDTO> files = bService.selectAttach(tlDTO.getBno());
					for(BoardAttachDTO baDTO : files){
						if(baDTO.getAttachType().equals("2")){
							tlDTO.setImgPath(baDTO.getFileName());
							exist = true;
							break;
						}
					}
					if(exist == false){
						tlDTO.setImgPath("/resources/images/noimage3.png");
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		for (int i = 0; i < list.size(); i++) {
			int fcnt = service.searchFavorite(list.get(i).getBno(), vo.getUserId());
			list.get(i).setCheckfavorite(fcnt+"");
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageMaker", page);
		map.put("keywords", keywords);
		return map;
	}// end of timelineMain
	
	@RequestMapping(value="/timeline/checkfavorite")
	@ResponseBody
	public String checkFavorite(HttpServletRequest req,@RequestParam(value="bno")String bno, Model model){
		UserVO vo = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
		String userId = vo.getUserId();
		String result="";
		
		int fcnt=service.searchFavorite(bno, userId);
		
		if(fcnt==0){
			result="0";
		}else if(fcnt==1){
			result="1";
		}
		return result;
	}
	
	//좋아요 업데이트를 위함
	@RequestMapping(value="/timeline/updatefavorite")
	@ResponseBody
	public String updateFavorite(HttpServletRequest req,@RequestParam(value="bno")String bno ,Model model){
		
		UserVO vo = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
		String userId = vo.getUserId();
		
		int fcnt = service.searchFavorite(bno, userId);
		
		if(fcnt != 0){
			service.deleteFavorite(bno, userId);
		}else{
			service.updateFavorite(bno, userId);
		}
		
		return fcnt+"";
	}

	// 필터된 게시글 ajax 호출용
	@RequestMapping(value = "/timeline/filterList")
	public @ResponseBody Map<String, Object> filterList(HttpSession session,PagingDTO page,
			@RequestParam(value = "fcateArr") List<String> fcateArr, @RequestParam(value = "fvalue1") String fvalue1,
			@RequestParam(value = "fvalue2") String fvalue2,HttpServletResponse res,RedirectAttributes rttr) throws IOException {
		FilterDTO filter = new FilterDTO();
		
		UserVO vo = null;
		vo = (UserVO) session.getAttribute("loginSession");

		/* fvalue1 과 fvalue2의 조건문 : 가치에 따른 분류를 위함 */
		if (!fvalue1.equals("")) {
			filter.setFvalue1(fvalue1);
		} else {
			filter.setFvalue1("0");
		}
		if (!fvalue2.equals("")) {
			filter.setFvalue2(fvalue2);
		} else {
			filter.setFvalue2(Integer.toString(service.maxValue()));
		}


		for (int i = 0; i < fcateArr.size(); i++) {
			if (fcateArr.get(i).equals("true")) {
				fcateArr.set(i, "Y");
			} else
				fcateArr.set(i, "N");
		}

		/* 카테고리에서 가져와서 필터링 */
		filter.setFcate1(fcateArr.get(0));
		filter.setFcate2(fcateArr.get(1));
		filter.setFcate3(fcateArr.get(2));
		filter.setFcate4(fcateArr.get(3));
		filter.setFcate5(fcateArr.get(4));
		filter.setFcate6(fcateArr.get(5));

		// 페이징을 위한 작업
		page.setTotalCount(service.countFilterList(filter));
		page.setPerPageNum(5);
		List<TimelineDTO> list = service.listFilter(filter, page);
		
		// 해당 게시물의 파일 테이블을 리스트로 가져와서 첫번째 이미지 파일 경로를 TimelineDTO 에 set해줌
		// 타임라인에 이미지 하나만 보여주기 위함 (by.이윤지)
		try {
			for(TimelineDTO tlDTO : list){
				boolean exist = false;	// 파일 데이터에 이미지가 존재하지 않을 경우 로고 이미지를 뿌려주기위해 검사하는 변수
				List<BoardAttachDTO> files = bService.selectAttach(tlDTO.getBno());
				for(BoardAttachDTO baDTO : files){
					if(baDTO.getAttachType().equals("2")){
						tlDTO.setImgPath(baDTO.getFileName());
						exist = true;
						break;
					}
				}
				if(exist == false){
					tlDTO.setImgPath("/resources/images/noimage3.png");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//좋아요 하트 뜨게하기 위함
		for (int i = 0; i < list.size(); i++) {
			int fcnt = service.searchFavorite(list.get(i).getBno(), vo.getUserId());
			list.get(i).setCheckfavorite(fcnt+"");
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageMaker", page);

		return map;

	}// end of filterList

}// end of class
