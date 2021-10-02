package adm.service.inter;

import java.sql.SQLException;
import java.util.List;

import adm.vo.AdvantkVO;
import adm.vo.AvdSeatVO;
import adm.vo.PblprfrVO;
import adm.vo.ReserveVO;

public interface ITicketingService {

	
	/**
	 * 날짜를 받아와 해당 날짜의 공연명 불러오는 메서드
	 * @param pblDate
	 * @return
	 * @throws SQLException
	 */
	public List<PblprfrVO> selectPblNm(String pblDate);
	
	/**
	 * 선태한 코드으로 공연정보 가져오기
	 * @param pblNm
	 * @return
	 * @throws SQLException
	 */
	public PblprfrVO selectPbl(int code);
	
	/**
	 * 선택한 공연 좌석 정보 가져오기
	 * @param code
	 * @return
	 * @throws SQLException
	 */
	public List<AvdSeatVO> selectSeat(int code);
	
	/**
	 * 예매 내역 저장하는 메서드
	 * @param vo
	 * @throws SQLException
	 */
	public void insertAdv(AdvantkVO vo);
	
	
	/**
	 * 예매 내역 불러오는 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public List<ReserveVO> selectReserv(String id);
}
