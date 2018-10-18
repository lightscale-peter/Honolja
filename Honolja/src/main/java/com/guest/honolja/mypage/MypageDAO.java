package com.guest.honolja.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guest.honolja.board.BoardDTO;
import com.guest.honolja.list.ListDTO;
import com.guest.honolja.member.MemberDTO;
import com.guest.honolja.reservation.ReservationDTO;

@Repository
public class MypageDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	//내가 쓴 글
	public List<BoardDTO> mypage_board(String u_id){
		List<BoardDTO> listB = temp.selectList("mypage.mypage_board", u_id);
		return listB;
	}//end
	
	
	//찜 목록
	public List<ListDTO> mypage_like(String u_id){
		List<ListDTO> listL = temp.selectList("mypage.mypage_like", u_id);
		return listL;
	}//end
	
	//예약 현황
	public List<ReservationDTO> mypage_rsvt(String u_id){
		List<ReservationDTO> listRS = temp.selectList("mypage.mypage_rsvt", u_id);
		return listRS;
	}//end
	
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
