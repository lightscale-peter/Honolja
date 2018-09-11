package com.guest.honolja.member;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	@Autowired
	ServletContext application;
	@Autowired
	HttpSession session;
	@Inject
	JavaMailSender mailSender;
	

	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {
		return "/WEB-INF/views/join.jsp";
	}// end

	//회원가입
	@RequestMapping("/insert.do")
	public String member_insert(MemberDTO mto) throws Exception {
		mto.setU_birth(mto.getYear() + mto.getMonth() + mto.getDay());
		String gender = mto.getU_gender2();
		System.out.println("gender2 = " + mto.getU_gender2());
		if(gender.equals("여자")) {
			mto.setU_gender(gender);
		}
		System.out.println("gender = " + mto.getU_gender());

		String path = application.getRealPath("/resources/upload");
		MultipartFile mf = mto.getUpload_img();
		String img = mf.getOriginalFilename();
		img = URLEncoder.encode(img, "UTF-8");
		File file = new File(path, img);

		try {
			mto.getUpload_img().transferTo(file);
		} catch (Exception ex) {
		}
		mto.setU_img(img);

		dao.m_insert(mto);
		
		String key = new TempKey().getKey(50, false); //인증키 생성
		mto.setU_emailkey(key);
		dao.m_emailcheck(mto);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Honolja 이메일 인증 test]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/honolja/emailcheck.do?u_email=").append(mto.getU_email()).append("&u_emailkey=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("aa01088921067@gmail.com", "Honolja");
		sendMail.setTo(mto.getU_email());
		sendMail.send();
		return "/WEB-INF/views/emailcheck.jsp";
	}// end
	
	//이메일 인증
	@RequestMapping(value="/emailcheck.do", method = RequestMethod.GET)
	public String m_emailcheck(String u_email, Model model) throws Exception {
		dao.m_Auth(u_email);
		return "/WEB-INF/views/member.jsp";
	}//end

	// 회원목록
	@RequestMapping("/list.do")
	public ModelAndView member_list() {
		List<MemberDTO> list = dao.m_select();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/WEB-INF/views/memberList.jsp");
		return mav;
	}// end

	// 회원상세정보
	@RequestMapping("/detail.do")
	public ModelAndView member_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int data = Integer.parseInt(request.getParameter("idx"));
		MemberDTO mto = dao.m_detail(data);

		mav.addObject("mto", mto);
		mav.setViewName("/WEB-INF/views/memberDetail.jsp");
		return mav;
	}// end

	// 마이페이지 회원탈퇴
	@RequestMapping("/mypageDelete.do")
	public ModelAndView mypage_delete(HttpServletRequest request) {
		String data = request.getParameter("idx");

		MemberDTO mto = dao.mypageDelete(data);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mto", mto);
		mav.setViewName("/WEB-INF/views/mypageDelete.jsp");

		return mav;
	}// end

	// 회원탈퇴
	@RequestMapping("/delete.do")
	public String m_delete(MemberDTO mto) {
		dao.m_delete(mto);
		return "redirect:list.do";
	}// end

	// 로그인화면
	@RequestMapping("/login.do")
	public String m_login() {
		return "/WEB-INF/views/login.jsp";
	}// end

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping("/idcheck.do")
	public  ModelAndView idcheck(@RequestBody String u_id) {
		System.out.println("u_id = " + u_id);
		ModelAndView mav = new ModelAndView();
		//Map<String, String> map = new HashMap<String, String>();
		String u_cnt = Integer.toString(dao.idCheck(u_id));
		System.out.println("u_cnt = " + u_cnt);
		mav.addObject("u_cnt", u_cnt);
		mav.addObject("u_id", u_id);
		mav.setViewName(new String());
		//map.put("u_id", u_id);
		return mav;
	}//end
	
}//MemberController Class END
