package com.guest.honolja.message;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MsgDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void db_insert(MsgDTO dto) {
		temp.insert("message.msgSend", dto);
		System.out.println("메세지 보내기 성공");
	}//메세지 보내기
	
	public List<MsgDTO> db_selectR(String userid){
		MsgDTO dto = new MsgDTO();
		dto.setUserid(userid);
		List<MsgDTO> listR = temp.selectList("message.msgSelectR", userid);
		return listR;
	}//받은쪽지함 임시(기능구현확인용)
	
	public List<MsgDTO> db_selectS(String userid){
		MsgDTO dto = new MsgDTO();
		dto.setUserid(userid);
		List<MsgDTO> listS = temp.selectList("message.msgSelectS", userid);
		return listS;
	}//보낸쪽지함 임시 (기능구현확인용)

	public MsgDTO db_detail(int data) {
		MsgDTO dto=temp.selectOne("message.msgDetail", data);
		return dto;
	}//쪽지 상세 확인
	
	public void db_check(int data) {
		temp.update("message.msgCheck", data);
	}//쪽지 읽음 전환
	
	public int db_msgcheck(String userid) {
		int cnt = temp.selectOne("message.msgselect", userid);
		return cnt;
	}//안 읽은 쪽지 수
	
	public void db_delete(int data) {
		temp.delete("message.msgDelete", data);
	}//쪽지 삭제
	
	public void db_cancel(MsgDTO dto) {
		temp.delete("message.msgCancel", dto);
	}//발송 취소
	
}//DAO end
