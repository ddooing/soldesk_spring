package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.mapper.ReviewMapper;

@Repository
public class ReviewDao {

	@Autowired
	private ReviewMapper reviewMapper;

	// 예약시 소감문 생성
	public void reserve_review_create(int reserve_id) {

		reviewMapper.reserve_review_create(reserve_id);
	}

}
