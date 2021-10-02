package adm.service.inter;

import java.sql.SQLException;
import java.util.List;

import adm.vo.ViewVO;

public interface IViewService {
	
	public List<ViewVO> viewList (String memId);

}
