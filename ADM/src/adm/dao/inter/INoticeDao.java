package adm.dao.inter;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.vo.NoticeVO;

public interface INoticeDao {
	//공지사항 입력
	public void insertNotice (NoticeVO vo) throws SQLException;
	
	//공지사항 전체 글 가져오기
	public List<NoticeVO> noticeList (Map<String, Integer> map) throws SQLException;
	
	//글 개수 가져오기
	public int countList() throws SQLException;
	
	//공지사항 상세보기
	public NoticeVO selectDetail(int code) throws SQLException;
	
	//공지사항 코드 가져오기
	public int updateNotice(NoticeVO vo) throws SQLException;
	
	//공지사항 수정하기
	public int updateNotice2(Map<String, Integer>map ) throws SQLException;
	
	//공지사항 삭제하기
	public int deleteNotice(int code) throws SQLException;
	
}
