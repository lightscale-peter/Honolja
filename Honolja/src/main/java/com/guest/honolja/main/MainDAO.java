package com.guest.honolja.main;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	
	public int dbSelect(MainDTO dto) {
		return temp.selectOne("main.selectIdPwd", dto);
	}

}
