package com.guest.honolja.list;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ListDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	
	public List<ListDTO> dbSelect( ){
		List<ListDTO> list=temp.selectList("firstlist.selectAll");
		return list;
	}//end
	public List<ListDTO> dbSelect(String skey, String sval) {
		ListDTO dto = new ListDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		List<ListDTO> list=temp.selectList("firstlist.selectAll",dto);
		
	  return list;
	}//end
	public List<ListDTO> dbSelectlo(ListDTO dto ){
		List<ListDTO> listlo=temp.selectList("firstlist.selectlo");
		return listlo;
	}//end
	
	public int dbCount() {
		int cnt=(Integer)temp.selectOne("firstlist.countAll");
		return cnt;
	}//end

	public int dbCount(String skey, String sval){ 
		ListDTO dto = new ListDTO();
		dto.setSval(sval);
		int total = (Integer)temp.selectOne("firstlist.countAll",dto);
		return total;
	}//end

}
