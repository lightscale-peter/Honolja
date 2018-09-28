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

	@RequestMapping("/find_ID.do")
	public String find_ID() {
		return "member/find_ID";
	}//아이디 찾기
	
	@RequestMapping(value = "/m_join.do", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {
		return "member/join";
	}// end

	//회원가입
	@RequestMapping("/m_insert.do")
	public String member_insert(MemberDTO mto) throws Exception {
		mto.setU_birth(mto.getYear() + mto.getMonth() + mto.getDay());
		mto.setU_email(mto.getU_email()+"@"+mto.getU_email2());
		mto.setU_guestjuso(mto.u_guestjuso + " " + mto.u_guestjuso1);
		String path = "C:\\Users\\bit-user\\git\\Honolja\\Honolja\\src\\main\\webapp\\image\\";
		MultipartFile mf = mto.getUpload_img();
		String img = mf.getOriginalFilename();
		
		if(img.equals("") || img == null) {
			if(mto.getU_gender().equals("남자")) {
				img = "boy.jpg"; 
			}else if(mto.getU_gender().equals("여자")) {
				img = "girl.jpg";
			}
		}//if end
		
		img = URLEncoder.encode(img, "UTF-8");
		File file = new File(path, img);
		mto.setU_imgpath(path+img);

		try {
			mto.getUpload_img().transferTo(file);
		} catch (Exception ex) {
		}
		mto.setU_img(img);

		dao.m_insert(mto);
		
		String key = new TempKey().getKey(50, false); //이메일인증 키값
		mto.setU_emailkey(key);
		dao.m_emailcheck(mto);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Honolja 이메일인증 test]");
		sendMail.setText(new StringBuffer().append("<h1>이메일 인증입니다.</h1>").append("<a href='http://localhost:8080/honolja/emailcheck.do?u_id="+mto.getU_id()).append("&u_emailkey=").append(key).append("' target='_blenk'>이메일 인증 테스트</a>").toString());
		sendMail.setFrom("aa01088921067@gmail.com", "Honolja");
		sendMail.setTo(mto.getU_email());
		sendMail.send();
		return "member/emailcheck";
	}// end
	
	//이메일체크
	@RequestMapping(value="/emailcheck.do", method = RequestMethod.GET)
	public String m_emailcheck(HttpServletRequest request, Model model) throws Exception {
		String u_id = request.getParameter("u_id");
		System.out.println("u_id@222222 = " + u_id);
		dao.m_Auth(u_id);
		return "member/member";
	}//end

	//회원목록
	@RequestMapping("/m_list.do")
	public ModelAndView member_list(HttpServletRequest request) {
		MemberDTO mto = new MemberDTO();
		int pageNUM=1, pagecount=1;
		int start=1, end=1, temp=1, startpage=1, endpage=1;
		String pnum="", returnpage="";
		String skey="", sval="";
		skey = request.getParameter("keyfield");
		sval = request.getParameter("keyword");
	
		if( skey == null || skey.equals("") || sval == null || sval.equals("")) {
			skey = "u_id";
			sval = "";
		}
		
		returnpage="&keyfield="+skey+"&keyword="+sval;		
		
		pnum=request.getParameter("pageNum");
		if(pnum == null || pnum == "") { pageNUM=1;	}
		else { pageNUM=Integer.parseInt(pnum); }
		
		mto.setSkey(skey);
		mto.setSval(sval);

		int cnt = dao.m_count(mto);
		
		if(cnt%10 == 0 ) { pagecount=cnt; }
		else { pagecount = (cnt/10)+1; }
		
		start=((pageNUM-1)*10)+1;
		end=pageNUM*10;
		
		temp=(pageNUM-1)%10;
		startpage=pageNUM - temp;
		endpage=startpage+9; 
		if(endpage > pagecount) { endpage=pagecount; }
		
		mto.setStart(start);
		mto.setEnd(end);

		List<MemberDTO> list = dao.m_select(mto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", cnt);
		mav.addObject("list", list);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("pagecount", pagecount);
		mav.addObject("pageNUM", pageNUM);
		mav.setViewName("member/memberList");
		return mav;
	}// end

	//회원상세
	@RequestMapping("/m_detail.do")
	public ModelAndView member_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int data = Integer.parseInt(request.getParameter("idx"));
		MemberDTO mto = dao.m_detail(data);

		mav.addObject("mto", mto);
		mav.setViewName("member/memberDetail");
		return mav;
	}// end

	//로그인
	@RequestMapping("/m_login.do")
	public String m_login() {
		return "member/m_login";
	}// end

	//아이디 중복체크
	@ResponseBody
	@RequestMapping("/idcheck.do")
	public String idcheck(@RequestBody String u_id) {
		int u_cnt = dao.idCheck(u_id);
		String retVal = "";
		
		if(u_cnt > 0) { retVal = "true"; }
		else { retVal = "false"; }
		
		return retVal;
	}//end
	
	//아이디찾기
	@RequestMapping("/findID.do")
	public ModelAndView findID(MemberDTO mto) {
		ModelAndView mav = new ModelAndView();
		String u_id = dao.findID(mto);
		mav.addObject("u_id", u_id);
		mav.setViewName("member/find_ID");
		return mav;
	}//end
	
}//MemberController Class END
