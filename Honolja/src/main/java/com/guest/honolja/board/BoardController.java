package com.guest.honolja.board;

import java.io.File;
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


}//class end