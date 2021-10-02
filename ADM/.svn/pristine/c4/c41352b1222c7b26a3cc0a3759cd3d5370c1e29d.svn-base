package adm.dao.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.vo.QnaVO;
import adm.vo.QnasVO;

public interface IQnaDao {
	
	//Q&A 리스트
	public List<QnaVO> qnaList (Map<String, Integer> map) throws SQLException;
	
	//Q&A 글개수
	public int qnaCount() throws SQLException;
	
	//Q&A 게시글 상세보기
	public QnaVO qnaDetail(int code) throws SQLException;
	
	//Q&A 입력하기
	public void qnaInsert (QnaVO vo) throws SQLException;
	
	//Q&A 코드 가져오기
	public int qnaUpdate(QnaVO vo) throws SQLException;
	
	//Q&A 수정하기
	/* public int qnaUpdate2(Map<String, Integer>map) throws SQLException; */
	
	//Q&A 삭제하기
	public int qnaDelete(int code) throws SQLException;
	
	public int qnaCnt(int code) throws SQLException;
	
	//Q&A 댓글쓰기
	public int qnaReplyInsert(QnasVO vo) throws SQLException;
	
	//Q&A 댓글보기
	public List<QnasVO> qnaReplyList (int code) throws SQLException;
	
	//Q&A 댓글수정
	public int qnaReplyUpdate(QnasVO vo) throws SQLException;
	
	//Q&A 댓글삭제
	public int qnaReplyDelete(int code) throws SQLException;
	
	//Q&A 댓글개수
	public int qnasCount() throws SQLException;
}
