package adm.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.dao.impl.NoticeDaoImpl;
import adm.dao.inter.INoticeDao;
import adm.service.inter.INoticeService;
import adm.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {
	private INoticeDao dao;
	private static INoticeService service;
	
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getDao();
	}
	
	public static INoticeService getService() {
		if(service == null) service = new NoticeServiceImpl();
		
		return service;
	}
	
	//공지사항 입력
	@Override
	public void insertNotice(NoticeVO vo) {
	
		try {
			dao.insertNotice(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	//공지사항 리스트
	@Override
	public List<NoticeVO> noticeList(Map<String, Integer> map) {
		List<NoticeVO> notiVo = null;
		
		try {
			notiVo = dao.noticeList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notiVo;
	}

	//공지사항 개수
	@Override
	public int countList() {
		int count = 0;
		
		try {
			count = dao.countList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
		return count;
	}

	//공지사항 상세보기
	@Override
	public NoticeVO selectDetail(int code) {
		NoticeVO vo = null;
		
		try {
			vo = dao.selectDetail(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	//공지사항 수정_코드
	@Override
	public int updateNotice(NoticeVO vo) {
		int code = 0;
		
		try {
			code = dao.updateNotice(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return code;
	}

	//공지사항 수정
	@Override
	public int updateNotice2(Map<String, Integer> map) {
		int cnt = 0;
		
		try {
			cnt = dao.updateNotice2(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	//공지사항 삭제
	@Override
	public int deleteNotice(int code) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteNotice(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

}
