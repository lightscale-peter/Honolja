package com.guest.honolja.main;

import java.util.List;

import org.apache.log4j.chainsaw.Main;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	
	//Check id and pwd in DB for normal Login
	public int dbSelect(MainDTO dto) {
		return temp.selectOne("main.selectIdPwd", dto);
	}
	
	//Print notice_list in main view
	public List<MainDTO> dbSelectFixedNotice() {
		return temp.selectList("main.selectFixedNotice");
	}
	
	//Insert id when guest try to login as NAVER API
	public void dbInsertUsersInfo(MainDTO dto){
		temp.insert("main.insertUsersInfo", dto);
	}
	
	//Check id in DB for NAVER Login. if it isn't, insert.
	public int dbSelectIdCheck(String u_id) {
		return temp.selectOne("main.selectIdCheck", u_id);
	}
	
}
