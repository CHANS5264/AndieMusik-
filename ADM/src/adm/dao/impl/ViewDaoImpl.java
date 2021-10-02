package adm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.inter.IViewDao;
import adm.vo.ViewVO;
import amd.config.BuildedSqlMapClient;

public class ViewDaoImpl implements IViewDao{
	private static ViewDaoImpl dao;
	private SqlMapClient smc;
	
	private  ViewDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static ViewDaoImpl getInstance() {
		if(dao == null)
			dao = new ViewDaoImpl();
		
		return dao;
	}

	@Override
	public List<ViewVO> viewList(String memId) throws SQLException {
		
		return smc.queryForList("view.viewList", memId);
	}

}
