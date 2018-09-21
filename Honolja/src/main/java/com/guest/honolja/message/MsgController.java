package com.guest.honolja.message;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MsgController {
	
	@Autowired
	MsgDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);

	
	@RequestMapping("/msg_send.do")
	public ModelAndView msgsend(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", userid);
		mav.setViewName("/message/msg_send");
		return mav;
	}
	
	@RequestMapping("/msg_testR.do")
	public ModelAndView msg_boxR(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String userid = request.getParameter("userid");
		List<MsgDTO> listR = dao.db_selectR(userid);
		
		int cnt = dao.db_msgcheck(userid);

		mav.addObject("userid", userid);
		mav.addObject("listR", listR);
		mav.addObject("cnt", cnt);
		mav.setViewName("/message/msg_testR");
		return mav;
	}//諛쏆�履쎌�
	
	@RequestMapping("/msg_testS.do")
	public ModelAndView msg_boxS(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String userid = request.getParameter("userid");
		List<MsgDTO> listS = dao.db_selectS(userid);
		
		//MsgDTO dto = new MsgDTO();
		//int cnt = dao.db_msgcheck(userid);
			
		mav.addObject("userid", userid);
		mav.addObject("listS", listS);
		//mav.addObject("cnt", cnt);
		mav.setViewName("message/msg_testS");
		return mav;
	}//蹂대궦履쎌�
	
	@RequestMapping("/msg_insert.do")
	public String msg_send(MsgDTO dto) {
		dao.db_insert(dto);
		return "redirect:/notice.do";
	}//硫붿꽭吏� 蹂대궡湲�
	
	@RequestMapping("/msg_detailS.do")
	public ModelAndView msg_detailS(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MsgDTO dto = new MsgDTO();
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//dto.setM_no(idx);
		//dao.db_check(idx);		
		dto = dao.db_detail(idx);
		
		mav.addObject("dto", dto);
		mav.setViewName("/message/msg_detailS");
		return mav;
	}//蹂대궦硫붿꽭吏� �뵒�뀒�씪
	
	@RequestMapping("/msg_detailR.do")
	public ModelAndView msg_detailR(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MsgDTO dto = new MsgDTO();
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		dto.setM_no(idx);
		dao.db_check(idx);
		dto = dao.db_detail(idx);
		
		mav.addObject("dto", dto);
		mav.setViewName("/message/msg_detailR");
		return mav;
	}//諛쏆�硫붿꽭吏� �뵒�뀒�씪

	@RequestMapping("/msg_delete")
	public String msg_delete(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		MsgDTO dto = new MsgDTO();
		dao.db_delete(idx);
		return "redirect:/msg_testS.do?userid="+dto.getUserid();
	}//硫붿꽭吏� �궘�젣
	
	@RequestMapping("/msg_cancel")
	public String msg_cancel(HttpServletRequest request) {
		MsgDTO dto = new MsgDTO();
		dto.setM_no(Integer.parseInt(request.getParameter("idx")));
		dto.setM_check(request.getParameter("check"));
		dto.setUserid(request.getParameter("userid"));
		
		if (dto.getM_check().equals("false")) {
			dao.db_cancel(dto);
		}		
		
		return "redirect:/msg_testS.do?userid="+dto.getUserid();
	}//諛쒖넚痍⑥냼
	
	
	
}//Controller end
