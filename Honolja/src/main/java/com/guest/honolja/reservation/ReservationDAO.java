package com.guest.honolja.reservation;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {

	@Autowired
	SqlSessionTemplate temp;

	public List<ReservationDTO> dbresSelect(ReservationDTO dto) {
		List<ReservationDTO> res = temp.selectList("reservation.resSelect", dto);
		return res;
	}

	public void dbresAdd(ReservationDTO dto) {
		temp.insert("reservation.resAdd", dto);
	}
}
