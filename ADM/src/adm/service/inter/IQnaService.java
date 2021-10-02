package adm.service.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.vo.QnaVO;
import adm.vo.QnasVO;

public interface IQnaService {
	//공지사항 리스트
	public List<QnaVO> qnaList (Map<String, Integer> map);
	
	//공지사항 글개수
	public int qnaCount();

	//공지사항 상세보기
	public QnaVO qnaDetail(int code);
	
	//Q&A 입력하기
	public void qnaInsert (QnaVO vo);
		
	//Q&A 코드 가져오기
	public int qnaUpdate(QnaVO vo);
		
	//Q&A 수정하기
	/* public int qnaUpdate2(Map<String, Integer>map); */
		
	//Q&A 삭제하기
	public int qnaDelete(int code);
	
	public int qnaCnt(int code);
	
	//Q&A 댓글쓰기
	public int qnaReplyInsert(QnasVO vo);
	
	//Q&A 댓글보기
	public List<QnasVO> qnaReplyList (int code);
	
	//Q&A 댓글수정
	public int qnaReplyUpdate(QnasVO vo);
		
	//Q&A 댓글삭제
	public int qnaReplyDelete(int code);
	
	//Q&A 댓글 개수
	public int qnasCount();
}
