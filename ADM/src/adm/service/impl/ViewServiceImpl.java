package adm.service.impl;

import java.sql.SQLException;
import java.util.List;

import adm.dao.impl.ViewDaoImpl;
import adm.service.inter.IViewService;
import adm.vo.ViewVO;

public class ViewServiceImpl implements IViewService{
	private ViewDaoImpl dao;
	private static ViewServiceImpl service;
	
	private ViewServiceImpl() {
		dao = ViewDaoImpl.getInstance();
	}
	
	public static ViewServiceImpl getInstance() {
		if(service == null)
			service = new ViewServiceImpl();
		return service;
	}

	@Override
	public List<ViewVO> viewList(String memId) {
		List<ViewVO> list = null;
		try {
			list = dao.viewList(memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
