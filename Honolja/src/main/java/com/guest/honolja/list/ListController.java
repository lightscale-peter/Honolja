package com.guest.honolja.list;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);

	@Autowired
	ListDAO dao;
	
	@RequestMapping("/guestlist.do")
	public ModelAndView guest_select(HttpServletRequest request) { ///�떖�젰�젙蹂� 諛쏆븘�삤湲�
		ModelAndView mav = new ModelAndView( );
		String skey="", sval="" , returnpage="";
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		
		if(sval==null || sval=="") {skey="g_name"; sval=" ";}
		logger.info("skey="+skey+" sval="+sval);
		  
		returnpage = "&keyfield="+skey+"&keyword="+sval;
		
		int total=dao.dbCount(skey,sval);
		
		List<ListDTO> list=dao.dbSelect(skey,sval);
		mav.addObject("list", list);
		mav.addObject("total",total);
		mav.addObject("sval",sval);
		mav.addObject("skey",skey);
		String url="firstlist/firstlist";
		mav.setViewName(url);
		return mav;
	}//end
	
	
	@RequestMapping("/guestlocation.do")
	public ModelAndView guest_selectloc(ListDTO dto) {//寃뚯뒪�듃�븯�슦�뒪 �젙蹂� �깮�꽦 list濡� �쓣�썙二쇨린
	  ModelAndView mav = new ModelAndView( );
	  List<ListDTO> listlo=dao.dbSelectlo(dto);
	  mav.addObject("listlo", listlo);
	  String url="firstlist/location";
	  mav.setViewName(url);
	  return mav;
	}//end
	
}//ListController class end
