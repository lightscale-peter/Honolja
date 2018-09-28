package com.guest.honolja.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guest.honolja.board.BoardDTO;
import com.guest.honolja.member.MemberDTO;

@Repository
public class MypageDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public List<BoardDTO> myboard_select(String u_id) {		
		 List<BoardDTO> listB = temp.selectList("mypage.myboard_select", u_id);
		 return listB;
	}//내가 쓴 글 select
	
	//ȸ������
	public MemberDTO mypageselect(String u_id) {
		MemberDTO mto = new MemberDTO();
		mto = temp.selectOne("mypage.mypageselect", u_id);
		return mto;
		
	}//end
	
	//ȸ��Ż��
	public String mypageDelete(String u_id) {
		String u_pwd = temp.selectOne("mypage.mypagedelete", u_id);
		return u_pwd;
	}//end
	
	//ȸ��delete
	public void m_delete(MemberDTO mto) {
		temp.delete("mypage.m_delete", mto);
	}//end

}
