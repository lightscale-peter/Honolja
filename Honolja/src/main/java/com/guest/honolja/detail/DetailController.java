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
import com.guest.honolja.reservation.ReservationDAO;
import com.guest.honolja.review.ReviewDAO;
import com.guest.honolja.review.ReviewDTO;

@Controller
public class DetailController {

	@Autowired
	DetailDAO dao;
	@Autowired
	ReviewDAO dao1;
	@Autowired
	ReservationDAO dao2;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping("/guestdetail.do")
	public ModelAndView guest_detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int g_no = Integer.parseInt(request.getParameter("g_no"));
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		String startDate = request.getParameter("check_in");
		String endDate = request.getParameter("check_out");
		String nights = request.getParameter("nights");

		DetailDTO dto = new DetailDTO();
		dto.setG_no(g_no);
		dto.setCheck_in(startDate);
		dto.setCheck_out(endDate);

		List<DetailDTO> room = dao.dbroomSelect(dto);
		List<DetailDTO> img = dao.dbimageSelect(g_no);
		int count = dao1.dbreviewCount(g_no);
		DetailDTO info = dao.dbroomView(g_no);
		List<ReviewDTO> review = dao1.dbreviewSelect(g_no);
		List<DetailDTO> res = dao2.dbresSelect(dto);

		int sum = 0;
		double avg = 0;

		for (int i = 0; i < review.size(); i++) {
			sum += Integer.parseInt(review.get(i).getRe_score());
		}

		if (count > 0) {
			avg = (double) (sum / count);
		}

		if (res != null) {
			for (int i = 0; i < res.size(); i++) {
				for (int j = 0; j < room.size(); j++) {
					if (room.get(j).getR_no() == res.get(i).getR_no()) {
						room.get(j).setRes_ok(res.get(i).getRes_ok());
					}
				}
			}
		}

		mav.addObject("check_in", startDate);
		mav.addObject("check_out", endDate);
		mav.addObject("nights", nights);
		mav.addObject("adult", adult);
		mav.addObject("child", child);
		mav.addObject("list", room);
		mav.addObject("info", info);
		mav.addObject("avg", avg);
		mav.addObject("g_no", g_no);
		mav.addObject("img", img);
		mav.addObject("rcnt", count);
		mav.addObject("res", res);
		mav.addObject("review", review);
		mav.setViewName("/detail/guestDetail");
		return mav;
	}
}
