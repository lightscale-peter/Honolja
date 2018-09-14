package com.guest.honolja.main;

import java.util.List;

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
	
	public List<MainDTO> dbSelectFixedNotice() {
		return temp.selectList("main.selectFixedNotice");
	}
	
	public List<MainDTO> dbSelectImgBoard(MainDTO dto){
		return temp.selectList("main.selectImageBoard", dto);
	}
	
	public int dbCountImgBoard() {
		return temp.selectOne("main.CountImageBoard");
	}
	
	public void dbInsertUsersInfo(MainDTO dto){
		temp.insert("main.insertUsersInfo", dto);
	}
	
	public int dbSelectIdCheck(String u_id) {
		return temp.selectOne("main.selectIdCheck", u_id);
	}
	
	

}
