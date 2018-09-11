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

	@RequestMapping("/detail.do")
	public ModelAndView guest_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int g_no = Integer.parseInt(request.getParameter("g_no"));
		List<DetailDTO> list = dao.dbroomSelect(g_no);
		List<DetailDTO> img = dao.dbimageSelect(g_no);
		List<ReviewDTO> reveiw = dao1.dbreviewSelect(g_no);
		for (int i = 0; i < img.size(); i++) {
			logger.info(img.get(i).getI_url());
		}
		mav.addObject("list", list);
		mav.addObject("review", reveiw);
		mav.addObject("img", img);
		mav.setViewName("/detail/guestDetail");
		return mav;
	}
}
