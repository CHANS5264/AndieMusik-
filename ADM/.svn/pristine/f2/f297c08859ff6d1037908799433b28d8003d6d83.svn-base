package adm.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.dao.impl.ReviewDaoImpl;
import adm.service.inter.IReviewService;
import adm.vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{
	private ReviewDaoImpl dao;
	private static ReviewServiceImpl service;
	
	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getInstance();
	}
	
	public static ReviewServiceImpl getInstance() {
		if(service == null) service = new ReviewServiceImpl();
		return service;
		
			
	}
	
	//후기게시판 전체글 가져오기
	@Override
	public List<ReviewVO> reviewList(Map<String, Integer> map) {
		List<ReviewVO> list = null;
		try {
			list=dao.reviewList(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//전체 글 개수
	@Override
	public int countList() {
		int count = 0;
		
		try {
			count = dao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//원하는 글 선택 조회
	@Override
	public ReviewVO selectDetail(int code) {
		ReviewVO vo = null;
		
		try {
			vo = dao.selectDetail(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	//공연 내역 조회
	@Override
	public ReviewVO selectPblnm(int code) {
		ReviewVO vo = null;
		
		try {
			vo = dao.selectPblnm(code);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//글 쓰기
	@Override
	public void insertReview(ReviewVO vo) {
		
		try {
			dao.insertReview(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		};
	}
	
	//글 수정
	@Override
	public int updateReview(ReviewVO vo) {
		int count = 0;
		try {
			count = dao.updateReview(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	//글 삭제
	@Override
	public int deleteReview(int code) {
		int num = 0;
		try {
			num = dao.deleteReview(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//조회수 증가
	@Override
	public int revCnt(int code) {
		int cnt = 0;
		try {
			cnt = dao.revCnt(code);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	

}
