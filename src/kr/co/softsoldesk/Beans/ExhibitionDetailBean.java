package kr.co.softsoldesk.Beans;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExhibitionDetailBean {

	private int exhibition_id;
	private String title;
	private String regdate;
	private int state;
	private String author;
	private int price;
	private String exhibition_start; 
	private String exhibition_end;
	private String open;
	private String holiday;
	private String address;
	private String place;
	private double latitude;				// 전시회 위도
	private double longitude;				// 전시회 경도
	private String site;					// 전시회 사이트
	private int apply_person;
	private String apply_name;				// 신청인 이름
	private String apply_email;				// 신청인 이메일
	private String apply_telephone;			// 신청인 전화번호
	private String main_poster_path;		// 실제 가져오는 메인포스터 파일 경로
	private String main_poster_name;		// 실제 가져오는 메인포스터 파일 이름
	private String detail_poster_path;		// 실제 가져오는 상세포스터 파일 경로
	private String detail_poster_name;		// 실제 가져오는 상세포스터 파일 이름
	private int main_poster_file_id;		// 전시회 테이블에 있는 main_poster_file_id
	private int detail_poster_file_id;		// 전시회 테이블에 있는 detail_poster_file_id
	
	// 파일 처리용
	private MultipartFile main_poster_file;			// 파일 업로드 처리 받을 메인포스터
	private MultipartFile detail_poster_file;		// 파일 업로드 처리 받을 상세포스터
	
	private String open_time;						// open_time + close_time = open에 set해서 db 저장
	private String close_time;
	
	// file_table name, path
	private String name;
	private String path;
	
}
