package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.mapper.BannerMapper;

@Repository
public class BannerDao {
	
	@Autowired
	private BannerMapper bannerMapper;
	// 승연 ```````````````````````````````````````````````
	
	public void insertbanner_apply(BannerApplyFormBean bannerApplyFormBean)
	{
		bannerMapper.insertbanner_apply(bannerApplyFormBean);
	}
	// 배너 신청 시 file 테이블에 저장
	public void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean) {
		bannerMapper.addfiletableBanner1(bannerApplyFormBean);
	}
	// 전시회 추가 파일테이블에서 file_id 가져오기
	public int getFileId(String name) {
		
		return bannerMapper.getFileId(name); 
	}
	// 배너 신청 페이지
	public List<ExhibitionBean> getApply_personExhibitionlist(int user_id) {
		return bannerMapper.getApply_personExhibitionlist(user_id);
	}
}
