package adm.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import adm.dao.inter.IPblDao;
import adm.vo.PblprfrVO;
import adm.vo.PrfplcVO;
import adm.vo.SeriesVO;
import adm.vo.TeamVO;
import amd.config.BuildedSqlMapClient;

// 공연 정보 데이터 조작 dao클래스
public class PblDaoImpl implements IPblDao{

	private SqlMapClient smc = null;
	private static PblDaoImpl dao = null;
	
	private PblDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static PblDaoImpl getInstance() {
		if(dao == null) dao = new PblDaoImpl();
		return dao;
	}
	
	@Override
	public List<PrfplcVO> prfList() throws SQLException {
		return smc.queryForList("pblprfr.prfList");
	}

	@Override
	public List<TeamVO> teamList() throws SQLException {
		return smc.queryForList("pblprfr.teamList");
	}

	@Override
	public List<SeriesVO> seriesList() throws SQLException {
		return smc.queryForList("pblprfr.seiresList");
	}

	@Override
	public void insertPerf(PblprfrVO vo) throws SQLException {
		smc.insert("pblprfr.insertPerf", vo);
	}

	@Override
	public List<PblprfrVO> selectPerf() throws SQLException {
		return smc.queryForList("pblprfr.selectPerf");
	}

	@Override
	public List<PblprfrVO> selectPerfTeam(String team) throws SQLException {
		return smc.queryForList("pblprfr.selectPerfTeam",team);
	}

	@Override
	public PblprfrVO selectPerfDetail(int pbl_code) throws SQLException {
		return (PblprfrVO) smc.queryForObject("pblprfr.selectPerfDetail", pbl_code);
	}

	@Override
	public int updatePerf(PblprfrVO vo) throws SQLException {
		
		return smc.update("pblprfr.updatePerf", vo);
	}

	@Override
	public int deletePerf(int code) throws SQLException {
		return smc.delete("pblprfr.deletePerf", code);
	}
	
	
}
