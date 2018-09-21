package com.guest.honolja.boardreply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardReplyDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	//private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);
	
	
	public List<BoardReplyDTO> dbSelectReply(int b_no) {
		List<BoardReplyDTO> list=temp.selectList("boardreply.replyselect",b_no);
		return list;
		    }//end
	
	public BoardReplyDTO dbDetail(int br_no) {
		BoardReplyDTO dto;
		dto=temp.selectOne("boardreply.replydetail",br_no);
		return dto;
	}
	
	public int dbCountReply(int b_no) {
		
		int rcnt=temp.selectOne("boardreply.replycount", b_no);
		return rcnt;
	}
	
	public void dbInsert(BoardReplyDTO dto) {
		temp.insert("boardreply.replyadd",dto);
	}
	
	public void dbDelete(int br_no) {
		temp.delete("boardreply.replydelete", br_no);
	}
	
	public void dbUpdate(BoardReplyDTO dto) {
		temp.update("boardreply.replyupdate", dto);
	} 
	

	
	  
}
