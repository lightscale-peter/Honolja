package com.guest.honolja.main;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainDAO dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/main.do")
	public ModelAndView main_page(Model model) {
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/main");;
			
		return mav;
	}
	
	@RequestMapping("/popup.do")
	public ModelAndView main_login_popup(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String host =  request.getParameter("host");
		
		if(id == null) {
			id = "";
		}			
		
		String scriptMsg;
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/login_popup");
		
		int idCheck = 1; //0 으로 바꿀 것 현재 테스트 중 1;
		//int idCheck = dao.dbSelect 아이디 체크 ;
		
		//if(idCheck > 0) {
		if(id.equals("sky")) {
			
			model.addAttribute("checked", id);
				
			//scriptMsg = "opener.opener.location.href = \"main.do\";";
			scriptMsg = "opener.parent.location='"+host+"';";
			scriptMsg += "alert('로그인 성공');";
			scriptMsg += "self.close();";
			
		}else {	
			scriptMsg = "alert('아이디 또는 비밀번호를 틀렸습니다.');";	
		}
		
			mav.addObject("script", scriptMsg);
		
		return mav;
	}
	
	@RequestMapping("/header.do")
	public ModelAndView common_header() {
			
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/header");

		return mav;		
	}
	
	@RequestMapping("/logout.do")
	public void common_logout(PrintWriter out) {
	
		out.println("<script>");
		out.println("location.href = history.back();");
		out.println("</script>");
		
	}
	
	@RequestMapping("/test.do")
	public ModelAndView main_test() {
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/test");
			mav.addObject("test", "class='active'");
			
		return mav;
	}
	
}
