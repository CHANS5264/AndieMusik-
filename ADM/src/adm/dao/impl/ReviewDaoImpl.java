package adm.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.inter.IReviewDao;
import adm.vo.ReviewVO;
import amd.config.BuildedSqlMapClient;

public class ReviewDaoImpl implements IReviewDao{
	private static ReviewDaoImpl dao;
	private SqlMapClient smc;
	
	private ReviewDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static ReviewDaoImpl getInstance() {
		if(dao == null) 
			dao = new ReviewDaoImpl();
		
		return dao;
	}
	
	//후기게시판 전체글 가져오기
	@Override
	public List<ReviewVO> reviewList(Map<String, Integer> map) throws SQLException {
		return smc.queryForList("review.reviewList", map);
	}
	
	//전체 글 개수
	@Override
	public int countList() throws SQLException {
		return (Integer)smc.queryForObject("review.countList");
	}
	
	//원하는 글 선택조회
	@Override
	public ReviewVO selectDetail(int code) throws SQLException {
		return (ReviewVO) smc.queryForObject("review.selectDetail", code);
	}
	
	//공연제목 조회
	@Override
	public ReviewVO selectPblnm(int code) throws SQLException {
		
		return (ReviewVO) smc.queryForObject("review.selectPblnm",code);
	}
	
	//글쓰기
	@Override
	public void insertReview(ReviewVO vo) throws SQLException {
		smc.insert("review.insertReview", vo);
	}
	
	//글수정
	@Override
	public int updateReview(ReviewVO vo) throws SQLException {
		return smc.update("review.updateReview", vo);
	}
	
	//글삭제
	@Override
	public int deleteReview(int code) throws SQLException {
		return smc.delete("review.deleteReview", code);
	}
	
	//조회수 증가
	@Override
	public int revCnt(int code) throws SQLException {
		return smc.update("review.revCnt", code);
	}

}
