package kr.co.softsoldesk.Service;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.dao.BannerDao;


@Service
public class BannerService {
	
	@Autowired
	private BannerDao bannerDao;
	
	@Value("${path.mainupload}")
	private String path_mainupload;
	
	@Value("${path.detailupload}")
	private String path_detailupload;
	
	@Value("${path.mainbannerupload}")
	private String path_mainbannerupload;
	
	@Value("${path.subbannerupload}")
	private String path_subbannerupload;
	
	@Value("${admin.listcnt}")
	private int admin_listcnt;
	
	@Value("${admin.paginationcnt}")
	private int admin_paginationcnt;
	
	
	private String saveMainBannerUploadFile(MultipartFile upload_file) {	// 메인 배너 업로드 경로
		
		String file_name = System.currentTimeMillis() + "_" + FilenameUtils.getBaseName(upload_file.getOriginalFilename()) 
						   + "." + FilenameUtils.getExtension(upload_file.getOriginalFilename());
		
		
		// 파일 저장 위치에 저장하기 
		try {
			upload_file.transferTo(new File(path_mainbannerupload+"/"+file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	private String saveSubBannerUploadFile(MultipartFile upload_file) {	// 서브 배너 업로드 경로
		
		String file_name = System.currentTimeMillis() + "_" + FilenameUtils.getBaseName(upload_file.getOriginalFilename()) 
						   + "." + FilenameUtils.getExtension(upload_file.getOriginalFilename());
		
		
		// 파일 저장 위치에 저장하기 
		try {
			upload_file.transferTo(new File(path_subbannerupload+"/"+file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	// 메인 배너 신청시 배너 파일 저장
	public void addfiletableBannerBannerApplyFormBean(BannerApplyFormBean bannerApplyFormBean) {
		MultipartFile main_banner_upload_file  = bannerApplyFormBean.getBanner_file();
			
		if(main_banner_upload_file.getSize()>0) {
			String main_banner_file_name = saveMainBannerUploadFile(main_banner_upload_file);
			
			// file_table name, path set
			bannerApplyFormBean.setName(main_banner_file_name);
			bannerApplyFormBean.setPath("/Spring_Project_Dream/img/main_banner/");
				
			// file_table 에 저장
			bannerDao.addfiletableBanner1(bannerApplyFormBean);
				
			// 저장된 파일 file_id bannerApplyFormBean에 set 해줌
			bannerApplyFormBean.setBanner_file_id(bannerDao.getFileId(main_banner_file_name));
		}
	}
	
	// 서브 배너 신청시 배너 파일 저장
		public void addfiletableBannerSubBannerApplyFormBean(BannerApplyFormBean bannerApplyFormBean) {
			MultipartFile main_banner_upload_file  = bannerApplyFormBean.getBanner_file();
				
			if(main_banner_upload_file.getSize()>0) {
				String main_banner_file_name = saveSubBannerUploadFile(main_banner_upload_file);
				
				// file_table name, path set
				bannerApplyFormBean.setName(main_banner_file_name);
				bannerApplyFormBean.setPath("/Spring_Project_Dream/img/sub_banner/");
					
				// file_table 에 저장
				bannerDao.addfiletableBanner1(bannerApplyFormBean);
					
				// 저장된 파일 file_id bannerApplyFormBean에 set 해줌
				bannerApplyFormBean.setBanner_file_id(bannerDao.getFileId(main_banner_file_name));
			}
		}
	
	// 배너 신청시 파일테이블에 파일 저장
	public void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean) {
		bannerDao.addfiletableBanner1(bannerApplyFormBean);
	}
		
		
	public void insertbanner_apply(BannerApplyFormBean bannerApplyFormBean)
	{
		bannerDao.insertbanner_apply(bannerApplyFormBean);
	}
	// 배너 신청 페이지 신청인이 신청한 전시회 목록 가져가기 (select용)
	public List<ExhibitionBean> getApply_personExhibitionlist(int user_id) {
		return bannerDao.getApply_personExhibitionlist(user_id);
	}
}
