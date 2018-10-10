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
	}//end
	
	public List<MemberDTO> m_select(MemberDTO mto){
		List<MemberDTO> list = temp.selectList("member.m_select", mto);
		return list;
	}//end
	
	public MemberDTO m_detail(int data) {
		MemberDTO mto = temp.selectOne("member.m_detail", data);
		return mto;
	}//end
	
	public int m_count(MemberDTO mto) {
		int cnt = temp.selectOne("member.m_count", mto);
		return cnt;
	}
	
	public MemberDTO login(MemberDTO mto) {
		mto = temp.selectOne("member.login", mto);
		return mto;
	}//end
	
	//�븘�씠�뵒 以묐났泥댄겕
	public int idCheck(String u_id) {
		int u_cnt = temp.selectOne("member.idCheck", u_id);
		return u_cnt;
	}//end
	
	//�씠硫붿씪 泥댄겕
	public void m_emailcheck(MemberDTO mto) {
		temp.update("member.emailkey", mto);
	}//end
	
	public void m_Auth(String u_id) throws Exception{
		temp.update("member.emailcheck", u_id);
	}//end
	
	public String findID(MemberDTO mto) {
		String u_id = temp.selectOne("member.findID", mto);
		return u_id;
	}//end
}//MemberDTO class END
