package adm.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import adm.dao.impl.MemberDaoImpl;
import adm.dao.inter.IMemberDao;
import adm.service.inter.IMemberService;
import adm.vo.MemberVO;

public class MemberServiceImpl implements IMemberService{
	private IMemberDao dao;
	private static MemberServiceImpl service;
	
	//생성자
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberServiceImpl getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	//회원 추가
	@Override
	public String insertMember(MemberVO memVO) {
		String input = null;
		try {
			input = dao.insertMember(memVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return input;
	}
	
	
	//아이디 중복 체크
	@Override
	public String idCheck(String memId) {
		String idCheck = null;
		try {
			idCheck = dao.idCheck(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idCheck;
	}
	
	//로그인
	@Override
	public MemberVO login(Map<String, String> map) {
		MemberVO memVO = null;
		
		try {
			memVO = dao.login(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memVO;
	}
	
	//아이디 찾기
	@Override
	public String findId(Map<String, String> map) {
		String id = null;
		
		try {
			id = dao.findId(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	//비밀번호 찾기
	@Override
	public int findPass(Map<String, String> map) {
		int pass = 0;
		try {
			pass = dao.findPass(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pass;
	}

	@Override
	public String findPassword(Map<String, String> map) {
		String pass = null;
		try {
			pass = dao.findPassword(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pass;
	}

	@Override
	public int memberUpdate(MemberVO memVO) {
		int result = 0;
		try {
			result = dao.memberUpdate(memVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}


	//비밀번호 찾기









}
