package com.guest.honolja.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
<<<<<<< HEAD

	@Autowired
	SqlSessionTemplate temp;
	// private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);


	//리스트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public List<BoardDTO> dbSelect(int start, int end, String skey, String sval) {
		BoardDTO dto = new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		List<BoardDTO> list = temp.selectList("board.selectAll", dto);
		return list;
	}//End

	public int dbCount(String skey, String sval) {
		BoardDTO dto = new BoardDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		int total = temp.selectOne("board.countAll", dto);
		return total;
	}//End

	public void dbInsert(BoardDTO dto) {
		dto.setB_uploadfilename(dto.getB_uploadfilename2().toString());
		temp.insert("board.insert", dto);
	}//End

	public BoardDTO dbDetail(int data) {
		BoardDTO dto = temp.selectOne("board.detail", data);
		return dto;
	}//End

	public void dbDelete(int b_no) {
		temp.delete("board.del", b_no);
		temp.delete("board.del2", b_no);
		
	}//End

	public void dbUpdate(BoardDTO dto) {
		temp.update("board.edit", dto);
	}//End

	public void dbViewCnt(int data) {
		temp.update("board.viewcnt", data);
	}//End

	//댓글@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public List<BoardDTO> dbRSelectReply(int b_no) {
		List<BoardDTO> list = temp.selectList("board.Rselect", b_no);
		return list;
	}//End

	public BoardDTO dbRDetail(int br_no) {
		BoardDTO dto = temp.selectOne("board.Rdetail", br_no);
		return dto;
	}//End

	public int dbRCountReply(int b_no) {
		int rcnt = temp.selectOne("board.Rcount", b_no);
		return rcnt;
	}//End

	public void dbRInsert(BoardDTO dto) {
		temp.insert("board.Rinsert", dto);
	}//End

	public void dbRDelete(int br_no) {
		temp.delete("board.Rdelete", br_no);
	}//End

	public void dbRUpdate(BoardDTO dto) {
		temp.update("board.Rupdate", dto);
	}//End

	//대댓글@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	public void dbRRInsert(BoardDTO dto) {
		temp.insert("board.RRinsert", dto);
	}//End

	public List<BoardDTO> dbRRSelect(int br_no) {
		List<BoardDTO> list = temp.selectList("board.RRselect", br_no);
		return list;
	}//End

	public void dbRRDelete(int brr_no) {
		temp.delete("board.RRdelete", brr_no);
	}//End
}//Class End
=======
		
	@Autowired
	SqlSessionTemplate temp;
	//private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);
	
	public List<BoardDTO> dbSelect() {
		List<BoardDTO> list=temp.selectList("board.select");
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
	  
	  public BoardDTO dbDetail(int data) {
		  BoardDTO dto=temp.selectOne("board.detail",data);
		  return dto;
		  //dasf
	  }
	  
	  public void dbDelete(int b_no) {
		  temp.delete("board.del",b_no);
		  temp.delete("board.del2",b_no);
	  }
	  
		public void dbUpdate(BoardDTO dto) {
			temp.update("board.edit", dto);
		}
		
		public void dbViewCnt(int data) {
			temp.update("board.viewcnt",data);
		}
		

		public String selectusers(int b_no) {
			String b_users = temp.selectOne("board.selectusers", b_no);
			return b_users;
		}//end
		

		public void boardmember(BoardDTO dto) {
			temp.update("board.boardmember", dto);
		}//end
		
}
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja.git
