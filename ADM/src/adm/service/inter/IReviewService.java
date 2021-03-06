package adm.service.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.vo.ReviewVO;

public interface IReviewService {

	//공지사항 전체 글 가져오기
	public List<ReviewVO> reviewList (Map<String, Integer> map);

	//전체 글 개수
	public int countList();

	//원하는 글 선택해서 조회
	public ReviewVO selectDetail(int code);
	
	//공연이름 조회
	public ReviewVO selectPblnm(int code);

	//글 쓰기
	public void insertReview(ReviewVO vo);

	//글 수정
	public int updateReview(ReviewVO vo);

	//글 삭제
	public int deleteReview(int code);
	
	public int revCnt(int code);
}
