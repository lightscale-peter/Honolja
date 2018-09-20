package com.guest.honolja.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	//private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);
	
	//ÆäÀÌÂ¡ °ü·Ã ¼¿·ºÆ®
	public List<BoardDTO> dbSelect() {
		
		List<BoardDTO> list = temp.selectList("board.select");
		return list;
		
    }//end
	
	public List<BoardDTO> dbSelect(int start,int end) {
		BoardDTO dto=new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		List<BoardDTO> list=temp.selectList("board.select2",dto);
		return list;
		    }//end
	
	public List<BoardDTO> dbSelect(int start,int end,String skey,String sval) {
		BoardDTO dto=new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		List<BoardDTO> list=temp.selectList("board.selectAll",dto);
		return list;
	}
	public List<BoardDTO> dbSelect2(String skey,String sval) {
		BoardDTO dto=new BoardDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		List<BoardDTO> list=temp.selectList("board.value",dto);
		System.out.println(skey);
		System.out.println(sval);
		return list;
	}
	
	
	public int dbCount(String skey,String sval) {
		BoardDTO dto=new BoardDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		int total=temp.selectOne("board.countAll", dto);

		return total;
	}
	
	
	  public void dbInsert(BoardDTO dto) {
		  dto.setB_uploadfilename(dto.getB_uploadfilename2().toString());
		  temp.insert("board.add", dto);
	  }
	  
	  public BoardDTO dbDetail_board(int data) {
		  BoardDTO dto=temp.selectOne("board.detail",data);
		  return dto;
		  //dasf
	  }
	  
	  public void dbDelete_board(int b_no) {
		  temp.delete("board.del",b_no);
		  temp.delete("board.del2",b_no);
	  }
	  
		public void dbUpdate(BoardDTO dto) {
			temp.update("board.edit", dto);
		}
		
		public void dbViewCnt(int data) {
			temp.update("board.viewcnt",data);
		}

/*		public List<BoardDTO> dbReplyCount() {
			List<BoardDTO> list=temp.selectList("board.replycount");
			return list;
		}*/
		public List<BoardDTO> dbReplyCount() {
			List<BoardDTO> list =temp.selectList("board.replycount");
			return list;
		}
		
		public List<BoardDTO> dbSelectReply(int b_no) {
			List<BoardDTO> list=temp.selectList("board.replyselect",b_no);
		
			return list;
			    }//end
		
		public BoardDTO dbDetail(int br_no) {
			BoardDTO	dto=temp.selectOne("board.replydetail",br_no);
			return dto;
		}
		
		public BoardDTO dbDetail2(int b_no) {
			BoardDTO dto;
			dto=temp.selectOne("board.replydetail2", b_no);
			return dto;
		}
		
		public int dbCountReply(int b_no) {
			
			int rcnt=temp.selectOne("board.replycount", b_no);
			return rcnt;
		}
		
		public void dbInsert_boardreply(BoardDTO dto) {
			temp.insert("board.replyadd",dto);
		}
		
		public void dbDelete(int br_no) {
			temp.delete("board.replydelete", br_no);
		}
		
		public void dbUpdate_boardreply(BoardDTO dto) {
			temp.update("board.replyupdate", dto);
		} 
			
		
		public void dbInsert_boardrreply(BoardDTO dto) {
			temp.insert("board.insert", dto);
		}
		public List<BoardDTO> dbSelect(String br_no) {
			List<BoardDTO> list=temp.selectList("board.select", br_no);
			return list;
		}
}
