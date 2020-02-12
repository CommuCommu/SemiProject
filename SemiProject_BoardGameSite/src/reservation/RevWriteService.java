package reservation;

import java.util.List;

import com.google.gson.Gson;

import dto.ReservationDto;

public class RevWriteService {
	public String getTodayReservationList(String year, String month, String day, String tableNumber) {

		int STARTTIME = 9;	//매장의 운영시간은 9시에 시작해서
		int ENDTIME = 22;		//22시에 종료한다. 예제임. 만약 새벽 2시라고 표기하고 싶으면 26시로 표기할 것.
		
		int checkRev[] = new int[ENDTIME - STARTTIME];	//리턴용 배열 선언
		System.out.println(checkRev.length);
		
		for(int i : checkRev) {	//초기화 -> 0은 예약 없음. 1은 예약 있음임. 시간대별로 기록할 것.
			checkRev[i] = 0;
		}
		
		String YYYYMMDD = year + two(month) + two(day);
		int tn = Integer.parseInt(tableNumber);
		
		RevDao rDao = new RevDao();
		List<ReservationDto> list = rDao.getTodayReservationList(YYYYMMDD, tn);
		

		if(list.size() < 1) {	//리스트에 아무것도 없을 경우
			
		}else {	//리스트에 무언가 있을 경우.
			for (ReservationDto dto : list) {
				
			}
		}
		
		
		
		
		String returnString = new Gson().toJson(checkRev);
		return returnString;
	}

	public String two(String msg){
		return msg.trim().length()<2?"0"+msg.trim():msg.trim();
	}
	
}
