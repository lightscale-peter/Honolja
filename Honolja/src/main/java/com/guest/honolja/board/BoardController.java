package com.guest.honolja.board;

import java.io.File;
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
import org.springframework.web.servlet.ModelAndView;

import com.guest.honolja.message.MsgDAO;
import com.guest.honolja.message.MsgDTO;

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
		
		
		dao.dbSelect2(skey, sval);
	
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
		
		
		int rcnt=dto.getRcnt();
		dao.dbSelect(start,end);
		List<BoardDTO> LB=dao.dbSelect(start,end,skey,sval);
		dao.dbSelect2(skey, sval);
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
		//adsf
		 
		return "redirect:/board.do";
	}//board_insert end
	    
	
	@RequestMapping("/boarddetail.do")
	public ModelAndView board_detail(@RequestParam("idx") int data) throws Exception {
		ModelAndView mav=new ModelAndView();
		BoardDTO dto=dao.dbDetail(data);
		
		if(dto.getB_originalfilename() != null) {
		    mav.addObject("img_file_name", URLEncoder.encode(dto.getB_originalfilename(),"UTF-8"));
		}
		
		mav.addObject("dto",dto);
		mav.setViewName("/board/boarddetail");
		return mav;
		
	}
	
	@RequestMapping("/boarddelete.do")
	public String board_delete(@RequestParam("idx") int b_no) {
		dao.dbDelete(b_no);
		return "redirect:/board.do";
	}
	
	@RequestMapping("/boardedit.do")
	public ModelAndView board_edit(@RequestParam("idx") int b_no) {
		ModelAndView mav=new ModelAndView();
		BoardDTO dto=dao.dbDetail(b_no);
		
		mav.addObject("dto",dto);
		mav.setViewName("board/boardedit");
		return mav;
	}
	
	@RequestMapping("/boardupdate.do")
	public String board_update(BoardDTO dto) {
		dao.dbUpdate(dto);
	return "redirect:/board.do";
	}
	
	//방 참여
	@ResponseBody
	@RequestMapping("/boardmember.do")
	public String boardmember(BoardDTO dto, HttpSession session) {
		String u_id = session.getAttribute("checked").toString();
		String result = null;
		
		MsgDAO dao = new MsgDAO();
		MsgDTO mto = new MsgDTO();
		mto.setU_id(u_id);
		mto.setM_title("모집인원 참여 요청 쪽지입니다");
		mto.setM_content("모집인원 참여 요청 쪽지입니다");
		mto.setM_id(dto.getU_id());
		dao.db_insert(mto);
		
			
		
		return result;
	}//end

}//class end