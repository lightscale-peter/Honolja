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

import com.guest.honolja.info.InfoDTO;


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
		String filter="g_no", range="asc"; //필터, 정렬방식
		
		check_in=request.getParameter("check_in");
		check_out=request.getParameter("check_out");
		basic= request.getParameter("basic");
		System.out.println("check_in" + check_in + "check_out"+check_out);

		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		
		if(sval==null || sval==""){skey="g_name"; sval=" ";}
		logger.info("skey="+skey+" sval="+sval);
		
		low_price = request.getParameter("sortFilter");
		if(low_price != null) {
			if(low_price.equals("a")) {startprice=0; endprice=20000;}
			else if(low_price.equals("b")) {startprice=20000; endprice=40000;}
			else if(low_price.equals("c")) {startprice=40000; endprice=60000;}
			else if(low_price.equals("d")) {startprice=60000; endprice=80000;}
			else if(low_price.equals("e")) {startprice=80000; endprice=100000;}
			}
		System.out.println("low_price="+low_price+"startprice="+startprice+"endprice="+endprice);

		if(basic != null) {
			if(basic.equals("basic")) {filter="g_no"; range="asc";}//기본순
			if(basic.equals("reply")) {filter="reviewcnt"; range="desc";}//댓글 많은 순
			if(basic.equals("priceup")) {filter="low_price"; range="asc";}//가격 낮은 순
			if(basic.equals("pricedown")) {filter="low_price"; range="desc";}//가격 높은 순
		}
		System.out.println("basic="+basic+" filter="+filter+" range="+range);
		
		dto.setCheck_in(check_in);
		dto.setCheck_out(check_out);
		
		int total=dao.dbCount(skey,sval);
		
		/*int like_flag = dao.dblike_cnt(dto);
		System.out.println("like_flag="+like_flag);*/
		
		List<ListDTO> list=dao.dbSelect(skey,sval,startprice,endprice,filter,range);
		mav.addObject("check_in",check_in);
		mav.addObject("check_out",check_out);
		
		mav.addObject("basic",basic);
		mav.addObject("low_price",low_price);
		mav.addObject("startprice",startprice);
		mav.addObject("endprice",endprice);
		mav.addObject("filter",filter);
		mav.addObject("range",range);
		
		mav.addObject("list", list);
		mav.addObject("total",total);
		mav.addObject("sval",sval);
		mav.addObject("skey",skey);
		String url="firstlist/firstlist";
		/*mav.addObject("like_flag",like_flag);*/
		String u_id = request.getSession().getAttribute("checked").toString();
		mav.addObject("u_id",u_id);
		
		
		
		mav.setViewName(url);
	
		return mav;
	}//end
	
	
	@RequestMapping("/guestlocation.do")
	public ModelAndView guest_selectlo(HttpServletRequest request, ListDTO dto) {
		ModelAndView mav = new ModelAndView( );
		String filter="g_no", range="asc"; //필터, 정렬방식
		String g_addr="",low_price="";
		int startprice=0, endprice=1000000;
		String check_in, check_out;
		String basic="basic";
		check_in=request.getParameter("check_in");
		check_out=request.getParameter("check_out");
		basic= request.getParameter("basic");
		System.out.println("check in" + check_in + "check_out"+check_out);
		
		g_addr = request.getParameter("g_addr");
		System.out.print("g_addr="+g_addr);
		low_price = request.getParameter("sortFilter");
		
		if(low_price == null || low_price=="") {low_price=""; }
		
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
		System.out.println("low_price="+low_price+"startprice="+startprice+"endprice="+endprice);

		if(basic != null) {
			if(basic.equals("basic")) {filter="g_no"; range="asc";}//기본순
			if(basic.equals("reply")) {filter="reviewcnt"; range="desc";}//댓글 많은 순
			if(basic.equals("priceup")) {filter="low_price"; range="asc";}//가격 낮은 순
			if(basic.equals("pricedown")) {filter="low_price"; range="desc";}//가격 높은 순
		}
		System.out.println("basic="+basic+" filter="+filter+" range="+range);
		
		List<ListDTO> listlo=dao.dbSelectlo(g_addr,startprice,endprice,filter,range);
		mav.addObject("basic",basic);
		mav.addObject("filter",filter);
		mav.addObject("range",range);
		
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
	@RequestMapping("guestlike.do")
	public ModelAndView guest_like(HttpServletRequest request, ListDTO dto) {	
		int g_no=0;
		if(request.getParameter("g_no") != null) {
			g_no = Integer.parseInt(request.getParameter("g_no"));
		}
		
		String u_id = request.getParameter("u_id");	
		/*String btn_flag = request.getParameter("btn_flag");*/
		
		dto.setU_id(u_id);
		dto.setG_no(g_no);
		
		if(dao.dblike_cnt(dto) == 0) {
			dao.dbinsertlike(dto);
			System.out.println("insert");
		}else {
			dao.dbdeletelike(dto);
			System.out.println("delete");
		}
		
		
		ModelAndView mav = new ModelAndView( );
		String url="firstlist/like_button";
		mav.setViewName(url);
	return mav;
	}
	
}//ListController class end
