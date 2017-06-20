package com.java.kosta.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * Event들을 처리할 수 있는 Method들을 선언
 */


public class EchoHandler extends TextWebSocketHandler{
   
   private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
   // 보낸 쪽지 정보를 저장
   Map<String, Object> map = new HashMap<String, Object>();
   // 로그인된 세션 아이디와 로그인 아이디 매칭해서 저장시켜 놓음.
   HashMap<String,Object> infoMap = new HashMap<String,Object>();
   /**
    * 접속 관련 Event Method
    * @param WebSocketSession 접속한 사용자
    */
   
   private List<WebSocketSession> connectedUsers;
   public EchoHandler() {
      connectedUsers = new ArrayList<WebSocketSession>();
   }
   
   public void EchoNoti(Map map){
      this.map=map;
      logger.info("에코핸들러내부에서 넘어온 값 "+map.get("sendId"));
   }
   
   
   //웹소켓 서버에 클라이언트가 접속하면 호출
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      connectedUsers.add(session);
      logger.info(session.getId()+"님 접속");
      logger.info("연결IP : " + session.getRemoteAddress().getHostName());
   }
   
   /**
    * 2가지 이벤트 처리
    * 1. Send : 클라이언트가 서버에게 메시지 보냄 (session)
    * 2. Emit : 서버에 연결되어 있는 클라이언트들에게 메시지 보냄 (message)
    */
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	   String access = message.getPayload();
	   if ( access.contains("접속") ){
		   // 접속을 띄어내고 로그인 아이디만 가져옴
		   access = access.replace("접속","");
		   // 세션 id와 로그인되어 있는 유저 id를 매칭시켜 해시 맵에 저장시켜 놓음.
		   infoMap.put(access, session);
	   }
	   
	   // 컨트롤러에서 쪽지 보내기로 삽입시 호출하게 되면...
	   if ( message.getPayload().equals("쪽지보내기") ){
		   Set keys = infoMap.keySet();
		   Iterator it = keys.iterator();
		   while(it.hasNext()){
			   // 로그인 아이디를 꺼내옴
			   String loginId = (String) it.next();
			   if ( loginId.equals(map.get("recvId"))){ // 받는이 id를 infoMap에서 찾는다.
				   // 받을 이의 세션을 가져옴
				   WebSocketSession recvSession = (WebSocketSession) infoMap.get(loginId);
				   String text = map.get("sendId")+"(님)이 쪽지를 보냈습니다.\n"
			               +"제목 : "+ map.get("title")+"\n"
			               +"내용 : "+ map.get("content")+"\n"
			               +"보낸시간 : "+map.get("recvDate");
			      logger.info("서버에서 전송하나? : "+text);
				   recvSession.sendMessage(new TextMessage(text));
			   }
		   }
	   }
   }

   /**
    * 접속 관련 Event Method
    */
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      logger.info(session.getId()+"님 접속 종료");
      connectedUsers.remove(session);
      Set keys = infoMap.keySet();
      Iterator it = keys.iterator();
      while(it.hasNext()){
    	  String key = (String) it.next();
    	  if ( infoMap.get(key) == session ){
    		  infoMap.remove(key);
    	  };
      }
   }
   
   /**
    * 로그를 남김
    */
   
   // 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        logger.info("전송오류 발생");
    }


}//end of EchoHandler

