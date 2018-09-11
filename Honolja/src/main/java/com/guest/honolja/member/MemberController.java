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
		return "member/join";
	}// end

	//�쉶�썝媛��엯
	@RequestMapping("/insert.do")
	public String member_insert(MemberDTO mto) throws Exception {
		mto.setU_birth(mto.getYear() + mto.getMonth() + mto.getDay());
		String gender = mto.getU_gender2();
		System.out.println("gender2 = " + mto.getU_gender2());
		if(gender.equals("girl")) {
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
		
		String key = new TempKey().getKey(50, false); //�씤利앺궎 �깮�꽦
		mto.setU_emailkey(key);
		dao.m_emailcheck(mto);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Honolja email test]");
		sendMail.setText(new StringBuffer().append("<h1>email</h1>").append("<a href='http://localhost:8080/honolja/emailcheck.do?u_email=").append(mto.getU_email()).append("&u_emailkey=").append(key).append("' target='_blenk'>email</a>").toString());
		sendMail.setFrom("aa01088921067@gmail.com", "Honolja");
		sendMail.setTo(mto.getU_email());
		sendMail.send();
		return "member/emailcheck";
	}// end
	
	//�씠硫붿씪 �씤利�
	@RequestMapping(value="/emailcheck.do", method = RequestMethod.GET)
	public String m_emailcheck(String u_email, Model model) throws Exception {
		dao.m_Auth(u_email);
		return "member/member";
	}//end

	// �쉶�썝紐⑸줉
	@RequestMapping("/list.do")
	public ModelAndView member_list() {
		List<MemberDTO> list = dao.m_select();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("member/memberList");
		return mav;
	}// end

	// �쉶�썝�긽�꽭�젙蹂�
	@RequestMapping("/detail.do")
	public ModelAndView member_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int data = Integer.parseInt(request.getParameter("idx"));
		MemberDTO mto = dao.m_detail(data);

		mav.addObject("mto", mto);
		mav.setViewName("member/memberDetail");
		return mav;
	}// end

	// 留덉씠�럹�씠吏� �쉶�썝�깉�눜
	@RequestMapping("/mypageDelete.do")
	public ModelAndView mypage_delete(HttpServletRequest request) {
		String data = request.getParameter("idx");

		MemberDTO mto = dao.mypageDelete(data);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mto", mto);
		mav.setViewName("member/mypageDelete");

		return mav;
	}// end

	// �쉶�썝�깉�눜
	@RequestMapping("/delete.do")
	public String m_delete(MemberDTO mto) {
		dao.m_delete(mto);
		return "redirect:list.do";
	}// end

	// 濡쒓렇�씤�솕硫�
	@RequestMapping("/login.do")
	public String m_login() {
		return "member/login";
	}// end

	// �븘�씠�뵒 以묐났泥댄겕
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
