package com.guest.honolja.notice;

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
public class NoticeController {
	
	@Autowired
	NoticeDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping("/notice_insert.do")
	public String notice_writeView() {
		return "/notice/notice_insert";
	}//怨듭�湲� �옉�꽦李�
	
	@RequestMapping("/notice.do")
	public ModelAndView notice_view(HttpServletRequest request, NoticeDTO dto) { //select + �럹�씠吏�
		ModelAndView mav = new ModelAndView();
		
		int pageNUM = 1; //Ntotal 湲� 媛쒖닔
		int start=1, end=1, temp=1, startpage=1, endpage=1, pagecount=1; //pagecount 珥� �럹�씠吏� 媛쒖닔
		String pnum="0", returnpage="";
		String skey="", sval="";
		int reversecnt= 0; // �솕硫� �럹�씠吏��뿉�꽌 �뿭�닚 �떆�옉踰덊샇
		
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		
		if (skey=="" || skey==null || sval=="" || sval==null) { skey="n_title"; sval=""; returnpage=""; }
		returnpage="&keyfield="+skey+"&keyword="+sval;
		
		pnum=request.getParameter("pageNum");
		if(pnum==null || pnum=="") { pageNUM=1; }
		else { pageNUM = Integer.parseInt(pnum);}
		
		
		dto.setSkey(skey);
		dto.setSval(sval);
		
		//total
		int cnt = dao.db_count(skey, sval);
		
		if ( cnt%5==0 ) {pagecount=cnt/5;}
		else {pagecount=(cnt/5)+1;}
		
		start=((pageNUM-1)*5)+1;
		end=pageNUM*5;
		reversecnt = cnt-(start-1);

		temp=(pageNUM-1)%5;
		startpage=pageNUM-temp;
		endpage=startpage+4;

		if (endpage>pagecount) {endpage=pagecount;}
		
		List<NoticeDTO> list = dao.db_select(start, end, skey, sval);
		mav.addObject("dto", list);
		mav.addObject("cnt", cnt);
		mav.addObject("reversecnt", reversecnt);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("pagecount", pagecount);
		mav.addObject("pageNUM", pageNUM);
		mav.addObject("returnpage", returnpage);
		mav.addObject("skey", skey);
		mav.addObject("sval", sval);
		mav.setViewName("/notice/notice");
		return mav;
	}//view end 怨듭��궗�빆 由ъ뒪�듃

	@RequestMapping(value="/notice_insert.do", method=RequestMethod.POST)
	public String notice_insert(NoticeDTO dto) { //怨듭��궗�빆 湲� �엯�젰
		dto.setN_viewcnt(0);
		dto.setU_id("test");
		
		//dto.setN_content(dto.getN_content().replace("\n\n", "<br>"));
		
		if(dto.getN_fix() == null) {
			dto.setN_fix("N");
		}
				
		System.out.println("�젣紐�: "+dto.getN_title());
		System.out.println("�궡�슜: "+dto.getN_content());
		System.out.println("�궇吏�: "+dto.getN_date());
		System.out.println("怨좎젙: "+dto.getN_fix());
		System.out.println("�옉�꽦�븘�씠�뵒: "+dto.getU_id());
		System.out.println("議고쉶�닔: "+dto.getN_viewcnt());
		
		dao.db_insert(dto);
		
		return "redirect:/notice.do";
	}//insert end 怨듭��옉�꽦 湲곕뒫
	
	@RequestMapping("/notice_detail.do")
	public ModelAndView notice_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("idx"));
		NoticeDTO dto = dao.db_detail(idx);
		mav.addObject("dto", dto);
		dto.setN_viewcnt(dto.getN_viewcnt()+1);
		dao.db_cnt(dto);
		
		mav.setViewName("/notice/notice_detail");
		return mav;
	}//怨듭�湲� �긽�꽭
	
	@RequestMapping("/notice_delete.do")
	public String notice_delete(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		dao.db_delete(idx);
		return "redirect:/notice.do";
	}//怨듭�湲� �궘�젣
	
	@RequestMapping("/notice_preEdit.do")
	public ModelAndView notice_preEdit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int idx = Integer.parseInt(request.getParameter("idx"));
		NoticeDTO dto = dao.db_preEdit(idx);
		mav.addObject("dto", dto);
		mav.setViewName("/notice/notice_preEdit");
		return mav;
	}//怨듭�湲� �닔�젙�솕硫�
	
	@RequestMapping("/notice_edit.do")
	public String notice_edit(NoticeDTO dto) {
		dto.setU_id("test");
		if(dto.getN_fix() == null) {
			dto.setN_fix("N");
		}
		dao.db_edit(dto);
		return "redirect:/notice.do";
	}//怨듭�湲� �닔�젙湲곕뒫
	
	
}//Controller end
