package com.guest.honolja.mypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guest.honolja.member.MemberDTO;

@Repository
public class MypageDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	//회원정보
	public MemberDTO mypageselect(String u_id) {
		MemberDTO mto = new MemberDTO();
		mto = temp.selectOne("mypage.mypageselect", u_id);
		return mto;

	}//end
	
	//회원수정
	public MemberDTO useredit(String u_id) {
		MemberDTO mto = new MemberDTO();
		mto = temp.selectOne("mypage.useredit", u_id);
		return mto;
	}//end
	
	//회원수정 저장
	public void usereditsave(MemberDTO mto) {
		temp.update("mypage.usereditsave", mto);
	}

	
	//회원탈퇴
	public String mypageDelete(String u_id) {
		String u_pwd = temp.selectOne("mypage.mypagedelete", u_id);
		return u_pwd;
	}//end
	
	//회원delete
	public void m_delete(MemberDTO mto) {
		temp.delete("mypage.m_delete", mto);
	}//end

}
