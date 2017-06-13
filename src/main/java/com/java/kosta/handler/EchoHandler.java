package com.java.kosta.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.java.kosta.dto.user.UserVO;

/**
 * Event들을 처리할 수 있는 Method들을 선언
 */


public class EchoHandler extends TextWebSocketHandler{
   
   private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
   Map<String, Object> map = new HashMap<String, Object>();
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
   
   //
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String text = map.get("sendId")+"(님)이 쪽지를 보냈습니다.\n"
               +"제목 : "+ map.get("title")+"\n"
               +"내용 : "+ map.get("content")+"\n"
               +"보낸시간 : "+map.get("recvDate");
      logger.info("서버에서 전송하나? : "+text);
      for(WebSocketSession webSocketSession : connectedUsers){
         webSocketSession.sendMessage(new TextMessage(text));
      }
   }

   /**
    * 접속 관련 Event Method
    */
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      logger.info(session.getId()+"님 접속 종료");
      connectedUsers.remove(session);
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

