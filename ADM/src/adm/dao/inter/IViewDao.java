package adm.dao.inter;

import java.sql.SQLException;
import java.util.List;

import adm.vo.ViewVO;

public interface IViewDao {
	
	public List<ViewVO> viewList (String memId) throws SQLException;

}
