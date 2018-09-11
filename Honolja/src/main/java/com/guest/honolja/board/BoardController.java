package com.guest.honolja.board;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Autowired
	@Inject
	BoardDAO dao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("/board.do")
	public ModelAndView board_list(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
	
		int pageNUM=1, pagecount=1;
		int start=1,end=1,startpage=1,endpage=1,temp=1;
		String pnum="";
		String skey="",sval="";
		
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		
		if(skey==null||skey=="" || sval==null||sval=="") {
			skey="b_title"; sval="";
		}
		pnum=request.getParameter("pageNum");
		if(pnum==null || pnum=="") {pnum="1";} //비어있으면1p
		else{pageNUM=Integer.parseInt(pnum);}

		start=((pageNUM-1)*10)+1; //if(5 -> 41
		end=pageNUM*10;              //~50
		temp=(pageNUM-1)%10;    //if 5 == temp===4
		startpage=pageNUM-temp;    //1페이지
		endpage=startpage+9;         //10페이지
		
		int Gtotal=dao.dbCount(skey,sval);//카운트-전체값

		if(Gtotal%10==0){ pagecount=Gtotal/10; }
		else{ pagecount=(Gtotal/10)+1; }
		
		if(endpage>pagecount) {endpage=pagecount;}
		
	/*	System.out.println("start = " + start);
		System.out.println("end = " + end);
		System.out.println("startpage = " + startpage);
		System.out.println("endpage = " + endpage);*/
		
		List<BoardDTO> LB=dao.dbSelect(start,end);
		mav.addObject("pagecount",pagecount);
		mav.addObject("LB",LB);
		mav.addObject("Gtotal", Gtotal);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("pageNUM", pageNUM);
		mav.setViewName("/board/board");
		return mav;
	}//board_list end

	@RequestMapping("/boardwrite.do")
	public String board_write() {
		return "/board/boardwrite";
	}
	
	@RequestMapping("/boardinsert.do")
	public String board_insert(BoardDTO dto)  throws Exception { 
		
	long size=dto.getB_uploadfilename2().getSize();
		
		String path=application.getRealPath("/resources/upload"); //경로지정
		System.out.println(path); //경로출력
		MultipartFile mf=dto.getB_uploadfilename2(); //mf=upload 파일
		String img=mf.getOriginalFilename(); //진짜이름 -> img에
		
		
		URLEncoder.encode(img,"UTF-8"); //한글화
		File file=new File(path,img);
		try {
			dto.getB_uploadfilename2().transferTo(file);
			
		} catch (Exception e) {e.printStackTrace(); }
		dto.setB_originalfilename(img);
		dto.setB_filesize(size);
		dao.dbInsert(dto);
		
		System.out.println("title="+dto.getB_title());
		 System.out.println("content="+dto.getB_content());
		 System.out.println("member="+dto.getB_member());
		 System.out.println("viewcnt="+dto.getB_viewcnt());
		 System.out.println("filename="+dto.getB_originalfilename());
		 System.out.println("filename2="+dto.getB_uploadfilename2());
		 System.out.println("uploadfilename="+dto.getB_uploadfilename());
		 System.out.println("filesize="+dto.getB_filesize());
		 System.out.println("uid="+dto.getU_id());
		 
		return "redirect:/board.do";
	}//board_insert end
	    
	@RequestMapping("/boarddetail.do")
	public ModelAndView board_detail(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		String data=request.getParameter("idx");
		
		BoardDTO dto=dao.dbDetail(data);
		
		mav.addObject("dto",dto);
		mav.setViewName("/board/boarddetail");
		return mav;
	}
}//class end