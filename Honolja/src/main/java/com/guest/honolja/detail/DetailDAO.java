package com.guest.honolja.detail;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DetailDAO {

	@Autowired
	SqlSessionTemplate temp;

	public List<DetailDTO> dbroomSelect(int g_no) {
		List<DetailDTO> list = temp.selectList("detail.roomSelect", g_no);
		return list;
	}

	public List<DetailDTO> dbimageSelect(int g_no) {
		List<DetailDTO> list = temp.selectList("detail.imageSelect", g_no);
		return list;
	}
}
