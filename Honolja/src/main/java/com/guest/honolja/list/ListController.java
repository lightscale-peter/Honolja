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
	public ModelAndView ghlist_select() {
	  ModelAndView mav = new ModelAndView( );
	  //int total=dao.dbCount();
	  //List<ListDTO> list=dao.dbSelect();
	  
	  //mav.addObject("list", list);
	  //mav.addObject("total",total);
	  String url="/WEB-INF/views/firstlist/firstlist.jsp";
	  mav.setViewName(url);
	  return mav;
	}//end
}
