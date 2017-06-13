package com.java.kosta.controller.addrConvert;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AddrConvertController {

	/**
	 * 메서드 명 : addressTrans
	 * 작성자 : 황영롱
	 * 내용 : 네이버 api를 이용해 주소를 위도,경도로 변경시켜주는 api 호출하는 메서드입니다.
	 */
	 @RequestMapping(value = "/address/trans")
	 @ResponseBody
	 public String addressTrans(String address) {
	     StringBuilder html = new StringBuilder();
	     String url = "https://openapi.naver.com/v1/map/geocode?query=" + address; // encodeURIComponent로 인코딩 된 주소
	     String clientId = "r1AloS5ItYU3Er32UmEq";
	     String clientSecret = "DH2YOwugjI";

	     HttpClient client = HttpClientBuilder.create().build();
	     HttpGet request = new HttpGet(url);
	     request.addHeader("X-Naver-Client-Id", clientId);  //해더에 Clinet Id와 Client Secret을 넣습니다
	     request.addHeader("X-Naver-Client-Secret", clientSecret);
	     try {
	         HttpResponse response = client.execute(request);
	         BufferedReader reader = new BufferedReader(
	         new InputStreamReader(response.getEntity().getContent(), "UTF-8"));

	         String current = "";
	         while ((current = reader.readLine()) != null) {
	             html.append(current);
	         }
	         reader.close();
	  } catch (ClientProtocolException e) {
	   e.printStackTrace();
	  } catch (IOException e) {
	   e.printStackTrace();
	  }
	  return html.toString();
	 } // end of addressTrans()
	 
	 @RequestMapping("/address")
	 public String testAddressConvert(){
		 return "testView/addressConvertTest";
	 }
	 
	 
	 
	 
	 
}
