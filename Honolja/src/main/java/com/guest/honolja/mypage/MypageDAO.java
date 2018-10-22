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
	
	//³»°¡ ¾´ ±Û
	public List<BoardDTO> mypage_board(String u_id){
		List<BoardDTO> listB = temp.selectList("mypage.mypage_board", u_id);
		return listB;
	}//end
	
	
	//Âò ¸ñ·Ï
	public List<ListDTO> mypage_like(String u_id){
		List<ListDTO> listL = temp.selectList("mypage.mypage_like", u_id);
		return listL;
	}//end
	
	//¿¹¾à ÇöÈ²
	public List<ReservationDTO> mypage_rsvt(String u_id){
		List<ReservationDTO> listRS = temp.selectList("mypage.mypage_rsvt", u_id);
		return listRS;
	}//end
	
<<<<<<< HEAD
	public void rsvt_cancel(int data) {
		temp.delete("mypage.rsvt_cancel", data);
	}
=======
	//È¸¿øÁ¤º¸
	public MemberDTO mypageselect(String u_id) {
		MemberDTO mto = new MemberDTO();
		mto = temp.selectOne("mypage.mypageselect", u_id);
		return mto;
	}//end
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
	
	//È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
	public MemberDTO useredit(String u_id) {
		MemberDTO mto = new MemberDTO();
		mto = temp.selectOne("mypage.useredit", u_id);
		return mto;
	}//end
	
	//È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	public void usereditsave(MemberDTO mto) {
		temp.update("mypage.usereditsave", mto);
	}

	
	//È¸ï¿½ï¿½Å»ï¿½ï¿½
	public String mypageDelete(String u_id) {
		String u_pwd = temp.selectOne("mypage.mypagedelete", u_id);
		return u_pwd;
	}//end
	
	//È¸ï¿½ï¿½delete
	public void m_delete(MemberDTO mto) {
		temp.delete("mypage.m_delete", mto);
	}//end

}
