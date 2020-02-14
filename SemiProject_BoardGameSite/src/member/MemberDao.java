package member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {

	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		
	}
	
	public static MemberDao getInstance() {
		return dao;
	}
		
	
	public MemberDto login(String id, String pw) {
		String sql = " SELECT SEQ, ID, PW, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL " 
				+ " FROM BG_MEMBER "
				+ " WHERE ID=? AND PW=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDto memDto = null;
		
		System.out.println(sql);
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 login success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 login success!");
			
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			System.out.println("3/6 login success!");
			while(rs.next()) {
				int i = 1;
				memDto = new MemberDto(rs.getInt(i++),
									   rs.getString(i++),
									   rs.getString(i++),
									   rs.getString(i++),
									   rs.getString(i++),
									   rs.getString(i++),
									   rs.getInt(i++),
									   rs.getString(i++),
									   rs.getInt(i++),
									   rs.getInt(i++));
			}
			System.out.println("4/6 login success!");
		} catch (SQLException e) {
			System.out.println("login fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return memDto;	
	}
	
	public boolean addMember(MemberDto dto) {
		
		String sql = " INSERT INTO BG_MEMBER (SEQ, ID, PW, CALL_NUMBER, "
				+ " NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL) "
				+ " VALUES(SEQ_BG_MEMBER.NEXTVAL, ?, ?, ?, ?, ?, 0, SYSDATE, 0, 0 ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
	    try {
	    	conn = DBConnection.getConnection();
	    	System.out.println("1/6 addMember success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addMember success!");
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getCall_number());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getEmail());
			count = psmt.executeUpdate();
			System.out.println("3/6 addMember success!");
			
		} catch (SQLException e) {
			System.out.println("addMember fail!");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count > 0 ? true:false; 
	}
	
	public boolean idCheck(String id) {
		
		String sql = " SELECT ID"
				+ " FROM BG_MEMBER "
				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 idCheck success!");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 idCheck success!");
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while(rs.next()) {
				result = 1;
			}
			System.out.println("3/6 idCheck success!");
		} catch (SQLException e) {
			System.out.println("idCheck fail!");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return result > 0? true:false;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}




















