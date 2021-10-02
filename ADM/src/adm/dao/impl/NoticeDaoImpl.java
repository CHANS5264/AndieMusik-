package adm.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.inter.INoticeDao;
import adm.vo.NoticeVO;
import amd.config.BuildedSqlMapClient;

public class NoticeDaoImpl implements INoticeDao {
	
	private SqlMapClient client;
	private static NoticeDaoImpl dao;
	
	private NoticeDaoImpl() {
		client = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static INoticeDao getDao() {
		if(dao == null) dao = new NoticeDaoImpl();
		
		return dao;
	}
	
	@Override
	public void insertNotice(NoticeVO vo) throws SQLException {
		 client.insert("notice.insertNotice", vo);
	}

	@Override
	public List<NoticeVO> noticeList(Map<String, Integer> map) throws SQLException {
		return client.queryForList("notice.noticeList", map);
	}

	@Override
	public int countList() throws SQLException {
		return (Integer)client.queryForObject("notice.countList");
	}

	@Override
	public NoticeVO selectDetail(int code) throws SQLException {
		return (NoticeVO)client.queryForObject("notice.selectDetail", code);
	}

	@Override
	public int updateNotice(NoticeVO vo) throws SQLException {
		return client.update("notice.updateNotice", vo);
	}

	@Override
	public int updateNotice2(Map<String, Integer> map) throws SQLException {
		return client.update("notice.updateNotice2", map);
	}

	@Override
	public int deleteNotice(int code) throws SQLException {
		return client.delete("notice.deleteNotice", code);
	}
	
	


}
