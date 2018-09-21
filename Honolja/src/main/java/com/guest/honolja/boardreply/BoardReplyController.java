package com.guest.honolja.boardreply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.guest.honolja.board.BoardDTO;

@Controller
public class BoardReplyController {
	
	@Autowired
	@Inject
	BoardReplyDAO dao;
	
	@Autowired
	ServletContext application;
	
	
	@RequestMapping("/boardreply.do")
	public ModelAndView board_reply(@RequestParam("idx")int b_no) {
		ModelAndView mav=new ModelAndView();
		List<BoardReplyDTO> list = dao.dbSelectReply(b_no);
		BoardReplyDTO dto = new BoardReplyDTO();
		
		BoardDTO dto2=new BoardDTO();
		
		int rcnt=dao.dbCountReply(b_no);
		mav.addObject("rcnt", rcnt);
		mav.addObject("list", list);
		dto.setRcnt(rcnt);
		dto2.setRcnt(rcnt);
		mav.setViewName("board/boardreply");
		
		return mav;
	}
	
	@RequestMapping("/boardreplyinsert.do")
	public String board_replyinsert(BoardReplyDTO dto) {
		dao.dbInsert(dto);
		return "redirect:/boarddetail.do?idx="+dto.getB_no(); 
	}
	
	@RequestMapping("/boardreplydelete.do")
	public String board_replydelete(@RequestParam("idx")int b_no, @RequestParam("br_no") int br_no) {
		dao.dbDelete(br_no);
	return "redirect:/boarddetail.do?idx="+ b_no;  
	}
	
	@RequestMapping("/boardreplyedit.do")
	public ModelAndView board_replyedit(@RequestParam("idx")int b_no, @RequestParam("br_no") int br_no) {
		BoardReplyDTO dto=new BoardReplyDTO();
		ModelAndView mav=new ModelAndView();
		dto=dao.dbDetail(br_no);
		
		mav.addObject("dto",dto);
		mav.setViewName("board/boardreplyedit");
		return mav;
		
	}
	
	@RequestMapping("boardreplyupdate.do")
	public String board_replyupdate(BoardReplyDTO dto) {
		dao.dbUpdate(dto);
		System.out.println(dto.getBr_no());
		return "redirect:/boarddetail.do?idx=" +dto.getB_no();
	}
}//class end