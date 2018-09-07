package com.guest.honolja.list;

import java.util.List;

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
	
	@RequestMapping("/list.do")
	public ModelAndView guest_select() { ///달력정보 받아오기, 게스트하우스 정보 생성 list로 띄워주기
	  ModelAndView mav = new ModelAndView( );
	  //int total=dao.dbCount();
	  List<ListDTO> list=dao.dbSelect();
	  mav.addObject("list", list);
	  
	  /*if(area == "서울') {   //지도상으로 초기데이터 보내주기위한 if문
		  basic_x = ??????;
		  y = ???
	  }*/
	  
	 // mav.addObject("total",total);
	  String url="firstlist/firstlist";
	  mav.setViewName(url);
	  return mav;
	}//end
	
	@RequestMapping("/location.do")
	public ModelAndView guest_selectloc() { ///달력정보 받아오기, 게스트하우스 정보 생성 list로 띄워주기
	  ModelAndView mav = new ModelAndView( );
	  //int total=dao.dbCount();
	  List<ListDTO> listlo=dao.dbSelectlo();
	  mav.addObject("listlo", listlo);
	 // mav.addObject("total",total);
	  String url="firstlist/location";
	  mav.setViewName(url);
	  return mav;
	}//end
	
}//ListController class end
