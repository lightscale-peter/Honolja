package com.guest.honolja.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ReviewDAO {

	@Autowired
	SqlSessionTemplate temp;
	
	public List<ReviewDTO> dbreviewSelect(int g_no) {
		List<ReviewDTO> list = temp.selectList("review.select", g_no);
		return list;
	}
}
