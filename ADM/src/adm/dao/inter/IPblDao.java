package adm.dao.inter;

import java.sql.SQLException;
import java.util.List;

import adm.vo.PblprfrVO;
import adm.vo.PrfplcVO;
import adm.vo.SeriesVO;
import adm.vo.TeamVO;

// 공연정보 데이터 조닥 Dao 인터페이스
public interface IPblDao {
	
	/**
	 * 공연장 정보 얻어오는 메서드
	 * @return 공연장 정보 VO List
	 */
	public List<PrfplcVO> prfList() throws SQLException;
	
	/**
	 * 공연팀 정보를 얻어오는 메서드
	 * @return 팀 정보 VO list
	 * @throws SQLException
	 */
	public List<TeamVO> teamList() throws SQLException;
	
	/**
	 * 리스트 정보를 얻어오는 메서드
	 * @return 리스트 정보VO list
	 * @throws SQLException
	 */
	public List<SeriesVO> seriesList() throws SQLException;
	
	/**
	 * 공연 정보 insert하는 메서드
	 * @throws SQLException
	 */
	public void insertPerf(PblprfrVO vo) throws SQLException;

	/**
	 * 공연정보 list select메서드
	 * @return
	 * @throws SQLException
	 */
	public List<PblprfrVO> selectPerf() throws SQLException;
	
	/**
	 * 공연팀 별로 list select메서드
	 * @param team
	 * @return
	 */
	public List<PblprfrVO> selectPerfTeam(String team) throws SQLException;
	
	/**
	 * 선택한 공연의 상세정보 select 메서드
	 * @param pbl_code
	 * @return
	 * @throws SQLException
	 */
	public PblprfrVO selectPerfDetail(int pbl_code) throws SQLException;
	
	/**
	 * 공연 정보 수정 메서드
	 * @param code
	 * @return
	 * @throws SQLException
	 */
	public int updatePerf(PblprfrVO vo) throws SQLException;
	
	/**
	 * 공연 정보 삭제 메서드
	 * @param code
	 * @return
	 * @throws SQLException
	 */
	public int deletePerf(int code) throws SQLException;
	
}










