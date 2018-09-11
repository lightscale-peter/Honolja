package com.guest.honolja.list;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);

	@Autowired
	ListDAO dao;
	
	@RequestMapping("/list.do")
	public ModelAndView guest_select(HttpServletRequest request) { ///달력정보 받아오기
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
	
	
	@RequestMapping("/location.do")
	public ModelAndView guest_selectloc(ListDTO dto) {//게스트하우스 정보 생성 list로 띄워주기
	  ModelAndView mav = new ModelAndView( );
	  List<ListDTO> listlo=dao.dbSelectlo(dto);
	  mav.addObject("listlo", listlo);
	  String url="firstlist/location";
	  mav.setViewName(url);
	  return mav;
	}//end
	
}//ListController class end
