package com.guest.honolja.detail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guest.honolja.main.MainController;
import com.guest.honolja.review.ReviewDAO;
import com.guest.honolja.review.ReviewDTO;

@Controller
public class DetailController {

	@Autowired
	DetailDAO dao;
	@Autowired
	ReviewDAO dao1;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping("/guestdetail.do")
	public ModelAndView guest_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int g_no = Integer.parseInt(request.getParameter("g_no"));
		List<DetailDTO> img = dao.dbimageSelect(g_no);
		int count = dao1.dbreviewCount(g_no);
		DetailDTO info = dao.dbroomView(g_no);
		List<ReviewDTO> review = dao1.dbreviewSelect(g_no);

		int sum = 0;
		int avg = 0;

//		for (int i = 0; i < review.size(); i++) {
//			sum += Integer.parseInt(review.get(i).getRe_score());
//			System.out.println("별점 합계 : " + sum);
//		}

//		avg = sum / count;
//		System.out.println("별점 평균 : " + avg);

		mav.addObject("info", info);
		mav.addObject("avg", avg);
		mav.addObject("g_no", g_no);
		mav.addObject("img", img);
		mav.addObject("rcnt", count);
		mav.setViewName("/detail/guestDetail");
		return mav;
	}

	@RequestMapping("/roominfo.do")
	public ModelAndView guest_room(DetailDTO dto) {
		ModelAndView mav = new ModelAndView();
		List<DetailDTO> room = dao.dbroomSelect(dto.getG_no());
		mav.addObject("list", room);
		mav.setViewName("/detail/guestRoomInfo");
		return mav;
	}
}
