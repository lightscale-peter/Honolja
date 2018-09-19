package com.guest.honolja.info;

import java.util.List;

import org.apache.log4j.chainsaw.Main;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAO {
		
	@Autowired
	SqlSessionTemplate temp;

	
	//Print img_board List
	public List<InfoDTO> dbSelectImgBoard(InfoDTO dto){
		return temp.selectList("info.selectImageBoard", dto);
	}
	
	//Count img_board total number
	public int dbCountImgBoard(InfoDTO dto) {
		return temp.selectOne("info.CountImageBoard", dto);
	}
	
	//Print img_board_detail according to i_no primary key of the table
	public InfoDTO dbSelectImgBoardDetail(int i_no){
		return temp.selectOne("info.selectImageBoardDetail", i_no);
	}
	
	//Write contents on img_board
	public void dbInsertImgBoard(InfoDTO dto) {
		temp.insert("info.insertImageBoard", dto);
	}
	
	//Increase view_cnt value
	public void dbUpdateImgBoardViewCnt(InfoDTO dto) {
		temp.update("info.updateImageBoardViewCnt", dto);
	}
	
	//Increase star_cnt value
	public void dbUpdateImgBoardStarCnt(InfoDTO dto) {
		temp.update("info.updateImageBoardStarCnt", dto);
	}
	
	//Insert img_board like info
	public void dbInsertImgBoardLike(InfoDTO dto) {
		temp.insert("info.insertImageBoardLike", dto);
	}
	
	//check img_board like info
	public int dbSelectImgBoardLikeCheck(InfoDTO dto) {
		return temp.selectOne("info.selectCheckImgBoardLike", dto);
	}
	
	//update img_board like info
	public int dbUpdateImgBoardLike(InfoDTO dto) {
		return temp.insert("info.updateImageBoardLike", dto);
	}
	
	//select img_like for checking like or not. and send img_board_detail
	public InfoDTO dbSelectImgBoardLike(InfoDTO dto) {
		return temp.selectOne("info.selectImgBoardLike", dto);
	}
	
	//update img_board_detail
	public void dbUpdateImgBoardDetail(InfoDTO dto) {
		temp.update("info.updateImgBoardDetail", dto);
	}
	
	public void dbDeleteImgBoard(int i_no) {
		temp.delete("info.deleteImgBoardDetail", i_no);
	}
	
}
