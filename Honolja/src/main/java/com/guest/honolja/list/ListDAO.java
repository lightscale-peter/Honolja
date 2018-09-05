package com.guest.honolja.list;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ListDAO {
		
	@Autowired
	SqlSessionTemplate temp;
	
	/*public List<ListDTO> dbSelect() {
		List<ListDTO> list=temp.selectList("firstlist.selectAll");
		return list;
	}

	public int dbCount() {

		return 0;
	}*/

}
