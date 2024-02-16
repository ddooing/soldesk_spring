package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.Beans.BannerApplyFormBean;
import kr.co.softsoldesk.Beans.ExhibitionBean;
import kr.co.softsoldesk.Beans.ExhibitionDetailBean;
import kr.co.softsoldesk.Beans.FAQBean;
import kr.co.softsoldesk.Beans.MainBannerBean;
import kr.co.softsoldesk.Beans.QnABean;
import kr.co.softsoldesk.Beans.SubBannerBean;

public interface AdminMapper {
	
	// ================================== 메인 배너 관리 ==============================
	
	// 메인 배너 관리 페이지
	@Select("SELECT \r\n"
			+ "    mb.main_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as main_banner_name, \r\n"
			+ "    ft.path as main_banner_path\r\n"
			+ "FROM \r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    mb.state = 1\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<MainBannerBean> getAllShowMainbannerInfo();
	
	// 메인 배너 관리 state 2 (숨김)
	@Select("SELECT \r\n"
			+ "    mb.main_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as main_banner_name, \r\n"
			+ "    ft.path as main_banner_path\r\n"
			+ "FROM \r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    mb.state = 2\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<MainBannerBean> getAllHideMainbannerInfo();
	
	// 메인 배너 관리 페이지 배지 관련
	@Select("SELECT\r\n"
			+ "  COUNT(*) AS banner_all_Cnt,\r\n"
			+ "  COUNT(CASE WHEN state = 1 THEN 1 END) AS banner_show_Cnt,\r\n"
			+ "  COUNT(CASE WHEN state = 2 THEN 1 END) AS banner_hide_Cnt\r\n"
			+ "FROM main_banner")
	MainBannerBean getMainBannerBadgeCnt();
	
	// 메인 배너 관리 페이지 제목 검색
	@Select("SELECT \r\n"
			+ "    mb.main_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as main_banner_name, \r\n"
			+ "    ft.path as main_banner_path\r\n"
			+ "FROM \r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.title LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    mb.expose_order asc")
	List<MainBannerBean> titleSearchMainbannerInfo(@Param("search") String search);
	
	// 메인 배너 관리 페이지 제목 검색 뱃지 관련
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS banner_all_Cnt,\r\n"
			+ "    COUNT(CASE WHEN mb.state = 1 THEN 1 END) AS banner_show_Cnt,\r\n"
			+ "    COUNT(CASE WHEN mb.state = 2 THEN 1 END) AS banner_hide_Cnt\r\n"
			+ "FROM \r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.title LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    mb.expose_order asc")
	MainBannerBean getTitleSearchMainBannerBadgeCnt(@Param("search") String search);
	
	// 메인 배너 순서 업데이트
	@Update("UPDATE main_banner SET expose_order = #{exposeOrder} WHERE main_banner_id = #{mainBannerId}")
    void updateExposeOrder(@Param("mainBannerId") int mainBannerId, @Param("exposeOrder") int exposeOrder);
	
	// index 페이지 메인 캐러셀 가져가기
	@Select("SELECT\r\n"
			+ "    mb.main_banner_id,\r\n"
			+ "    mb.exhibition_id,\r\n"
			+ "    mb.expose_order,\r\n"
			+ "    mb.state,\r\n"
			+ "    ft.name AS main_banner_name,\r\n"
			+ "    ft.path AS main_banner_path\r\n"
			+ "FROM\r\n"
			+ "    main_banner mb\r\n"
			+ "INNER JOIN\r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE\r\n"
			+ "    mb.state = 1\r\n"
			+ "    AND SYSDATE BETWEEN mb.start_date AND mb.end_date\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<MainBannerBean> IndexMainBannerBeanList();
	
	// 메인 배너 삭제
	@Delete("DELETE FROM main_banner where main_banner_id = #{main_banner_id}")
	void DeleteMainBanner(int main_banner_id);
	
	// 메인 배너 삭제 시 노출순서가 삭제한 배너보다 높은 노출 순서 1개씩 줄이기
	@Update("UPDATE main_banner SET expose_order = expose_order - 1 WHERE expose_order > #{expose_order}")
	void UpdateDeleteAndExpose_order(@Param("expose_order") int expose_order);
	
	// 메인 배너 관리자 페이지 메인배너 한개 모든 정보 가져가기
	@Select("SELECT\r\n"
			+ "    mb.main_banner_id,\r\n"
			+ "    mb.exhibition_id,\r\n"
			+ "    To_char(mb.start_date, 'yyyy-mm-dd') as start_date,\r\n"
			+ "    To_char(mb.end_date, 'yyyy-mm-dd') as end_date,\r\n"
			+ "    mb.expose_order,\r\n"
			+ "    mb.state,\r\n"
			+ "	   mb.pay_money, \r\n"
			+ "	   mb.banner_file_id, \r\n"
			+ "    To_char(mb.regdate, 'yyyy-mm-dd') as regdate,\r\n"
			+ "    ut.name AS user_name,\r\n"
			+ "    ut.telephone AS telephone,\r\n"
			+ "    e.title AS title,\r\n"
			+ "    ft.name AS main_banner_name,\r\n"
			+ "    ft.path AS main_banner_path\r\n"
			+ "FROM\r\n"
			+ "    main_banner mb\r\n"
			+ "LEFT JOIN\r\n"
			+ "    user_table ut ON mb.apply_person_id = ut.user_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE\r\n"
			+ "    mb.main_banner_id = #{main_banner_id}")
	MainBannerBean getOneMainBannerInfo(int main_banner_id);
	
	// 메인 배너 업데이트시 파일 테이블에 파일 추가
	@Insert("INSERT INTO file_table (file_id, name, path, file_date) values (file_id_seq.nextval, #{name}, #{path}, sysdate)")
	void addfiletableBanner(MainBannerBean mainBannerBean);
	
	// 배너 수정 업데이트
	@Update("UPDATE main_banner SET state=#{state}, start_date=#{start_date}, end_date=#{end_date},expose_order=#{expose_order} ,banner_file_id=#{banner_file_id} where main_banner_id=#{main_banner_id}")
	void UpdateMainBanner(MainBannerBean mainBannerBean);
	
	// 배너 수정 업데이트시 state 값 변경 확인하려고 쓰는 메소드
	@Select("SELECT state from main_banner where main_banner_id = #{main_banner_id}")
	int getMainBannerState(int main_banner_id);
	
	// 배너 수정 업데이트시 state 최대 값 반환 메소드
	@Select("SELECT COALESCE(MAX(expose_order), 0) AS max_expose_order\r\n"
			+ "FROM main_banner\r\n"
			+ "WHERE state = 1")
	int getMaxExposeOrder();
	
	// 배너 수정 업데이트시 expose_order 값 1씩 줄이기
	@Update("UPDATE main_banner SET expose_order = expose_order - 1 WHERE expose_order BETWEEN #{order} + 1 AND (SELECT MAX(expose_order) FROM main_banner)")
	void UpdateExpose_order(@Param("order") int expose_order);
	
	// 메인 배너 관리자 직접 추가
	@Insert("insert into main_banner (exhibition_id, start_date, end_date, expose_order, regdate, state, banner_file_id) values (#{exhibition_id},#{start_date},#{end_date},#{expose_order},sysdate,#{state},#{banner_file_id})")
	void AddmanagerMainBanner(MainBannerBean mainBannerBean);
	
	// 배너 신청 페이지 신청한 apply_person이 신청한 전시회 목록 가져가기
	@Select("SELECT\r\n"
			+ "    e.exhibition_id,\r\n"
			+ "    e.title\r\n"
			+ "FROM\r\n"
			+ "    exhibition e\r\n"
			+ "INNER JOIN\r\n"
			+ "    user_table u ON e.apply_person = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    u.user_id = #{user_id}")
	List<ExhibitionBean> getApply_personExhibitionlist(@Param("user_id") int user_id);
	
	
	// 배너 신청 폼 테이블에 insert
	@Insert("insert into banner_apply_form (apply_person_id, exhibition_id, start_date, end_date, command, approved_At, payment, state, banner_type, banner_file_id) values (#{apply_person_id}, #{exhibition_id}, #{start_date}, #{end_date}, #{command}, sysdate,#{payment} ,#{state}, #{banner_type}, #{banner_file_id})")
	void insertbanner_apply_form(BannerApplyFormBean bannerApplyFormBean);
	
	// 배너 신청 할때 파일테이블에 저장
	@Insert("INSERT INTO file_table (file_id, name, path, file_date) values (file_id_seq.nextval, #{name, jdbcType=VARCHAR}, #{path, jdbcType=VARCHAR}, sysdate)")
	void addfiletableBanner1(BannerApplyFormBean bannerApplyFormBean);
	
	// 서브 배너 관리자 페이지 가져가는것들
	@Select("SELECT \r\n"
			+ "    sb.sub_banner_id, \r\n"
			+ "    sb.exhibition_id, \r\n"
			+ "    TO_CHAR(sb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(sb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    sb.expose_order, \r\n"
			+ "    sb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as sub_banner_name, \r\n"
			+ "    ft.path as sub_banner_path\r\n"
			+ "FROM \r\n"
			+ "    sub_banner sb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON sb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON sb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    sb.state = 1\r\n"
			+ "ORDER BY\r\n"
			+ "    sb.expose_order ASC")
	List<SubBannerBean> getAllShowSubbannerInfo();
	
	// 서브 배너 관리 페이지 배지 관련
	@Select("SELECT\r\n"
			+ "  COUNT(*) AS banner_all_Cnt,\r\n"
			+ "  COUNT(CASE WHEN state = 1 THEN 1 END) AS banner_show_Cnt,\r\n"
			+ "  COUNT(CASE WHEN state = 2 THEN 1 END) AS banner_hide_Cnt\r\n"
			+ "FROM sub_banner")
	SubBannerBean getSubBannerBadgeCnt();		
	
	// 서브 배너 관리 페이지 제목 검색
	@Select("SELECT \r\n"
			+ "    mb.sub_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as sub_banner_name, \r\n"
			+ "    ft.path as sub_banner_path\r\n"
			+ "FROM \r\n"
			+ "    sub_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.title LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    mb.expose_order asc")
	List<SubBannerBean> titleSearchSubbannerInfo(@Param("search") String search);		
	
	// 메인 배너 관리 페이지 제목 검색 뱃지 관련
	@Select("SELECT \r\n"
			+ "    COUNT(*) AS banner_all_Cnt,\r\n"
			+ "    COUNT(CASE WHEN mb.state = 1 THEN 1 END) AS banner_show_Cnt,\r\n"
			+ "    COUNT(CASE WHEN mb.state = 2 THEN 1 END) AS banner_hide_Cnt\r\n"
			+ "FROM \r\n"
			+ "    sub_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    e.title LIKE '%' || #{search} || '%'\r\n"
			+ "ORDER BY \r\n"
			+ "    mb.expose_order asc")
	SubBannerBean getTitleSearchSubBannerBadgeCnt(@Param("search") String search);		
	
	// 서브 배너 관리 state 2 (숨김)
	@Select("SELECT \r\n"
			+ "    mb.sub_banner_id, \r\n"
			+ "    mb.exhibition_id, \r\n"
			+ "    TO_CHAR(mb.start_date, 'yyyy-mm-dd') AS start_date, \r\n"
			+ "    TO_CHAR(mb.end_date, 'yyyy-mm-dd') AS end_date, \r\n"
			+ "    mb.expose_order, \r\n"
			+ "    mb.state, \r\n"
			+ "    e.title, \r\n"
			+ "    ft.name as sub_banner_name, \r\n"
			+ "    ft.path as sub_banner_path\r\n"
			+ "FROM \r\n"
			+ "    sub_banner mb\r\n"
			+ "INNER JOIN \r\n"
			+ "    exhibition e ON mb.exhibition_id = e.exhibition_id\r\n"
			+ "INNER JOIN \r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    mb.state = 2\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<SubBannerBean> getAllHideSubbannerInfo();		
	
	
	// 메인 배너 삭제
	@Delete("DELETE FROM sub_banner where sub_banner_id = #{sub_banner_id}")
	void DeleteSubBanner(int sub_banner_id);	
	
	// 서브 배너 삭제 시 노출순서가 삭제한 배너보다 높은 노출 순서 1개씩 줄이기
	@Update("UPDATE sub_banner SET expose_order = expose_order - 1 WHERE expose_order > #{expose_order}")
	void UpdateDeleteAndExpose_orderSub(@Param("expose_order") int expose_order);		
	
	// 서브 배너 관리자 페이지 서브배너 한개 모든 정보 가져가기
	@Select("SELECT \r\n"
			+ "    sb.sub_banner_id,\r\n"
			+ "    sb.exhibition_id,\r\n"
			+ "    TO_CHAR(sb.start_date, 'yyyy-mm-dd') AS start_date,\r\n"
			+ "    TO_CHAR(sb.end_date, 'yyyy-mm-dd') AS end_date,\r\n"
			+ "    sb.expose_order,\r\n"
			+ "    sb.state,\r\n"
			+ "    sb.pay_money,\r\n"
			+ "    sb.banner_file_id,\r\n"
			+ "    TO_CHAR(sb.regdate, 'yyyy-mm-dd') AS regdate,\r\n"
			+ "    ut.name AS user_name,\r\n"
			+ "    ut.telephone AS telephone,\r\n"
			+ "    e.title AS title,\r\n"
			+ "    ft.name AS sub_banner_name,\r\n"
			+ "    ft.path AS sub_banner_path\r\n"
			+ "FROM \r\n"
			+ "    sub_banner sb\r\n"
			+ "LEFT JOIN \r\n"
			+ "    user_table ut ON sb.apply_person_id = ut.user_id\r\n"
			+ "LEFT JOIN \r\n"
			+ "    exhibition e ON sb.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN \r\n"
			+ "    file_table ft ON sb.banner_file_id = ft.file_id\r\n"
			+ "WHERE \r\n"
			+ "    sb.sub_banner_id = #{sub_banner_id}")
	SubBannerBean getOneSubBannerInfo(int sub_banner_id);		
	
	
	// 서브 배너 수정시 state 값 확인하려고 사용하는 메소드
	@Select("SELECT state from sub_banner where sub_banner_id = #{sub_banner_id}")
	int getSubBannerState(int sub_banner_id);
	
	// 서브 배너 업데이트시 파일 테이블에 파일 추가
	@Insert("INSERT INTO file_table (file_id, name, path, file_date) values (file_id_seq.nextval, #{name}, #{path}, sysdate)")
	void addfiletableBanner2(SubBannerBean subBannerBean);
	
	// 서브 배너 수정시 expose_order 값 max 찾기
	@Select("SELECT COALESCE(MAX(expose_order), 0) AS max_expose_order\r\n"
			+ "FROM sub_banner\r\n"
			+ "WHERE state = 1")
	int getSubMaxExposeOrder();
	
	// 서브 배너 수정 업데이트시 expose_order 값 1씩 줄이기
	@Update("UPDATE sub_banner SET expose_order = expose_order - 1 WHERE expose_order BETWEEN #{order} + 1 AND (SELECT MAX(expose_order) FROM sub_banner)")
	void UpdateSubBannerExpose_order(@Param("order") int expose_order);
	
	// 서브 배너 수정 업데이트
	@Update("UPDATE sub_banner SET state=#{state}, start_date=#{start_date}, end_date=#{end_date},expose_order=#{expose_order} ,banner_file_id=#{banner_file_id} where sub_banner_id=#{sub_banner_id}")
	void UpdateSubBanner(SubBannerBean subBannerBean);
	
	// 서브 배너 관리자 직접 추가
	@Insert("insert into sub_banner (exhibition_id, start_date, end_date, expose_order, regdate, state, banner_file_id) values (#{exhibition_id},#{start_date},#{end_date},#{expose_order},sysdate,#{state},#{banner_file_id})")
	void AddmanagerSubBanner(SubBannerBean subBannerBean);
	
	// 서브 배너 순서 업데이트
	@Update("UPDATE sub_banner SET expose_order = #{exposeOrder} WHERE sub_banner_id = #{subBannerId}")
	void updateSubExposeOrder(@Param("subBannerId") int subBannerId, @Param("exposeOrder") int exposeOrder);
	
	// index 페이지 서브 캐러셀 가져가기
	@Select("SELECT\r\n"
			+ "    mb.sub_banner_id,\r\n"
			+ "    mb.exhibition_id,\r\n"
			+ "    mb.expose_order,\r\n"
			+ "    mb.state,\r\n"
			+ "    ft.name AS sub_banner_name,\r\n"
			+ "    ft.path AS sub_banner_path\r\n"
			+ "FROM\r\n"
			+ "    sub_banner mb\r\n"
			+ "INNER JOIN\r\n"
			+ "    file_table ft ON mb.banner_file_id = ft.file_id\r\n"
			+ "WHERE\r\n"
			+ "    mb.state = 1\r\n"
			+ "    AND SYSDATE BETWEEN mb.start_date AND mb.end_date\r\n"
			+ "ORDER BY\r\n"
			+ "    mb.expose_order ASC")
	List<SubBannerBean> IndexSubBannerBeanList();		
	
	// ================================= 배너 신청 페이지 ==================================
	
	// 관리자 페이지 메인 배너 신청 내역 가져오기
	@Select("SELECT\r\n"
			+ "    baf.banner_apply_form_id,\r\n"
			+ "    baf.exhibition_id,\r\n"
			+ "    TO_CHAR(baf.start_date, 'yyyy-mm-dd') AS start_date,\r\n"
			+ "    TO_CHAR(baf.end_date, 'yyyy-mm-dd') AS end_date,\r\n"
			+ "    TO_CHAR(baf.approved_At , 'yyyy-mm-dd') AS approved_At ,\r\n"
			+ "    baf.payment,\r\n"
			+ "    baf.state,\r\n"
			+ "    baf.banner_type,\r\n"
			+ "    ft.name AS banner_name,\r\n"
			+ "    ft.path AS banner_path,\r\n"
			+ "    e.title AS exhibition_title,\r\n"
			+ "    u.name AS user_name\r\n"
			+ "FROM\r\n"
			+ "    banner_apply_form baf\r\n"
			+ "LEFT JOIN\r\n"
			+ "    file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    baf.banner_type = 1 AND\r\n"
			+ "    baf.pay_state = 1\r\n"
			+ "    AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "ORDER BY\r\n"
			+ "    baf.banner_apply_form_id DESC")
	List<BannerApplyFormBean> getAllApplyMainbanner(RowBounds rowBounds);
	
	//관리자 페이지 메인 배너 신청 내역 페이징 처리 위한 개수 반환
	@Select("SELECT COUNT(*) \r\n"
			+ "FROM banner_apply_form baf\r\n"
			+ "LEFT JOIN file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE baf.banner_type = 1"
			+ "AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "AND baf.pay_state = 1")
	int getAllApplyMainbannerCnt();
	
	// 관리자 페이지 서브 배너 신청 내역 가져오기
	@Select("SELECT\r\n"
			+ "    baf.banner_apply_form_id,\r\n"
			+ "    baf.exhibition_id,\r\n"
			+ "    TO_CHAR(baf.start_date, 'yyyy-mm-dd') AS start_date,\r\n"
			+ "    TO_CHAR(baf.end_date, 'yyyy-mm-dd') AS end_date,\r\n"
			+ "    TO_CHAR(baf.approved_At , 'yyyy-mm-dd') AS approved_At,\r\n"
			+ "    baf.payment,\r\n"
			+ "    baf.state,\r\n"
			+ "    baf.banner_type,\r\n"
			+ "    ft.name AS banner_name,\r\n"
			+ "    ft.path AS banner_path,\r\n"
			+ "    e.title AS exhibition_title,\r\n"
			+ "    u.name AS user_name\r\n"
			+ "FROM\r\n"
			+ "    banner_apply_form baf\r\n"
			+ "LEFT JOIN\r\n"
			+ "    file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    baf.banner_type = 2 AND\r\n"
			+ "    baf.pay_state = 1\r\n"
			+ "    AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "ORDER BY\r\n"
			+ "    baf.banner_apply_form_id DESC")
	List<BannerApplyFormBean> getAllApplySubbanner(RowBounds rowBounds);
	
	//관리자 페이지 메인 배너 신청 내역 페이징 처리 위한 개수 반환
	@Select("SELECT COUNT(*) \r\n"
			+ "FROM banner_apply_form baf\r\n"
			+ "LEFT JOIN file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE baf.banner_type = 2"
			+ "AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "AND baf.pay_state = 1")
	int getAllApplySubbannerCnt();		
	
	// 관리자 페이지 메인 배너 신청 내역 뱃지 관련
	@Select("SELECT COUNT(*) AS total_count, \r\n"
			+ "       COUNT(CASE WHEN state = 1 THEN 1 END) AS state_1_count, \r\n"
			+ "       COUNT(CASE WHEN state = 2 THEN 1 END) AS state_2_count\r\n"
			+ "FROM banner_apply_form\r\n"
			+ "where banner_type = 1"
			+ "AND (state = 1 OR state = 2)\r\n"
			+ "AND pay_state = 1")
	BannerApplyFormBean getMainBannerBadge();
	
	// 관리자 페이지 서브 배너 신청 내역 뱃지 관련
	@Select("SELECT COUNT(*) AS total_count, \r\n"
			+ "       COUNT(CASE WHEN state = 1 THEN 1 END) AS state_1_count, \r\n"
			+ "       COUNT(CASE WHEN state = 2 THEN 1 END) AS state_2_count\r\n"
			+ "FROM banner_apply_form\r\n"
			+ "where banner_type = 2"
			+ "AND (state = 1 OR state = 2)\r\n"
			+ "AND pay_state = 1")
	BannerApplyFormBean getSubBannerBadge();
	
	// 관리자 페이지 메인 배너 전시회 제목 검색 리스트
	@Select("SELECT\r\n"
			+ "    baf.banner_apply_form_id,\r\n"
			+ "    baf.exhibition_id,\r\n"
			+ "    TO_CHAR(baf.start_date, 'yyyy-mm-dd') AS start_date,\r\n"
			+ "    TO_CHAR(baf.end_date, 'yyyy-mm-dd') AS end_date,\r\n"
			+ "    TO_CHAR(baf.approved_At , 'yyyy-mm-dd') AS approved_At ,\r\n"
			+ "    baf.payment,\r\n"
			+ "    baf.state,\r\n"
			+ "    baf.banner_type,\r\n"
			+ "    ft.name AS banner_name,\r\n"
			+ "    ft.path AS banner_path,\r\n"
			+ "    e.title AS exhibition_title,\r\n"
			+ "    u.name AS user_name\r\n"
			+ "FROM\r\n"
			+ "    banner_apply_form baf\r\n"
			+ "LEFT JOIN\r\n"
			+ "    file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    baf.banner_type = 1\r\n"
			+ "    AND UPPER(e.title) LIKE UPPER('%' || #{search} || '%')\r\n"
			+ "    AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "    AND baf.pay_state = 1\r\n"
			+ "ORDER BY\r\n"
			+ "    baf.banner_apply_form_id DESC")
	List<BannerApplyFormBean> getMainBannerapplytitleSearch(String search, RowBounds rowBounds);
	
	// 관리자 페이지 메인 배너 전시회 제목 검색 페이징 처리를 위한 개수 반환
	@Select("SELECT COUNT(*) \r\n"
			+ "FROM banner_apply_form baf\r\n"
			+ "LEFT JOIN file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE baf.banner_type = 1\r\n"
			+ "    AND UPPER(e.title) LIKE UPPER('%' || #{search} || '%')\r\n"
			+ "    AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "    AND baf.pay_state = 1\r\n"
			+ "ORDER BY baf.banner_apply_form_id DESC")
	int getMainBannerapplytitleSearchCnt(String search);
	
	// 관리자 페이지 메인 배너 전시회 제목 검색 뱃지 관련
	@Select("SELECT\r\n"
			+ "    COUNT(*) AS total_count,\r\n"
			+ "    COUNT(CASE WHEN state = 1 THEN 1 END) AS state_1_count,\r\n"
			+ "    COUNT(CASE WHEN state = 2 THEN 1 END) AS state_2_count\r\n"
			+ "FROM\r\n"
			+ "    (SELECT\r\n"
			+ "        baf.state\r\n"
			+ "     FROM\r\n"
			+ "        banner_apply_form baf\r\n"
			+ "     INNER JOIN\r\n"
			+ "        exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "     LEFT JOIN\r\n"
			+ "        file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "     LEFT JOIN\r\n"
			+ "        user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "     WHERE\r\n"
			+ "        baf.banner_type = 1\r\n"
			+ "        AND UPPER(e.title) LIKE UPPER('%' || #{search} || '%')\r\n"
			+ "    	   AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "    	   AND baf.pay_state = 1\r\n"
			+ "    )")
	BannerApplyFormBean getMainBannerapplytitlesearchBadge(String search);

	// 관리자 페이지 서브 배너 전시회 제목 검색 리스트
	@Select("SELECT\r\n"
			+ "    baf.banner_apply_form_id,\r\n"
			+ "    baf.exhibition_id,\r\n"
			+ "    TO_CHAR(baf.start_date, 'yyyy-mm-dd') AS start_date,\r\n"
			+ "    TO_CHAR(baf.end_date, 'yyyy-mm-dd') AS end_date,\r\n"
			+ "    TO_CHAR(baf.approved_At , 'yyyy-mm-dd') AS approved_At ,\r\n"
			+ "    baf.payment,\r\n"
			+ "    baf.state,\r\n"
			+ "    baf.banner_type,\r\n"
			+ "    ft.name AS banner_name,\r\n"
			+ "    ft.path AS banner_path,\r\n"
			+ "    e.title AS exhibition_title,\r\n"
			+ "    u.name AS user_name\r\n"
			+ "FROM\r\n"
			+ "    banner_apply_form baf\r\n"
			+ "LEFT JOIN\r\n"
			+ "    file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    baf.banner_type = 2\r\n"
			+ "    AND UPPER(e.title) LIKE UPPER('%' || #{search} || '%')\r\n"
			+ "    AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "    AND baf.pay_state = 1\r\n"
			+ "ORDER BY\r\n"
			+ "    baf.banner_apply_form_id DESC")
	List<BannerApplyFormBean> getSubBannerapplytitleSearch(String search, RowBounds rowBounds);
	
	// 관리자 페이지 서브 배너 전시회 제목 검색 페이징 처리를 위한 개수 반환
	@Select("SELECT COUNT(*) \r\n"
			+ "FROM banner_apply_form baf\r\n"
			+ "LEFT JOIN file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE baf.banner_type = 2\r\n"
			+ "    AND UPPER(e.title) LIKE UPPER('%' || #{search} || '%')\r\n"
			+ "    AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "    AND baf.pay_state = 1\r\n"
			+ "ORDER BY baf.banner_apply_form_id DESC")
	int getSubBannerapplytitleSearchCnt(String search);
	
	// 관리자 페이지 서브 배너 전시회 제목 검색 뱃지 관련
	@Select("SELECT\r\n"
			+ "    COUNT(*) AS total_count,\r\n"
			+ "    COUNT(CASE WHEN state = 1 THEN 1 END) AS state_1_count,\r\n"
			+ "    COUNT(CASE WHEN state = 2 THEN 1 END) AS state_2_count\r\n"
			+ "FROM\r\n"
			+ "    (SELECT\r\n"
			+ "        baf.state\r\n"
			+ "     FROM\r\n"
			+ "        banner_apply_form baf\r\n"
			+ "     INNER JOIN\r\n"
			+ "        exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "     LEFT JOIN\r\n"
			+ "        file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "     LEFT JOIN\r\n"
			+ "        user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "     WHERE\r\n"
			+ "        baf.banner_type = 2\r\n"
			+ "        AND UPPER(e.title) LIKE UPPER('%' || #{search} || '%')\r\n"
			+ "    	   AND (baf.state = 1 OR baf.state = 2)\r\n"
			+ "    	   AND baf.pay_state = 1\r\n"
			+ "    )")
	BannerApplyFormBean getSubBannerapplytitlesearchBadge(String search);			
	
	// 관리자 페이지 배너 취소 상태로 변경 state -> 3으로 변경
	@Update("UPDATE banner_apply_form SET state = 3 WHERE banner_apply_form_id = #{banner_apply_form_id}")
	void UpdateApplyBannerCancle(int banner_apply_form_id);
	
	// 관리자 페이지 배너 요청 추가/상세 페이지
	@Select("SELECT\r\n"
			+ "    baf.banner_apply_form_id,\r\n"
			+ "    baf.apply_person_id,\r\n"
			+ "    baf.exhibition_id,\r\n"
			+ "    TO_CHAR(baf.start_date, 'YYYY-MM-DD') AS start_date,\r\n"
			+ "    TO_CHAR(baf.end_date, 'YYYY-MM-DD') AS end_date,\r\n"
			+ "    baf.command,\r\n"
			+ "    TO_CHAR(baf.approved_At, 'YYYY-MM-DD') AS approved_At,\r\n"
			+ "    baf.payment,\r\n"
			+ "    baf.state,\r\n"
			+ "    baf.banner_type,\r\n"
			+ "    baf.banner_file_id,\r\n"
			+ "    ft.name AS banner_name,\r\n"
			+ "    ft.path AS banner_path,\r\n"
			+ "    e.title AS exhibition_title,\r\n"
			+ "    u.name AS user_name,\r\n"
			+ "    u.telephone AS user_telephone,\r\n"
			+ "    u.email AS user_email\r\n"
			+ "FROM\r\n"
			+ "    banner_apply_form baf\r\n"
			+ "LEFT JOIN\r\n"
			+ "    file_table ft ON baf.banner_file_id = ft.file_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    exhibition e ON baf.exhibition_id = e.exhibition_id\r\n"
			+ "LEFT JOIN\r\n"
			+ "    user_table u ON baf.apply_person_id = u.user_id\r\n"
			+ "WHERE\r\n"
			+ "    baf.banner_apply_form_id = #{banner_apply_form_id}")
	BannerApplyFormBean getBannerapplyDetail(int banner_apply_form_id);
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 (메인배너)
	@Insert("INSERT INTO main_banner (exhibition_id, apply_person_id, start_date, end_date, expose_order, state, regdate, pay_money, banner_file_id) VALUES (#{exhibition_id}, #{apply_person_id}, #{start_date}, #{end_date}, #{expose_order}, #{state}, sysdate, #{pay_money}, #{banner_file_id})")
	void addApplyMainBanner(MainBannerBean mainBannerBean);
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 (서브배너)
	@Insert("INSERT INTO sub_banner (exhibition_id, apply_person_id, start_date, end_date, expose_order, state, regdate, pay_money, banner_file_id) VALUES (#{exhibition_id}, #{apply_person_id}, #{start_date}, #{end_date}, #{expose_order}, #{state}, sysdate, #{pay_money}, #{banner_file_id})")
	void addApplySubBanner(SubBannerBean subBannerBean);
	
	// 관리자 페이지 배너 신청 받은거 관리자가 확인하고 추가 후 banner_apply_form 테이블 상태값 변경 (메인, 서브배너 공통)
	@Update("UPDATE banner_apply_form SET state = 2 WHERE banner_apply_form_id = #{banner_apply_form_id}")
	void updatebanner_apply_formState(int banner_apply_form_id);
}
