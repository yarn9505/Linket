package com.java.kosta.handler.socket.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.kosta.handler.EchoHandler;

@Controller
public class SocketController {
   @RequestMapping("/chat")
   public String viewChattingPage(){
      return "chat";
   }
}