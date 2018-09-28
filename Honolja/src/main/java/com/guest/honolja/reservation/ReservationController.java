package com.guest.honolja.reservation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.guest.honolja.main.MainController;

@Controller
public class ReservationController {

	@Autowired
	ReservationDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping("/resevationAdd.do")
	public ModelAndView resAdd(ReservationDTO dto) {
		ModelAndView mav = new ModelAndView();
		dao.dbresAdd(dto);
		mav.setViewName("direct:/guestdetail.do" + dto.getG_no());
		return mav;
	}
}
