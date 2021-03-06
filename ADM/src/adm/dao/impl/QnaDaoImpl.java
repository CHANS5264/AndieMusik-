package adm.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.inter.IQnaDao;
import adm.vo.QnaVO;
import adm.vo.QnasVO;
import amd.config.BuildedSqlMapClient;

public class QnaDaoImpl implements IQnaDao {
	
	private SqlMapClient client;
	private static QnaDaoImpl dao;
	
	private QnaDaoImpl() {
		client = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static IQnaDao getDao() {
		if(dao == null) dao = new QnaDaoImpl();
		
		return dao;
	}
	
	//공지사항 리스트
	@Override
	public List<QnaVO> qnaList(Map<String, Integer> map) throws SQLException {
		return client.queryForList("qna.qnaList", map);
	}
	
	//공지사항 글개수
	@Override
	public int qnaCount() throws SQLException {
		return (Integer)client.queryForObject("qna.qnaCount");
	}
	
	//공지사항 상세보기
	@Override
	public QnaVO qnaDetail(int code) throws SQLException {
		return (QnaVO)client.queryForObject("qna.qnaDetail", code);
	}

	@Override
	public void qnaInsert(QnaVO vo) throws SQLException {
		client.insert("qna.qnaInsert", vo);
	}

	@Override
	public int qnaUpdate(QnaVO vo) throws SQLException {
		return client.update("qna.qnaUpdate", vo);
	}

	/*
	 * @Override public int qnaUpdate2(Map<String, Integer> map) throws SQLException
	 * { return client.update("qna.qnaUpdate2", map); }
	 */

	@Override
	public int qnaDelete(int code) throws SQLException {
		return client.delete("qna.qnaDelete", code);
	}

	@Override
	public int qnaCnt(int code) throws SQLException {
		return client.update("qna.qnaCnt", code);
	}

	@Override
	public int qnaReplyInsert(QnasVO vo) throws SQLException {
		return (Integer)client.insert("qna.qnaReplyInsert", vo);
	}

	@Override
	public List<QnasVO> qnaReplyList(int code) throws SQLException {
		return client.queryForList("qna.qnaReplyList", code);
	}

	@Override
	public int qnaReplyUpdate(QnasVO vo) throws SQLException {
		return client.update("qna.qnaReplyUpdate", vo);
	}

	@Override
	public int qnaReplyDelete(int code) throws SQLException {
		//System.out.println("dao : " + client.delete("qna.qnaReplyDelete", code));
		return client.delete("qna.qnaReplyDelete", code);
	}

	@Override
	public int qnasCount() throws SQLException {
		return (Integer)client.queryForObject("qna.qnasCount");
	}

}
