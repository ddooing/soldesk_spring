package kr.co.softsoldesk.Service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.Beans.BoardBean;
import kr.co.softsoldesk.Beans.NoticeBean;
import kr.co.softsoldesk.dao.NoticeDao;
import kr.co.softsoldesk.mapper.NoticeMapper;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	/*
	private final NoticeMapper noticeMapper;

	@Autowired
	public NoticeService(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}

	public List<NoticeBean> getNoticeList() {
		return noticeMapper.selectNoticeList();
	}

	public NoticeBean getNoticeInfo(int noticeId) {
		return noticeMapper.selectNoticeById(noticeId);
	}*/
	
	// 전체 게시글 목록을 가져오는 메서드
    public List<NoticeBean> getNoticeList() {
    	
        return noticeDao.getNoticeList();
    }
    
    
    public NoticeBean getNoticeInfo(int noticeId) {
		return noticeDao.getNoticeInfo(noticeId);
	}
 //
}
