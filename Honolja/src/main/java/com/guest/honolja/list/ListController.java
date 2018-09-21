package com.guest.honolja.list;

import java.util.List;
import java.text.DateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);

	@Autowired
	ListDAO dao;	
	@RequestMapping("/guestlist.do")

	public ModelAndView guest_select(HttpServletRequest request,ListDTO dto) {
		ModelAndView mav = new ModelAndView( );
		String skey="", sval=""; //검색
		int startprice=0, endprice=200000; //가격대 선택 최소-최대가격
		String low_price="", basic=""; //가격대 or 기본정렬 value값 가져와서 저장되는 변수
		String check_in="", check_out=""; //check_in check_out 시간 저장되는 변수
		
		check_in=request.getParameter("check_in");
		check_out=request.getParameter("check_out");
		System.out.println("check_in" + check_in + "check_out"+check_out);
		
		low_price = request.getParameter("sortFilter");
		basic = request.getParameter("basic");
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		
		if(sval==null || sval=="") /*|| low_price == null || low_price==" " || basic=="" || basic==null*/
		{skey="g_name"; sval=" ";}
		logger.info("skey="+skey+" sval="+sval);
		
		if(low_price != null) {
			if(low_price.equals("a")) {startprice=0; endprice=20000;}
			else if(low_price.equals("b")) {startprice=20000; endprice=40000;}
			else if(low_price.equals("c")) {startprice=40000; endprice=60000;}
			else if(low_price.equals("d")) {startprice=60000; endprice=80000;}
			else if(low_price.equals("e")) {startprice=80000; endprice=100000;}
			}
		//System.out.println("startprice="+startprice+"endprice="+endprice);
		
		/*if(basic != null) {
			if(basic.equals("basic")) {}
			else if(basic.equals("like")) {}
			else if(basic.equals("reply")) {}
		}
		System.out.println("basic"+"like"+"reply");*/		
		dto.setCheck_in(check_in);
		dto.setCheck_out(check_out);
		
		int total=dao.dbCount(skey,sval);
		
		List<ListDTO> list=dao.dbSelect(skey,sval,startprice,endprice);
		mav.addObject("check_in",check_in);
		mav.addObject("check_out",check_out);
		
		mav.addObject("basic",basic);
		mav.addObject("low_price",low_price);
		mav.addObject("startprice",startprice);
		mav.addObject("endprice",endprice);
		
		mav.addObject("list", list);
		mav.addObject("total",total);
		mav.addObject("sval",sval);
		mav.addObject("skey",skey);
		String url="firstlist/firstlist";
		mav.setViewName(url);
		return mav;
	}//end
	
	
	@RequestMapping("/guestlocation.do")
	public ModelAndView guest_selectlo(HttpServletRequest request, ListDTO dto) {
		ModelAndView mav = new ModelAndView( );
		String g_addr="",low_price="";
		int startprice=0, endprice=1000000;
		String check_in, check_out;
		String basic="";
		check_in=request.getParameter("check_in");
		check_out=request.getParameter("check_out");
		System.out.println("check in" + check_in + "check_out"+check_out);
		
		g_addr = request.getParameter("g_addr");
		System.out.print("g_addr="+g_addr);
		low_price = request.getParameter("sortFilter");
		
		basic= request.getParameter("basic");
		
		if(low_price == null || low_price=="" /*|| g_addr==null || g_addr == ""*/) {/* g_addr="";*/ low_price=""; }
		
		if(g_addr != null) {
		if(g_addr.equals("seoul")) {g_addr="서울";}
		else if(g_addr.equals("kyungki")) {g_addr = "경기";}
		else if(g_addr.equals("inchun")) {g_addr = "인천";}
		else if(g_addr.equals("gangwon")) {g_addr = "강원";}
		else if(g_addr.equals("jeju")) {g_addr = "제주";}
		else if(g_addr.equals("chongnam")) {g_addr = "충남";}
		else if(g_addr.equals("chongbok")) {g_addr = "충북";}
		else if(g_addr.equals("kyungnam")) {g_addr = "경남";}
		else if(g_addr.equals("kyungbok")) {g_addr = "경북";}
		else if(g_addr.equals("busan")) {g_addr = "부산";}
		else if(g_addr.equals("junnam")) {g_addr = "전남";}
		else if(g_addr.equals("junju")) {g_addr = "전북";}
		else {}
		}
		System.out.println("g_addr="+g_addr);

		dto.setCheck_in(check_in);
		dto.setCheck_out(check_out);
		
		if(low_price != null) {
			if(low_price.equals("a")) {startprice=0; endprice=20000;}
			else if(low_price.equals("b")) {startprice=20000; endprice=40000;}
			else if(low_price.equals("c")) {startprice=40000; endprice=60000;}
			else if(low_price.equals("d")) {startprice=60000; endprice=80000;}
			else if(low_price.equals("e")) {startprice=80000; endprice=100000;}
		}
		System.out.println("startprice="+startprice+"endprice="+endprice);
		 
		List<ListDTO> listlo=dao.dbSelectlo(g_addr,startprice,endprice);
		mav.addObject("basic",basic);
		mav.addObject("check_in",check_in);
		mav.addObject("check_out",check_out);
		mav.addObject("low_price",low_price);
		mav.addObject("startprice",startprice);
		mav.addObject("endprice",endprice);
		mav.addObject("listlo", listlo);
		mav.addObject("g_addr",g_addr);
		String url="firstlist/location";
		mav.setViewName(url);
		return mav;
	}//end
	
}//ListController class end
