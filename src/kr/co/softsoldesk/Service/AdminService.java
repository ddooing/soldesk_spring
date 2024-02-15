package kr.co.softsoldesk.Service;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.PageBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.SubBannerBean;
import kr.co.softsoldesk.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
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
	
	// ============================파일 처리 =====================================
	
	private String saveMainPosterUploadFile(MultipartFile upload_file) {	// 메인 포스터 업로드 경로
		
		String file_name = System.currentTimeMillis() + "_" + FilenameUtils.getBaseName(upload_file.getOriginalFilename()) 
						   + "." + FilenameUtils.getExtension(upload_file.getOriginalFilename());
		
		
		// 파일 저장 위치에 저장하기 
		try {
			upload_file.transferTo(new File(path_mainupload+"/"+file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}	
	
	
	private String saveDetailPosterUploadFile(MultipartFile upload_file) {	// 상세 포스터 업로드 경로
			
			String file_name = System.currentTimeMillis() + "_" + FilenameUtils.getBaseName(upload_file.getOriginalFilename()) 
							   + "." + FilenameUtils.getExtension(upload_file.getOriginalFilename());
			
			
			// 파일 저장 위치에 저장하기 
			try {
				upload_file.transferTo(new File(path_detailupload+"/"+file_name));
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
	
	// ===================================QnA===================================
	
	// 관리자 페이지 QnA 모든 info 가져오기
	public List<QnABean> getAllQnAInfo(int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAllQnAInfo(rowBounds);
	}
	
	// 관리자 페이지 QnA 한개 정보 가져오기
	public QnABean getOneQnAInfo(int qna_id) {
		return adminDao.getOneQnAInfo(qna_id);
	}
	
	// 관리자 페이지 QnA 모든 개수 가져오기
	public QnABean getQnACount() {
		return adminDao.getQnACount();
	}
	
	// 관리자 페이지 QnA 답변 달기 메소드
	public void updateQnAReply(QnABean qnaBean) {
		adminDao.updateQnAReply(qnaBean);
	}
	
	// QnA 삭제처리(state 값 3으로 변경)
	public void deleteQnA(int qna_id) {
		adminDao.deleteQnA(qna_id);
	}
	
	// QnA 복구 처리 (state 값 1로 변경)
	public void recoveryQnA(int state, int qna_id) {
		adminDao.recoveryQnA(state, qna_id);
	}
	
	// QnA 닉네임 검색 메소드
	public List<QnABean> getnicknameSearchQnAInfo(String search, int page) {
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getnicknameSearchQnAInfo(search, rowBounds);
	}
	
	// QnA 닉네임 검색 페이지 처리 총개수 반환
	public PageBean getnicknameSearchQnACnt(String search, int currentPage) {
		
		int nickname_Cnt = adminDao.getnicknameSearchQnACnt(search);
		PageBean pageBean = new PageBean(nickname_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}

	// QnA 제목 검색 메소드
	public List<QnABean> gettitleSearchQnAInfo(String search, int page) {
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.gettitleSearchQnAInfo(search, rowBounds);
	}	
	
	// QnA 제목 검색 페이지 처리 총개수 반환
	public PageBean gettitleSearchQnACnt(String search, int currentPage) {
		
		int title_Cnt = adminDao.gettitleSearchQnACnt(search);
		PageBean pageBean = new PageBean(title_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// QnA 제목 검색 개수 반환 메소드
	public QnABean gettitleSearchQnACount(String search) {
		return adminDao.gettitleSearchQnACount(search);
	}
	
	// QnA 닉네임 검색 개수 반환 메소드
	public QnABean getnicknameSearchQnACount(String search) {
		return adminDao.getnicknameSearchQnACount(search);
	}
	
	// QnA 선택 삭제 메소드
	public void deleteSelectedQnA(List<Integer> qnaIds) {
		for (Integer qnaId : qnaIds) {
			adminDao.deleteSelectedQnA(qnaId);
	    }
	}
	
	// QnA 페이징 처리를 위한 메소드
	public PageBean getTotalQnACnt(int currentPage) {
		
		int qna_Cnt = adminDao.getTotalQnACnt();
		PageBean pageBean = new PageBean(qna_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		
		return pageBean;
	}
	
	
	//=================================== 전시회 관리 ===========================
	
	// 전시회 관리 첫페이지 찍혀오는 값 가져오기
	public List<ExhibitionBean> getAdminexhibitionmange(int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAdminexhibitionmange(rowBounds);
	}
	
	// 전시회 관리 전시총개수, 전시예정, 진행중, 종료 전시 개수 반환
	public ExhibitionBean getExhibitionCount() {
		return adminDao.getExhibitionCount();
	}
	
	// 전시회 관리 페이징 처리
	public PageBean getExhibitionCnt(int currentPage) {
		int exhibition_Cnt = adminDao.getExhibitionCnt();
		PageBean pageBean = new PageBean(exhibition_Cnt, currentPage, admin_listcnt, admin_paginationcnt);

		return pageBean;
	}
	
	// 전시회 관리 작가 검색
	public List<ExhibitionBean> getauthorSearchExhibitionInfo(String search) {
		return adminDao.getauthorSearchExhibitionInfo(search);
	}
	
	// 전시회 관리 작가 검색 총 전시 개수, 종료예정, 전시예정, 진행중 개수 반환
	public ExhibitionBean getauthorSearchExhibitionCount(String search) {
		return adminDao.getauthorSearchExhibitionCount(search);
	}
	
	// 전시회 관리 작가 검색시 페이징 처리 위한 검색 총 개수 반환
	public PageBean getauthorSearchExhibitionCnt(String search, int currentPage) {
		
		int searchautor_Cnt = adminDao.getauthorSearchExhibitionCnt(search);
		PageBean pageBean = new PageBean(searchautor_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 전시회 관리 제목 검색
	public List<ExhibitionBean> gettitleSearchExhibitionInfo(String search, int page) {
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.gettitleSearchExhibitionInfo(search, rowBounds);
	}
	
	// 전시회 관리 제목 검색 총 전시 개수, 종료예정, 전시예정, 진행중 개수 반환
	public ExhibitionBean gettitleSearchExhibitionCount(String search) {
		return adminDao.gettitleSearchExhibitionCount(search);
	}
	
	// 전시회 관리 제목 검색시 페이징 처리 위한 검색 총 개수 반환
	public PageBean gettitleSearchExhibitionCnt(String search, int currentPage) {
		
		int searchtitle_Cnt = adminDao.gettitleSearchExhibitionCnt(search);
		PageBean pageBean = new PageBean(searchtitle_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}		
	
	// 전시회 관리 전시회 수정 페이지 들어가기
	public ExhibitionDetailBean getAllDetailExhibitionBean(int exhibition_id) {
		
		ExhibitionDetailBean b1 = adminDao.getAllDetailExhibitionBean(exhibition_id);
		
		// open 컬럼 open_time ~ close_time 으로 나눔
		if (b1.getOpen() != null && !b1.getOpen().isEmpty()) {
	        String[] times = b1.getOpen().split(" - ");
	        if (times.length == 2) {
	            String open_time = times[0]; // "09:00"
	            String close_time = times[1]; // "18:00"
	            
	            b1.setOpen_time(open_time);
	            b1.setClose_time(close_time);
	        }
	    }
		
		return b1;
	}
	
	// 전시회 수정 업데이트문 1 (file table)
	public void UpdateExhibitionInfo1(String name, int file_id) {
		adminDao.UpdateExhibitionInfo1(name, file_id);
	}
	
	// 전시회 수정 업데이트문 2 (exhibition table)
	public void UpdateExhibitionInfo2(ExhibitionDetailBean exhibitiondetailBean) {
		
	MultipartFile main_poster_upload_file = exhibitiondetailBean.getMain_poster_file();
	MultipartFile detail_poster_upload_file  = exhibitiondetailBean.getDetail_poster_file();
			
			if(main_poster_upload_file.getSize()>0) {
				String main_poster_file_name = saveMainPosterUploadFile(main_poster_upload_file);
				
				System.out.println("메인포스터 이름 : " + main_poster_file_name);
				exhibitiondetailBean.setMain_poster_name(main_poster_file_name);
				
				// file_table 메인포스터 이름 저장
				adminDao.UpdateExhibitionInfo1(main_poster_file_name, exhibitiondetailBean.getMain_poster_file_id());
			}
			
			if(detail_poster_upload_file.getSize()>0) {
				String detail_poster_file_name = saveDetailPosterUploadFile(detail_poster_upload_file);
				
				System.out.println("상세포스터 이름 : " + detail_poster_file_name);
				exhibitiondetailBean.setDetail_poster_name(detail_poster_file_name);
				
				// file_table 상세포스터 이름 저장
				adminDao.UpdateExhibitionInfo1(detail_poster_file_name, exhibitiondetailBean.getDetail_poster_file_id());
			}
		
		adminDao.UpdateExhibitionInfo2(exhibitiondetailBean);
	}
	
	// 전시회 추가 파일테이블 1 (file_table)
	public void addfiletableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
		
		MultipartFile main_poster_upload_file = exhibitionDetailBean.getMain_poster_file();
		MultipartFile detail_poster_upload_file  = exhibitionDetailBean.getDetail_poster_file();
				
				if(main_poster_upload_file.getSize()>0) {
					String main_poster_file_name = saveMainPosterUploadFile(main_poster_upload_file);
					
					// exhibition테이블 name 컬럼 set
					exhibitionDetailBean.setMain_poster_name(main_poster_file_name);
					
					// file_table테이블 name, path 컬럼 set
					exhibitionDetailBean.setName(main_poster_file_name);
					exhibitionDetailBean.setPath("/Spring_Project_Dream/img/main_poster/");
					
					// file_table 메인포스터 이름 저장
					adminDao.addfiletableExhibition(exhibitionDetailBean);
					
					// 저장된 파일 file_id exhibitionDetailBean에 set 해줌
					exhibitionDetailBean.setMain_poster_file_id(adminDao.getFileId(main_poster_file_name));
				}
				
				if(detail_poster_upload_file.getSize()>0) {
					String detail_poster_file_name = saveDetailPosterUploadFile(detail_poster_upload_file);
					
					// exhibition테이블 name 컬럼 set
					exhibitionDetailBean.setDetail_poster_name(detail_poster_file_name);
					
					// file_table 메인포스터 이름 저장
					exhibitionDetailBean.setName(detail_poster_file_name);
					exhibitionDetailBean.setPath("/Spring_Project_Dream/img/detail_poster/");
					
					// file_table 상세포스터 이름 저장
					adminDao.addfiletableExhibition(exhibitionDetailBean);
					
					// 저장된 파일 file_id exhibitionDetailBean에 set 해줌
					exhibitionDetailBean.setDetail_poster_file_id(adminDao.getFileId(detail_poster_file_name));
				}
	}
	
	// 전시회 등록신청에서 전시회 등록 할 경우 파일 1개만 바꿀 경우를 생각해 파일 나눔 (메인포스터 파일)
	public void addmainfiletableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
			
			MultipartFile main_poster_upload_file = exhibitionDetailBean.getMain_poster_file();
					
					if(main_poster_upload_file.getSize()>0) {
						String main_poster_file_name = saveMainPosterUploadFile(main_poster_upload_file);
						
						// exhibition테이블 name 컬럼 set
						exhibitionDetailBean.setMain_poster_name(main_poster_file_name);
						
						// file_table테이블 name, path 컬럼 set
						exhibitionDetailBean.setName(main_poster_file_name);
						exhibitionDetailBean.setPath("/Spring_Project_Dream/img/main_poster/");
						
						// file_table 메인포스터 이름 저장
						adminDao.addfiletableExhibition(exhibitionDetailBean);
						
						// 저장된 파일 file_id exhibitionDetailBean에 set 해줌
						exhibitionDetailBean.setMain_poster_file_id(adminDao.getFileId(main_poster_file_name));
					}
		}
	
	// 전시회 등록신청에서 전시회 등록 할 경우 파일 1개만 바꿀 경우를 생각해 파일 나눔 (상세포스터 파일)
	public void adddetailfiletableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
			
			MultipartFile detail_poster_upload_file  = exhibitionDetailBean.getDetail_poster_file();
					
					if(detail_poster_upload_file.getSize()>0) {
						String detail_poster_file_name = saveDetailPosterUploadFile(detail_poster_upload_file);
						
						// exhibition테이블 name 컬럼 set
						exhibitionDetailBean.setDetail_poster_name(detail_poster_file_name);
						
						// file_table 메인포스터 이름 저장
						exhibitionDetailBean.setName(detail_poster_file_name);
						exhibitionDetailBean.setPath("/Spring_Project_Dream/img/detail_poster/");
						
						// file_table 상세포스터 이름 저장
						adminDao.addfiletableExhibition(exhibitionDetailBean);
						
						// 저장된 파일 file_id exhibitionDetailBean에 set 해줌
						exhibitionDetailBean.setDetail_poster_file_id(adminDao.getFileId(detail_poster_file_name));
					}
		}
	
	// 전시회 추가 전시회 테이블에 저장
	public void addexhibitiontableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
		
		// 전시회 휴무일이 없을경우
		if(exhibitionDetailBean.getHoliday() == null) {
			exhibitionDetailBean.setHoliday("없음");
		}
		
		// open 컬럼 변경
		String open = (exhibitionDetailBean.getOpen_time()+ " - " + exhibitionDetailBean.getClose_time());
		exhibitionDetailBean.setOpen(open);
		
		adminDao.addexhibitiontableExhibition(exhibitionDetailBean);
	}
	
	// =========================== 전시회 등록 신청 ========================
	// 전시회 등록신청 관리자 페이지 리스트
	public List<ExhibitionDetailBean> getAllExhibitionEnroll(int page) {
		//페이징 처리
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAllExhibitionEnroll(rowBounds);
	}
	
	// 전시회 등록신청 관리자 페이지 페이징 처리
	public PageBean getEnrollExhibitionCnt(int currentPage) {
		
		int Enroll_Cnt = adminDao.getEnrollExhibitionCnt();
		PageBean pageBean = new PageBean(Enroll_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 전시회 등록신청 한개 모든 정보 가져오기
	public ExhibitionDetailBean getOneEnrollExhitiion(int exhibition_enroll_id) {
		
		// open 시간 open_time, close_time으로 나눔
		ExhibitionDetailBean b1 = adminDao.getOneEnrollExhitiion(exhibition_enroll_id);
		
		if (b1.getOpen() != null && !b1.getOpen().isEmpty()) {
	        String[] times = b1.getOpen().split(" - ");
	        if (times.length == 2) {
	            String open_time = times[0]; 
	            String close_time = times[1]; 
	            
	            b1.setOpen_time(open_time);
	            b1.setClose_time(close_time);
	        }
	    }
		
		return b1;
	}
	
	// 전시회 등록 신청 -> 전시회 등록 할때
	public void addEnrollexhibitiontableExhibition(ExhibitionDetailBean exhibitionDetailBean) {
		
		// 전시회 휴무일이 없을경우
		if(exhibitionDetailBean.getHoliday() == null) {
			exhibitionDetailBean.setHoliday("없음");
		}
				
		// open 컬럼 변경
		String open = (exhibitionDetailBean.getOpen_time()+ " - " + exhibitionDetailBean.getClose_time());
		exhibitionDetailBean.setOpen(open);
		
		adminDao.addEnrollexhibitiontableExhibition(exhibitionDetailBean);
	}
	
	// 전시회 등록 신청 완료 후 상태값 변경
	public void UpdateExhibitionEnrollState(int enroll_state, int exhibition_enroll_id) {
		
		adminDao.UpdateExhibitionEnrollState(enroll_state, exhibition_enroll_id);
	}
	
	// 전시회 등록 신청 관리자 페이지 뱃지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionbadgeCnt() {
		return adminDao.getEnrollExhibitionbadgeCnt();
	}
	
	// 전시회 등록 신청 제목 검색
	public List<ExhibitionDetailBean> getEnrollExhibitionSearchTitle(String search, int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getEnrollExhibitionSearchTitle(search, rowBounds);
	}
	
	// 전시회 등록 신청 제목 검색 배지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionSearchTitleBadgeCnt(String search) {
		return adminDao.getEnrollExhibitionSearchTitleBadgeCnt(search);
	}
	
	// 전시회 등록 신청 제목 검색 페이징 처리를 위한 총개수 반환
	public PageBean getEnrollExhibitionSearchTitletotalCnt(String search, int currentPage) {
		
		int titlesearch_Cnt = adminDao.getEnrollExhibitionSearchTitletotalCnt(search);
		PageBean pageBean = new PageBean(titlesearch_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 전시회 등록 신청 신청인 검색
	public List<ExhibitionDetailBean> getEnrollExhibitionSearchapply_person(String search, int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getEnrollExhibitionSearchapply_person(search, rowBounds);
	}
	
	// 전시회 등록 신청 신청인 검색 중 배지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionSearchapply_personBadgeCnt(String search) {
		return adminDao.getEnrollExhibitionSearchapply_personBadgeCnt(search);
	}
	
	// 전시회 등록 신청 신청인 검색 페이징 처리를 위한 총개수 반환
	public PageBean getEnrollExhibitionSearchapply_persontotalCnt(String search, int currentPage) {

		int apply_personsearch_Cnt = adminDao.getEnrollExhibitionSearchapply_persontotalCnt(search);
		PageBean pageBean = new PageBean(apply_personsearch_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 전시회 등록 신청 작가 검색
	public List<ExhibitionDetailBean> getEnrollExhibitionSearchauthor(String search, int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getEnrollExhibitionSearchauthor(search, rowBounds);
	}
	
	// 전시회 등록 신청 작가 검색 중 배지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionSearchauthorBadgeCnt(String search) {
		return adminDao.getEnrollExhibitionSearchauthorBadgeCnt(search);
	}
	
	// 전시회 등록 신청 작가 검색 페이징 처리를 위한 총개수 반환
	public PageBean getEnrollExhibitionSearchauthortotalCnt(String search, int currentPage) {
		
		int authorsearch_Cnt = adminDao.getEnrollExhibitionSearchauthortotalCnt(search);
		PageBean pageBean = new PageBean(authorsearch_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 전시회 등록 신청 상태 검색
	public List<ExhibitionDetailBean> getEnrollExhibitionSearchstate(int search, int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getEnrollExhibitionSearchstate(search, rowBounds);
	}
	
	// 전시회 등록 신청 상태 검색 중 배지 개수 반환
	public ExhibitionDetailBean getEnrollExhibitionSearchstateBadgeCnt(int search) {
		return adminDao.getEnrollExhibitionSearchstateBadgeCnt(search);
	}
	
	// 전시회 등록 신청 상태 검색 페이징 처리를 위한 총개수 반환
	public PageBean getEnrollExhibitionSearchstatetotalCnt(int search, int currentPage) {
		
		int statesearch_Cnt = adminDao.getEnrollExhibitionSearchstatetotalCnt(search);
		PageBean pageBean = new PageBean(statesearch_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// =========================== 관리자페이지 배너 관리 ==========================
	// 모든 배너 가져가기 state 1
	public List<MainBannerBean> getAllShowMainbannerInfo() {
		return adminDao.getAllShowMainbannerInfo();
	}
	
	// 모든 배너 가져가기 state 2
	public List<MainBannerBean> getAllHideMainbannerInfo() {
		return adminDao.getAllHideMainbannerInfo();
	}
	
	// 배너 관리 페이지 배지 관련
	public MainBannerBean getMainBannerBadgeCnt() {
		return adminDao.getMainBannerBadgeCnt();
	}
	
	// 배너 관리 페이지 제목 검색 리스트
	public List<MainBannerBean> titleSearchMainbannerInfo(String search) {
		return adminDao.titleSearchMainbannerInfo(search);
	}
	
	// 배너 관리 페이지 제목 검색 뱃지 관련
	public MainBannerBean getTitleSearchMainBannerBadgeCnt(String search) {
		return adminDao.getTitleSearchMainBannerBadgeCnt(search);
	}
	
	// 배너 순서 업데이트
	public void updateExposeOrder(String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            int bannerId = Integer.parseInt(ids[i]);
            adminDao.updateExposeOrder(bannerId, i + 1);
        }
    }
	
	// Index 페이지 메인 배너 가져가기
	public List<MainBannerBean> IndexMainBannerBeanList() {
		return adminDao.IndexMainBannerBeanList();
	}
	
	// 메인 배너 삭제
	public void DeleteMainBanner(int main_banner_id) {
		adminDao.DeleteMainBanner(main_banner_id);
	}
	
	// 메인 배너 삭제 시 삭제한 배너보다 노출 순서 높은거 1개씩 줄이기
	public void UpdateDeleteAndExpose_order(int expose_order) {
		adminDao.UpdateDeleteAndExpose_order(expose_order);
	}
	
	// 메인 배너 한개 모든 정보 가져가기
	public MainBannerBean getOneMainBannerInfo(int main_banner_id) {
		return adminDao.getOneMainBannerInfo(main_banner_id);
	}
	
	// 메인 배너 수정시 파일 변경시 filetable에 추가
	public void addfiletableBanner(MainBannerBean mainBannerBean) {
		MultipartFile main_banner_upload_file  = mainBannerBean.getMain_banner_file();
		
		if(main_banner_upload_file.getSize()>0) {
			String main_banner_file_name = saveMainBannerUploadFile(main_banner_upload_file);
			
			// file_table 메인포스터 이름 저장
			mainBannerBean.setName(main_banner_file_name);
			mainBannerBean.setPath("/Spring_Project_Dream/img/main_banner/");
			
			// file_table 상세포스터 이름 저장
			adminDao.addfiletableBanner(mainBannerBean);
			
			// 저장된 파일 file_id exhibitionDetailBean에 set 해줌
			mainBannerBean.setBanner_file_id(adminDao.getFileId(main_banner_file_name));
		}
	}

	// 메인 배너 수정
	public void UpdateMainBanner(MainBannerBean mainBannerBean) {
		adminDao.UpdateMainBanner(mainBannerBean);
	}
	
	// 메인 배너 수정 시 state 값 변경 확인 메소드
	public int getMainBannerState(int main_banner_id) {
		return adminDao.getMainBannerState(main_banner_id);
	}
	
	// 메인 배너 수정 시 expose_order 최대 값 반환
	public int getMaxExposeOrder() {
		return adminDao.getMaxExposeOrder();
	}
	
	// 메인 배너 수정 시 expose_order 값 1씩 내림
	public void UpdateExpose_order(int expose_order) {
		adminDao.UpdateExpose_order(expose_order);
	}
	
	// 메인 배너 관리자 직접 추가
	public void AddmanagerMainBanner(MainBannerBean mainBannerBean) {
		adminDao.AddmanagerMainBanner(mainBannerBean);
	}
	
	// 배너 신청 페이지 신청인이 신청한 전시회 목록 가져가기 (select용)
	public List<ExhibitionBean> getApply_personExhibitionlist(int user_id) {
		return adminDao.getApply_personExhibitionlist(user_id);
	}
	
	// 배너 신청 테이블에 insert
	public void insertbanner_apply_form(BannerApplyFormBean bannerApplyFormBean) {
		adminDao.insertbanner_apply_form(bannerApplyFormBean);
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
			adminDao.addfiletableBanner1(bannerApplyFormBean);
				
			// 저장된 파일 file_id bannerApplyFormBean에 set 해줌
			bannerApplyFormBean.setBanner_file_id(adminDao.getFileId(main_banner_file_name));
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
				adminDao.addfiletableBanner1(bannerApplyFormBean);
					
				// 저장된 파일 file_id bannerApplyFormBean에 set 해줌
				bannerApplyFormBean.setBanner_file_id(adminDao.getFileId(main_banner_file_name));
			}
		}
	
	// 배너 신청시 파일테이블에 파일 저장
	public void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean) {
		adminDao.addfiletableBanner1(bannerApplyFormBean);
	}
	
	// 서브 배너 관리자 페이지 showlist 페이지
	public List<SubBannerBean> getAllShowSubbannerInfo() {
		return adminDao.getAllShowSubbannerInfo();
	}
	
	// 서브 배너 뱃지 관련
	public SubBannerBean getSubBannerBadgeCnt() {
		return adminDao.getSubBannerBadgeCnt();
	}
	
	// 서브 배너 제목 검색 리스트
	public List<SubBannerBean> titleSearchSubbannerInfo(String search) {
		return adminDao.titleSearchSubbannerInfo(search);
	}
	
	// 서브 배너 제목 검색 뱃지 관련
	public SubBannerBean getTitleSearchSubBannerBadgeCnt(String search) {
		return adminDao.getTitleSearchSubBannerBadgeCnt(search);
	}
	
	// 서브 배너 hide(숨김 state=2) 리스트
	public List<SubBannerBean> getAllHideSubbannerInfo() {
		return adminDao.getAllHideSubbannerInfo();
	}
	
	// 서브 배너 삭제
	public void DeleteSubBanner(int sub_banner_id) {
		adminDao.DeleteSubBanner(sub_banner_id);
	}
	
	// 서브 배너 삭제 시 삭제한 배너의 expose_order보다 큰거 expose_order 한개씩 내리기
	public void UpdateDeleteAndExpose_orderSub(int expose_order) {
		adminDao.UpdateDeleteAndExpose_orderSub(expose_order);
	}
	
	// 서브 배너 수정 페이지 들어가기 위한 모든 정보 가져가기
	public SubBannerBean getOneSubBannerInfo(int sub_banner_id) {
		return adminDao.getOneSubBannerInfo(sub_banner_id);
	}
	
	// 서브 배너 수정시 state 값 변경 확인 메소드'
	public int getSubBannerState(int sub_banner_id) {
		return adminDao.getSubBannerState(sub_banner_id);
	}
	
	// 서브 배너 업데이트 시 파일 변경할 경우 파일 테이블에 파일 저장
	public void addfiletableBanner2(SubBannerBean subBannerBean) {
		MultipartFile sub_banner_upload_file  = subBannerBean.getSub_banner_file();
		
		if(sub_banner_upload_file.getSize()>0) {
			String sub_banner_file_name = saveSubBannerUploadFile(sub_banner_upload_file);
			
			// file_table name, path set
			subBannerBean.setName(sub_banner_file_name);
			subBannerBean.setPath("/Spring_Project_Dream/img/sub_banner/");
			
			// file_table 저정
			adminDao.addfiletableBanner2(subBannerBean);
			
			// 저장된 파일 file_id exhibitionDetailBean에 set 해줌
			subBannerBean.setBanner_file_id(adminDao.getFileId(sub_banner_file_name));
		}
	}
	
	// 서브 배너 order_expose max 값 반환
	public int getSubMaxExposeOrder() {
		return adminDao.getSubMaxExposeOrder();
	}
	
	// 서브 배너 업데이트 시 expose_order 값 재정렬
	public void UpdateSubBannerExpose_order(int expose_order) {
		adminDao.UpdateSubBannerExpose_order(expose_order);
	}
	
	// 서브 배너 업데이트
	public void UpdateSubBanner(SubBannerBean subBannerBean) {
		adminDao.UpdateSubBanner(subBannerBean);
	}
	
	// 서브 배너 관리자 직접 추가
	public void AddmanagerSubBanner(SubBannerBean subBannerBean) {
		adminDao.AddmanagerSubBanner(subBannerBean);
	}
	
	// 서브 배너 expose_order 순서 변경 (드래그앤 드롭)
	public void updateSubExposeOrder(String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            int bannerId = Integer.parseInt(ids[i]);
            adminDao.updateSubExposeOrder(bannerId, i + 1);
        }
	}
	
	// index 서브 배너 정보 가져가기
	public List<SubBannerBean> IndexSubBannerBeanList() {
		return adminDao.IndexSubBannerBeanList();
	}
	
	// 관리자 페이지 메인 배너 신청 내역 가져오기
	public List<BannerApplyFormBean> getAllApplyMainbanner(int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAllApplyMainbanner(rowBounds);
	}
	
	// 관리자 페이지 메인 배너 신청 내역 페이징 처리를 위한 총 개수 반환
	public PageBean getAllApplyMainbannerCnt(int currentPage) {
		
		int mainbannerapply_Cnt = adminDao.getAllApplyMainbannerCnt();
		PageBean pageBean = new PageBean(mainbannerapply_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
		
	// 관리자 페이지 서브 배너 신청 내역 가져오기
	public List<BannerApplyFormBean> getAllApplySubbanner(int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getAllApplySubbanner(rowBounds);
	}
	
	// 관리자 페이지 서브 배너 신청 내역 페이징 처리를 위한 총 개수 반환
	public PageBean getAllApplySubbannerCnt(int currentPage) {
		
		int subbannerapply_Cnt = adminDao.getAllApplySubbannerCnt();
		PageBean pageBean = new PageBean(subbannerapply_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 관리자 페이지 메인 배너 신청 내역 뱃지 관련
	public BannerApplyFormBean getMainBannerBadge() {
		return adminDao.getMainBannerBadge();
	}

	// 관리자 페이지 서브 배너 신청 내역 뱃지 관련
	public BannerApplyFormBean getSubBannerBadge() {
		return adminDao.getSubBannerBadge();
	}		
	
	// 관리자 페이지 메인 배너 신청 내역 전시회 제목 검색
	public List<BannerApplyFormBean> getMainBannerapplytitleSearch(String search, int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getMainBannerapplytitleSearch(search, rowBounds);
	}
	
	// 관리자 페이지 메인 배너 신청 내역 전시회 제목 검색 페이징 처리를 위한 개수 반환
	public PageBean getMainBannerapplytitleSearchCnt(String search, int currentPage) {
		
		int maintitlesearch_Cnt = adminDao.getMainBannerapplytitleSearchCnt(search);
		PageBean pageBean = new PageBean(maintitlesearch_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}
	
	// 관리자 페이지 메인 배너 전시회 제목 검색 뱃지 관련
	public BannerApplyFormBean getMainBannerapplytitlesearchBadge(String search) {
		return adminDao.getMainBannerapplytitlesearchBadge(search);
	}
	
	// 관리자 페이지 서브 배너 신청 내역 전시회 제목 검색
	public List<BannerApplyFormBean> getSubBannerapplytitleSearch(String search, int page) {
		
		int start = (page - 1) * admin_listcnt;
		RowBounds rowBounds = new RowBounds(start, admin_listcnt);
		
		return adminDao.getSubBannerapplytitleSearch(search, rowBounds);
	}
	
	// 관리자 페이지 서브 배너 신청 내역 전시회 제목 검색 페이징 처리를 위한 개수 반환
	public PageBean getSubBannerapplytitleSearchCnt(String search, int currentPage) {
		
		int subtitlesearch_Cnt = adminDao.getSubBannerapplytitleSearchCnt(search);
		PageBean pageBean = new PageBean(subtitlesearch_Cnt, currentPage, admin_listcnt, admin_paginationcnt);
		
		return pageBean;
	}		
		
	// 관리자 페이지 서브 배너 전시회 제목 검색 뱃지 관련
	public BannerApplyFormBean getSubBannerapplytitlesearchBadge(String search) {
		return adminDao.getSubBannerapplytitlesearchBadge(search);
	}	
	
	// 관리자 페이지 배너 취소 상태로 변경 state -> 3으로 변경
	public void UpdateApplyBannerCancle(int banner_apply_form_id) {
		adminDao.UpdateApplyBannerCancle(banner_apply_form_id);
	}
	
	// 관리자 페이지 배너 추가/상세 페이지
	public BannerApplyFormBean getBannerapplyDetail(int banner_apply_form_id) {
		return adminDao.getBannerapplyDetail(banner_apply_form_id);
	}
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 (메인배너)
	public void addApplyMainBanner(MainBannerBean mainBannerBean) {
		adminDao.addApplyMainBanner(mainBannerBean);
	}
		
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 (서브배너)
	public void addApplySubBanner(SubBannerBean subBannerBean) {
		adminDao.addApplySubBanner(subBannerBean);
	}	
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 후 banner_apply_form 테이블 상태값 변경(메인, 서브배너 공통)
	public void updatebanner_apply_formState(int banner_apply_form_id) {
		adminDao.updatebanner_apply_formState(banner_apply_form_id);
	}
	
}

