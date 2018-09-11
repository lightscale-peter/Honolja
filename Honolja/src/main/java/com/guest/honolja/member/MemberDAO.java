package com.guest.honolja.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void m_insert(MemberDTO mto) {
		temp.insert("member.m_insert", mto);
		System.out.println("저장성공");
	}//end
	
	public List<MemberDTO> m_select(){
		List<MemberDTO> list = temp.selectList("member.m_select");
		return list;
	}//end
	
	public MemberDTO m_detail(int data) {
		MemberDTO mto = temp.selectOne("member.m_detail", data);
		return mto;
	}//end
	
	public void m_delete(MemberDTO mto) {
		temp.delete("member.m_delete", mto);
	}//end
	
	public MemberDTO mypageDelete(String data) {
		MemberDTO mto = temp.selectOne("member.mypageDelete", data);
		return mto;
	}//end
	
	public MemberDTO login(MemberDTO mto) {
		mto = temp.selectOne("member.login", mto);
		return mto;
	}//end
	
	//아이디 중복체크
	public int idCheck(String u_id) {
		int u_cnt = temp.selectOne("member.idCheck", u_id);
		return u_cnt;
	}//end
	
	//이메일 체크
	public void m_emailcheck(MemberDTO mto) {
		System.out.println("이메일 키 = " + mto.getU_emailkey());
		System.out.println("이메일  = " + mto.getU_email());
		temp.update("member.emailkey", mto);
	}//end
	
	public void m_Auth(String u_email) throws Exception{
		temp.update("member.emailcheck", u_email);
	}
}//MemberDTO class END
