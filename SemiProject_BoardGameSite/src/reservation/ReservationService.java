package reservation;

import java.util.List;

import dto.TableDto;

public class ReservationService {
	public ReservationService() {

	}
	public List<TableDto> getReservationTableList() {
		TableDao tDao = new TableDao();
		
		return tDao.getReservationTableList(); 
	}
}
