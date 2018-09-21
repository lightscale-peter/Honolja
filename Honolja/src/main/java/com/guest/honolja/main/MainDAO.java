package com.guest.honolja.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guest.honolja.member.MemberDTO;

@Repository
public class MainDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	
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
	}

}
