package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.mapper.ExhibitionMapper;

@Repository
public class ExhibitionDao {

	@Autowired
	ExhibitionMapper exhibitionMapper;
	
	public List<ExhibitionBean> getExhibitionInfo() {
		
		return exhibitionMapper.getExhibitionInfo();
	}
}
