package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.TableDto;

public class TableDao {

	public TableDao() {
		
	}
	
	public List<TableDto> getReservationTableList() {
		String sql =  " SELECT * "
					+ " FROM BG_TABLE "
					+ " WHERE ISRESERVAITONTABLE = 1 ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TableDto> list = new ArrayList<TableDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getTableList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getTableList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getTableList success");
			
			while(rs.next()) {
				int i = 1;
				TableDto dto = new TableDto(rs.getInt(i++), 
											rs.getInt(i++), 
											rs.getInt(i++));
				list.add(dto);

			}
			System.out.println("4/6 getTableList success");
			
		} catch (SQLException e) {
			System.out.println("getTableList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}
	
	
	public List<TableDto> getAllTableList() {
		String sql =  " SELECT * "
					+ " FROM BG_TABLE ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TableDto> list = new ArrayList<TableDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllTableList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllTableList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllTableList success");
			
			while(rs.next()) {
				int i = 1;
				TableDto dto = new TableDto(rs.getInt(i++), 
											rs.getInt(i++), 
											rs.getInt(i++));
				list.add(dto);

			}
			System.out.println("4/6 getAllTableList success");
			
		} catch (SQLException e) {
			System.out.println("getAllTableList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	}
}
