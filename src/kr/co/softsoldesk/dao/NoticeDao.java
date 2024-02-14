package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.mapper.NoticeMapper;

@Repository
public class NoticeDao {
	
	@Autowired
    private NoticeMapper noticeMapper;
	

	public List<NoticeBean> getNoticeList() {
        return noticeMapper.getNoticeList(); // BoardDao에서 전체 게시글 목록을 가져오는 메서드를 호출
    }
	
	public NoticeBean getNoticeInfo(int notice_id)
	{
		return noticeMapper.getNoticeInfo(notice_id);
	} 
	
	
}
