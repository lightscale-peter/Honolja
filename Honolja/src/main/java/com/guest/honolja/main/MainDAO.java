package com.guest.honolja.main;

import java.util.List;

<<<<<<< HEAD
=======
import org.apache.log4j.chainsaw.Main;
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guest.honolja.member.MemberDTO;

@Repository
public class MainDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	
<<<<<<< HEAD
	public int dbSelect(MemberDTO mto) {
		int u_cnt = temp.selectOne("main.selectIdPwd", mto);
		return u_cnt;
	}
	
	public String emailcheck(MemberDTO mto) {
		String u_emailcheck = temp.selectOne("main.emailcheck", mto);
		return u_emailcheck;
	}
	
	public List<MainDTO> dbSelectFixedNotice() {
		return temp.selectList("main.selectFixedNotice");
=======
<<<<<<< HEAD
	public int dbSelect(MemberDTO mto) {
		int u_cnt = temp.selectOne("main.selectIdPwd", mto);
		return u_cnt;
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
	}
	
	public String emailcheck(MemberDTO mto) {
		String u_emailcheck = temp.selectOne("main.emailcheck", mto);
		return u_emailcheck;
=======
	//Check id and pwd in DB for normal Login
	public int dbSelect(MainDTO dto) {
		return temp.selectOne("main.selectIdPwd", dto);
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
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
