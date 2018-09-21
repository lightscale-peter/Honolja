package com.guest.honolja.mypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guest.honolja.member.MemberDTO;

@Repository
public class MypageDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	//È¸¿øÁ¤º¸
	public MemberDTO mypageselect(String u_id) {
		MemberDTO mto = new MemberDTO();
		mto = temp.selectOne("mypage.mypageselect", u_id);
		return mto;
		
	}//end
	
	//È¸¿øÅ»Åð
	public String mypageDelete(String u_id) {
		String u_pwd = temp.selectOne("mypage.mypagedelete", u_id);
		return u_pwd;
	}//end
	
	//È¸¿ødelete
	public void m_delete(MemberDTO mto) {
		temp.delete("mypage.m_delete", mto);
	}//end

}
