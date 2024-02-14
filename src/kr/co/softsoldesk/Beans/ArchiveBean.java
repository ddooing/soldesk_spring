package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArchiveBean {

	private String contents;
	private int reserve_id;
	private int rating;
	private int expose;
	private String reserve_date;
	private String regdate;
	private String create_date;
	private String modify_date;
	private int ticket_count;
	private int total_price;
	private String title;
	private String place;
	private String main_poster_name;
	private String main_poster_path;

}
