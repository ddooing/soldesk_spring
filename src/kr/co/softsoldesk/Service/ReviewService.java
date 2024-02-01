package kr.co.softsoldesk.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.dao.ReviewDao;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao reviewDao;

	// 예약시 소감문 생성
	public void reserve_review_create(int reserve_id) {

		reviewDao.reserve_review_create(reserve_id);
	}

}
