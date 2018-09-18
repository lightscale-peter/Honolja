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
	
	//Print img_board List
	public List<MainDTO> dbSelectImgBoard(MainDTO dto){
		return temp.selectList("main.selectImageBoard", dto);
	}
	
	//Count img_board total number
	public int dbCountImgBoard(MainDTO dto) {
		return temp.selectOne("main.CountImageBoard", dto);
	}
	
	//Insert id when guest try to login as NAVER API
	public void dbInsertUsersInfo(MainDTO dto){
		temp.insert("main.insertUsersInfo", dto);
	}
	
	//Check id in DB for NAVER Login. if it isn't, insert.
	public int dbSelectIdCheck(String u_id) {
		return temp.selectOne("main.selectIdCheck", u_id);
	}
	
	//Print img_board_detail according to i_no primary key of the table
	public MainDTO dbSelectImgBoardDetail(String i_no){
		return temp.selectOne("main.selectImageBoardDetail", i_no);
	}
	
	public void dbInsertImgBoard(MainDTO dto) {
		temp.insert("main.insertImageBoard", dto);
	}
}
