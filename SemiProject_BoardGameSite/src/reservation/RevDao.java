package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.ReservationDto;

public class RevDao{
	
	private RevDao() {
		
	}
	
	public List<ReservationDto> getResList() {
		
		String sql =  " SELECT * "
					+ " FROM BG_RESERVATION "
					+ " WHERE RDATE = ? ";
		/*
INSERT
//오늘날짜 자동입력 (sysdate)
insert into sale_plan values('1309094885','S12011','xxxxxx',5,25000000,'1/4','1234',sysdate); 

//기타 포맷형식으로 입력
insert into sale_plan values('1309094885','S12011','xxxxxx',5,25000000,'1/4','1234',to_date('09-09-2013 12:14:11','mm-dd-yyyy hh24:mi:ss')); 
SELECT

//포맷에 맞춰서 출력하기

select to_char(writerdate, 'yyyy-mm-dd hh24:mi:ss') from sale_plan;
		 */
		
		
		
		
		
					
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList success");
			
			while(rs.next()) {
				int i = 1;
				/*
				ReservationDto dto = new ReservationDto(rs.getInt(i++), 
										rs.getString(i++), 
										rs.getInt(i++), 
										rs.getInt(i++), 
										rs.getInt(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getInt(i++), 
										rs.getInt(i++));
				list.add(dto);
				*/
			}
			System.out.println("4/6 getBbsList success");
			
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return list;
	}

}
