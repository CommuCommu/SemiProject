package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;
import dto.ReservationDto;

public class RevDao{
	
	public RevDao() {
		
	}
	
	public List<ReservationDto> getTodayReservationList(String YYYYMMDD, int tn) {
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
		
		String sql =  " SELECT * "
					+ " FROM BG_RESERVATION "
					+ " WHERE TO_CHAR(RDATE, 'YYYYMMDD') = ? AND TABLENUMBER = ? AND DEL = 0";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getTodayReservationList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, YYYYMMDD);
			psmt.setInt(2, tn);
			System.out.println("2/6 getTodayReservationList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getTodayReservationList success");
			
			while(rs.next()) {
				int i = 1;
				ReservationDto dto = new ReservationDto(rs.getInt(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++), 
														rs.getInt(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/6 getTodayReservationList success");
			
		} catch (SQLException e) {
			System.out.println("getTodayReservationList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		
		return list;
	}
	public boolean insertRev(String YYYYMMDD, int tn ,int st, int et, int pn, String memo, String id) {
		
		String sql = " INSERT INTO BG_RESERVATION "
				+ " VALUES(SEQ_BG_RESERVATION.NEXTVAL, ?, SYSDATE, ?, ?, ?, ?, ?, ? , 0 ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

	    try {
	    	conn = DBConnection.getConnection();
	    	System.out.println("1/6 insertRev success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 insertRev success!");
			
			psmt.setString(1, id);
			psmt.setString(2, YYYYMMDD);
			psmt.setInt(3, st);
			psmt.setInt(4, et);
			psmt.setInt(5, tn);
			psmt.setString(6, memo);
			psmt.setInt(7, pn);
			count = psmt.executeUpdate();
			System.out.println("3/6 insertRev success!");
			
		} catch (SQLException e) {
			System.out.println("insertRev fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count > 0 ? true:false; 
	}

}
