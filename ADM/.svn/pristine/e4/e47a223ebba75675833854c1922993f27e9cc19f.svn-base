package adm.dao.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.vo.ReviewVO;

public interface IReviewDao {

	//후기게시판 전체 글 가져오기
	public List<ReviewVO> reviewList (Map<String, Integer> map) throws SQLException;
	
	//전체 글 개수
	public int countList() throws SQLException;
	
	//원하는 글 선택해서 조회
	public ReviewVO selectDetail(int code) throws SQLException;

	//공연제목 조회
	public ReviewVO selectPblnm(int code) throws SQLException;
	
	//글 쓰기
	public void insertReview(ReviewVO vo) throws SQLException;
	
	//글 수정
	public int updateReview(ReviewVO vo) throws SQLException;
	
	//글 삭제
	public int deleteReview(int code) throws SQLException;
	
	//조회수 증가
	public int revCnt(int code) throws SQLException; 
}
