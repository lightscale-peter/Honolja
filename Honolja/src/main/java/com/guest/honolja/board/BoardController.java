package com.guest.honolja.board;

import java.io.File;
<<<<<<< HEAD
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Autowired
	@Inject
	BoardDAO dao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("/board.do")	 //게시판 리스트
	public ModelAndView board_list(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		String returnpage="";
		int pageNUM=1, pagecount=1; 
		int start=1,end=1,startpage=1,endpage=1,temp=1;
		String pnum="";
		String skey="",sval="";
		
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		
		if(skey==null||skey=="" || sval==null||sval=="") {
			skey="b_title"; sval="";
		}
		returnpage="&keyfield="+skey+"&keyword=" +sval;
		
		pnum=request.getParameter("pageNum");
		if(pnum==null || pnum=="") {pnum="1";} //비어있으면1p
		else{pageNUM=Integer.parseInt(pnum);}

		start=((pageNUM-1)*10)+1; //if(5 -> 41
		end=pageNUM*10;              //~50
		temp=(pageNUM-1)%10;    //if 5 == temp===4
		startpage=pageNUM-temp;    //1페이지
		endpage=startpage+9;         //10페이지
		
		int Gtotal=dao.dbCount(skey,sval);//카운트-전체값

		if(Gtotal%10==0) { pagecount=Gtotal/10; }
		else{pagecount=(Gtotal/10)+1;}
		
		if(endpage>pagecount) {endpage=pagecount;}
		
		List<BoardDTO> LB=dao.dbSelect(start,end,skey,sval);
		mav.addObject("pagecount",pagecount);
		mav.addObject("LB",LB);
		mav.addObject("Gtotal", Gtotal);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("pageNUM", pageNUM);
		mav.addObject("sval",sval);
		mav.addObject("skey",skey);
		mav.addObject("returnpage",returnpage);
		mav.setViewName("/board/board");
		return mav;
	}//board_list end

	@RequestMapping("/boardwrite.do") //게시글 작성 JSP
	public String board_write() {
		return "/board/boardwrite";
	}
	
	@RequestMapping("/boardinsert.do")	//게시글 Insert
	public String board_insert(BoardDTO dto)  throws Exception { 
		
	long size=dto.getB_uploadfilename2().getSize();
		String path=application.getRealPath("/resources/upload"); //경로지정
		System.out.println(path); //경로출력
		MultipartFile mf= dto.getB_uploadfilename2(); //mf=upload 파일
		String img=mf.getOriginalFilename(); //진짜이름 -> img에
		
		URLEncoder.encode(img,"UTF-8"); //한글화
		File file=new File(path,img);
		try {
			dto.getB_uploadfilename2().transferTo(file);
		} catch (Exception e) {e.printStackTrace(); }
		dto.setB_originalfilename(img);
		dao.dbInsert(dto);
		return "redirect:/board.do";
	}//board_insert end
	
	@RequestMapping("/boarddetail.do")	//게시글 상세정보
	public ModelAndView board_detail(@RequestParam("idx") int data) throws Exception {
		ModelAndView mav=new ModelAndView();
		BoardDTO dto=dao.dbDetail(data);
		
		dao.dbViewCnt(data); //정보 클릭하면 조회수 +1
		if(dto.getB_originalfilename() != null) {
			System.out.println(dto.getB_originalfilename());
		    mav.addObject("img_file_name", URLEncoder.encode(dto.getB_originalfilename(),"UTF-8"));
		}
		mav.addObject("dto",dto);
		mav.setViewName("/board/boarddetail");
		return mav;
	}
	
	@RequestMapping("/boarddelete.do") //게시글 삭제
	public String board_delete(@RequestParam("idx") int b_no) {
		dao.dbDelete(b_no);
		return "redirect:/board.do";
	}
	
	@RequestMapping("/boardedit.do") //게시글 수정 JSP
	public ModelAndView board_edit(@RequestParam("idx") int b_no) {
		ModelAndView mav=new ModelAndView();
		BoardDTO dto=dao.dbDetail(b_no);
		
		mav.addObject("dto",dto);
		mav.setViewName("board/boardedit");
		return mav;
	}
	
	@RequestMapping("/boardupdate.do") //게시글 Update
	public String board_update(BoardDTO dto) {
		dao.dbUpdate(dto);
	return "redirect:/board.do";
	}
	
	//댓글@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/boardreply.do") //댓글 리스트
	public ModelAndView board_reply(@RequestParam("idx") int b_no) {
		ModelAndView mav=new ModelAndView();
		List<BoardDTO> list = dao.dbRSelectReply(b_no);
		
		int rcnt=dao.dbRCountReply(b_no);
		mav.addObject("rcnt", rcnt);
		mav.addObject("list", list);
		mav.setViewName("board/boardreply");
		
		return mav;
	}
	
	@RequestMapping("/boardreplyinsert.do") //댓글 Insert
	public String board_replyinsert(BoardDTO dto) {
		dao.dbRInsert(dto);
		return "redirect:/boarddetail.do?idx="+dto.getB_no(); 
	}
	
	@RequestMapping("/boardreplydelete.do") //댓글 Delete
	public String board_replydelete(@RequestParam("idx")int b_no, @RequestParam("br_no") int br_no) {
		dao.dbRDelete(br_no);
	return "redirect:/boarddetail.do?idx="+ b_no;  
	}
	
	@RequestMapping("/boardreplyedit.do") //댓글 수정 JSP
	public ModelAndView board_replyedit(@RequestParam("idx")int b_no, @RequestParam("br_no") int br_no) {
		BoardDTO dto=new BoardDTO();
		ModelAndView mav=new ModelAndView();
		
		dto=dao.dbRDetail(br_no);
		mav.addObject("dto",dto);
		mav.setViewName("board/boardreplyedit");
		return mav;
	}
	
	@RequestMapping("boardreplyupdate.do") //댓글 Update
	public String board_replyupdate(BoardDTO dto) {
		dao.dbRUpdate(dto);
		return "redirect:/boarddetail.do?idx=" +dto.getB_no();
	}
	
	//대댓글@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/boardrreply.do")	 //대댓글 List
	public ModelAndView board_replyreplywrite(@RequestParam("br_no") int br_no, @RequestParam("idx") int b_no) {
		ModelAndView mav = new ModelAndView();
		
		List<BoardDTO> list = dao.dbRRSelect(br_no);
		mav.addObject("br_no", br_no);
		mav.addObject("b_no", b_no);
		mav.addObject("list", list);
		mav.setViewName("/board/boardreplyreplylist");
		return mav;
	}
	
	@RequestMapping("/boardrreplyinsertForm.do") //대댓글 쓰는 Form
	public ModelAndView board_rreplyinsertForm(@RequestParam("br_no") int br_no, @RequestParam("idx") int b_no) {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("br_no", br_no);
		mav.addObject("b_no", b_no);
		mav.setViewName("/board/boardreplyreplywrite");
		return mav;
	}
	
	@RequestMapping("/boardrreplyinsert.do") //대댓글 Insert
	public String board_rreplyinsert(BoardDTO dto) {
		dao.dbRRInsert(dto);
		return "redirect:/boarddetail.do?idx=" +dto.getB_no();
	}
	
	@RequestMapping("/boardrreplydelete.do") //댓글 Delete
	public String board_rreplydelete(@RequestParam("idx")int b_no, @RequestParam("brr_no") int brr_no) {
		dao.dbRRDelete(brr_no);
	return "redirect:/boarddetail.do?idx="+ b_no;  
	}
	
=======
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.guest.honolja.message.MsgDAO;
import com.guest.honolja.message.MsgDTO;

@Controller
public class BoardController {
	
	@Autowired
	@Inject
	BoardDAO dao11;
	
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("/board.do")
	public ModelAndView board_list(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		BoardDTO dto=new BoardDTO();
	
		int pageNUM=1, pagecount=1;
		int start=1,end=1,startpage=1,endpage=1,temp=1;
		String pnum="";
		String skey="",sval="";
		
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		
		if(skey==null||skey=="" || sval==null||sval=="") {
			skey="b_title"; sval="";
		}
		
		
		dao11.dbSelect2(skey, sval);
	
		pnum=request.getParameter("pageNum");
		if(pnum==null || pnum=="") {pnum="1";} //鍮꾩뼱�엳�쑝硫�1p
		else{pageNUM=Integer.parseInt(pnum);}

		start=((pageNUM-1)*10)+1; //if(5 -> 41
		end=pageNUM*10;              //~50
		temp=(pageNUM-1)%10;    //if 5 == temp===4
		startpage=pageNUM-temp;    //1�럹�씠吏�
		endpage=startpage+9;         //10�럹�씠吏�
		
		int Gtotal=dao11.dbCount(skey,sval);//移댁슫�듃-�쟾泥닿컪

		if(Gtotal%10==0){ pagecount=Gtotal/10; }
		else{ pagecount=(Gtotal/10)+1; }
		
		if(endpage>pagecount) {endpage=pagecount;}
		
		
		int rcnt=dto.getRcnt();
		dao11.dbSelect(start,end);
		List<BoardDTO> LB=dao11.dbSelect(start,end,skey,sval);
		dao11.dbSelect2(skey, sval);
		mav.addObject("pagecount",pagecount);
		mav.addObject("LB",LB);
		mav.addObject("Gtotal", Gtotal);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("pageNUM", pageNUM);
		mav.addObject("rcnt",rcnt);
		mav.addObject("sval",sval);
		mav.addObject("skey",skey);
		mav.setViewName("/board/board");
		return mav;
	}//board_list end

	@RequestMapping("/boardwrite.do")
	public String board_write() {
		return "/board/boardwrite";
	}
	
	@RequestMapping("/boardinsert.do")
	public String board_insert(HttpSession session, BoardDTO dto)  throws Exception { 
		
	dto.setU_id(session.getAttribute("checked").toString());
	long size=dto.getB_uploadfilename2().getSize();
		
		String path=application.getRealPath("/resources/upload"); //寃쎈줈吏��젙
		System.out.println(path); //寃쎈줈異쒕젰
		MultipartFile mf= dto.getB_uploadfilename2(); //mf=upload �뙆�씪
		String img=mf.getOriginalFilename(); //吏꾩쭨�씠由� -> img�뿉
		
		
		URLEncoder.encode(img,"UTF-8"); //�븳湲��솕
		File file=new File(path,img);
		try {
			dto.getB_uploadfilename2().transferTo(file);
			
		} catch (Exception e) {e.printStackTrace(); }
		dto.setB_originalfilename(img);
		
		dao11.dbInsert(dto);
		//adsf
		 
		return "redirect:/board.do";
	}//board_insert end
	    
	
	@RequestMapping("/boarddetail.do")
	public ModelAndView board_detail(@RequestParam("idx") int data) throws Exception {
		ModelAndView mav=new ModelAndView();
		BoardDTO dto=dao11.dbDetail(data);
		
		if(dto.getB_originalfilename() != null) {
		    mav.addObject("img_file_name", URLEncoder.encode(dto.getB_originalfilename(),"UTF-8"));
		}
		
		mav.addObject("dto",dto);
		mav.setViewName("/board/boarddetail");
		return mav;
		
	}
	
	@RequestMapping("/boarddelete.do")
	public String board_delete(@RequestParam("idx") int b_no) {
		dao11.dbDelete(b_no);
		return "redirect:/board.do";
	}
	
	@RequestMapping("/boardedit.do")
	public ModelAndView board_edit(@RequestParam("idx") int b_no) {
		ModelAndView mav=new ModelAndView();
		BoardDTO dto=dao11.dbDetail(b_no);
		
		mav.addObject("dto",dto);
		mav.setViewName("board/boardedit");
		return mav;
	}
	
	@RequestMapping("/boardupdate.do")
	public String board_update(BoardDTO dto) {
		dao11.dbUpdate(dto);
	return "redirect:/board.do";
	}
	
	//諛� 李몄뿬
	@ResponseBody
	@RequestMapping("/boardmember.do")
	public String boardmember(BoardDTO dto, HttpSession session) {

		String u_id2 = session.getAttribute("checked").toString();
		String result = null;
		if(u_id2.equals(dto.getU_id())) {
			result = "false";
		}else {
			dto.setB_member2(dto.getB_member2()+1);
			dao11.boardmember(dto);
			result = "success";
		}
		return result;
	}//end
	
	@RequestMapping("/board_file.do")
	public String boardfile() {
		return "board/board_file";
	}//�뙆�씪 �뾽濡쒕뱶 �뙘�뾽 �솕硫�
	
	@RequestMapping("/board_fileup.do")
	public String boardfileupload(BoardDTO dto) throws Exception {
		long size=dto.getB_uploadfilename2().getSize();
		
		String path=application.getRealPath("/resources/upload"); //寃쎈줈吏��젙
		System.out.println(path); //寃쎈줈異쒕젰
		MultipartFile mf= dto.getB_uploadfilename2(); //mf=upload �뙆�씪
		String img=mf.getOriginalFilename(); //吏꾩쭨�씠由� -> img�뿉
		
		
		URLEncoder.encode(img,"UTF-8"); //�븳湲��솕
		File file=new File(path,img);
		try {
			dto.getB_uploadfilename2().transferTo(file);
			
		} catch (Exception e) {e.printStackTrace(); }
		dto.setB_originalfilename(img);
		
		dao11.dbInsert(dto);
		 
		return "redirect:/board.do";

	}//�뙆�씪 �뾽濡쒕뱶 湲곕뒫


>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja.git
}//class end