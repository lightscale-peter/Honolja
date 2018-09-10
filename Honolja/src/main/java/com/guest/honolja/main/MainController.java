package com.guest.honolja.main;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;



@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainDAO dao;
	
	@RequestMapping("/main.do")
	public ModelAndView main_page(HttpServletRequest request) {
		
		String access_token = "";
		
		if(request.getParameter("code") != null) {
			
				String clientId = "KhHvxQuRC4gDkDcMKUBF";//애플리케이션 클라이언트 아이디값";
			    String clientSecret = "zIRvSbAaRp";//애플리케이션 클라이언트 시크릿값";
			    String code = request.getParameter("code");
			    String state = request.getParameter("state");
    
			    String redirectURI = null;
				try {
					redirectURI = URLEncoder.encode("http://localhost:8080/honolja/main.do", "UTF-8");
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
			    String apiURL;
			    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			    apiURL += "client_id=" + clientId;
			    apiURL += "&client_secret=" + clientSecret;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&code=" + code;
			    apiURL += "&state=" + state;
			    //String access_token = "";
			    String refresh_token = "";
			    System.out.println("apiURL="+apiURL);
			    try {
			      URL url = new URL(apiURL);
			      HttpURLConnection con = (HttpURLConnection)url.openConnection();
			      con.setRequestMethod("GET");
			      int responseCode = con.getResponseCode();
			      BufferedReader br;
			      
			      System.out.print("responseCode = "+responseCode);
			      
			      if(responseCode==200) { // 정상 호출
			    	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			    	System.out.println("네이버 로그인 성공!!!!!!!!!");
			    	
			      } else {  // 에러 발생	    	  
			        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			        System.out.println("네이버 로그인 에러발생!!!!!!!!!");
			      }
			      String inputLine;
			      StringBuffer res = new StringBuffer();
			      while ((inputLine = br.readLine()) != null) {
			        res.append(inputLine);
			      }
			      br.close();
			      if(responseCode==200) {
			        System.out.println("StringBuffer = " + res.toString());
			        
			        JSONObject obj = new JSONObject(res.toString());
			        access_token = obj.getString("access_token");
    
			      }
			    } catch (Exception e) {
			      System.out.println(e);
			    }
			
		}
		
		
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/main");
			mav.addObject("access_token", access_token);
			
		return mav;
	}
	
	@RequestMapping("/popup.do")
	public ModelAndView main_login_popup(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String host =  request.getParameter("host");

		HttpSession session = request.getSession();
		
		if(id == null) {
			id = "";
		}			
		
		String scriptMsg = null;
		String alertMsg = null;
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/login_popup");
		
		int idCheck = 1; //0 으로 바꿀 것 현재 테스트 중 1;
		//int idCheck = dao.dbSelect 아이디 체크 ;
		
		//if(idCheck > 0) {
		if(id.equals("sky")) {
			
			model.addAttribute("checked", id);
			
			alertMsg = "로그인 성공!";
				
			scriptMsg = "opener.parent.location='"+host+"';";
			scriptMsg += "self.close();";
			
			
			
		}else {	
			alertMsg = "아이디 또는 비밀번호를 틀렸습니다.";
		}
		
			//JavaScript 문장 전송
			mav.addObject("scriptMsg", scriptMsg);
			mav.addObject("alertMsg", alertMsg);
			
		//미 로그인 상태에서, 아이디 기억 저장 쿠키가 남아있을 경우 아이디 값 전송
		if(session.getAttribute("checked") == null) {
			try {
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				mav.addObject("loginCookie", loginCookie.getValue());
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return mav;
	}
	
	@RequestMapping("/naver_login.do")
	public ModelAndView common_naver_login(Model model) {
		
		//네이버 API 로그인
	    String clientId = "KhHvxQuRC4gDkDcMKUBF";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = null;
		try {
			redirectURI = URLEncoder.encode("http://localhost:8080/honolja/main.do", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    
	    model.addAttribute("checked", state);
	    //session.setAttribute("state", state);
	    
	    ModelAndView mav = new ModelAndView();
	    	mav.addObject("apiURL", apiURL);
	    	mav.setViewName("main/naver_login");
		
		return mav;
	}
	
	@RequestMapping("/header.do")
	public ModelAndView common_header() {
			
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/header");

		return mav;		
	}
	
	@RequestMapping("/footer.do")
	public String common_footer() {
		return "/main/footer";
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView common_logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/logout");

		if(request.getParameter("host")  != null) {
			mav.addObject("host", request.getParameter("host"));
		}
		
		
		
		if(session.getAttribute("checked") != null) {
			session.removeAttribute("checked");
			session.invalidate();
			
			//Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			//if(loginCookie != null) {
			//	loginCookie.setMaxAge(0);
			//response.addCookie(loginCookie);
			
			//}
		}
		
		return mav;
	}
	
	@RequestMapping("/test.do")
	public ModelAndView main_test(HttpServletRequest request) {
		
		
		
		String token = "";
		
		if(request.getParameter("access_token") != null) {
			token = request.getParameter("access_token");// 네이버 로그인 접근 토큰;
		}
		
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
        	
            String apiURL = "https://openapi.naver.com/v1/nid/me";   
            URL url = new URL(apiURL);
            
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            
            int responseCode = con.getResponseCode();
            
            BufferedReader br;
            
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                System.out.println("개인정보 접근 성공!!!!");
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                System.out.println("개인정보 접근 실패!!!!");
            }
            
            String inputLine;
            StringBuffer response = new StringBuffer();
            
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            
            br.close();
            System.out.println(response.toString());
            
//            String temp = response.toString();
//            JSONObject obj = new JSONObject(temp);
//            String temp2 = obj.getJSONObject("response").getString("id");
//            System.out.println("이거다!!!!!!!!!!" + temp2);
            
            
            
       
        } catch (Exception e) {
            System.out.println(e);
        }
		
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/test");
			mav.addObject("test", "class='active'");
			
		return mav;
	}
	
}
