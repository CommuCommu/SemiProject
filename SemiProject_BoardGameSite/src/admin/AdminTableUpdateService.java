package admin;

import java.util.List;

import dto.TableDto;
import reservation.TableDao;

public class AdminTableUpdateService {
	public AdminTableUpdateService() {

	}
	public List<TableDto> getAllTableList() {
		TableDao tDao = new TableDao();
		
		return tDao.getAllTableList(); 
	}
}
