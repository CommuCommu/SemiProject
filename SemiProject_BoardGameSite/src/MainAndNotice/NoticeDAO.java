package MainAndNotice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.NoticeDto;

public class NoticeDAO {
    
	
	
	private static NoticeDAO dao = new NoticeDAO();
	
	private NoticeDAO() {

	}
	
	public static NoticeDAO getInstance() {
		return dao;
	}
	
	
	
	// 공지 작성
	public boolean writeNotice(NoticeDto dto) {
		
		String sql = " INSERT INTO BG_NOTICE(SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL) "
				+ " VALUES(SEQ_BG_NOTICE.NEXTVAL, ?, SYSDATE, ?, ?, 0, 0) ";
		
		// null 값 방지 저스트 출력용도
		System.out.println(dto.getId());	
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getWdate());
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			count = psmt.executeUpdate();
			System.out.println("writeNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("writeNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	
	}
	
	
	// 공지 수정
	public boolean updateNotice(String title, String content, int seq) {
		
		String sql = " UPDATE BG_NOTICE "
				+ " SET TITLE = ? , CONTENT = ? "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, seq);
			
			count = psmt.executeUpdate();
			System.out.println("updateNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("updateNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	}
	
	
	// 공지 삭제
	public boolean deleteNotice(int seq) {
		
		String sql = " UPDATE BG_NOTICE "
				+ " SET DEL = 1 "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			count = psmt.executeUpdate();
			
			System.out.println("deleteNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("deleteNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false;
	}
	
	
	
	// 怨듭� 寃��깋
	public List<NoticeDto> getNoticeList(String choice, String searchWord) {
		
		String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
				+ " FROM BG_NOTICE ";
		
		String sqlWord = "";
		
		if(choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
		} else if(choice.equals("writer")) {
			sqlWord = " WHERE ID ='" + searchWord.trim() + "'";
		} else if(choice.equals("content")) {
			sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
		}
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				NoticeDto dto = new NoticeDto(rs.getInt(i++), 
											  rs.getString(i++), 
											  rs.getString(i++), 
											  rs.getString(i++), 
											  rs.getString(i++), 
											  rs.getInt(i++),
											  rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("getNoticeList Finally Success");
			
		} catch (SQLException e) {
			System.out.println("getNoticeList Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	
	// 珥� 怨듭� 湲� 媛쒖닔
	// 留뚯빟 13媛쒓� �엳�쑝硫� 2�럹�씠吏�. (10媛쒕떦 1�럹�씠吏��씤 寃쎌슦)
	public int getAllNotice(String choice, String searchWord) {
		
		String sql = " SELECT COUNT(*) FROM BG_NOTICE ";
		
		String sqlWord = "";
		
		if(choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
		} else if(choice.equals("writer") && !searchWord.equals("")) {
			sqlWord = " WHERE ID = '" + searchWord.trim() + "'";
		} else if(choice.equals("content")) {
			sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
		}
		
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int length = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				length = rs.getInt(1);
			}
			
			System.out.println("getAllNotice Finally Success");
			
		} catch (SQLException e) {
			System.out.println("getAllNotice Failed");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return length;
	}
	
	
	// 공지사항 조회수
	public void viewCount(int seq) {
		String sql = " UPDATE BG_NOTICE "
				+ " SET READCOUNT = READCOUNT + 1 "
				+ " WHERE SEQ = " + seq;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			count = psmt.executeUpdate();
			
			System.out.println("viewCount Finally Success");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("viewCount Failed");
		} finally {
			DBClose.close(psmt, conn, null);
		}
	}
	
	
	// 공지사항 상세 조회
	public NoticeDto noticeDetail(int seq) {
		String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
				+ " FROM BG_NOTICE "
				+ " WHERE SEQ = ? ";
		
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		NoticeDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new NoticeDto(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4), 
									rs.getString(5), 
									rs.getInt(6),
									rs.getInt(7));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}
	
	
	
	// who..........
	// �젣�씪 源뚰깉�뒪�윭�슫 硫붿냼�뱶.............
	// 媛�利덉븘........
	
	public List<NoticeDto> getNoticePagingList(String choice, String searchWord, int page) {
		
	String sql = " SELECT SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
			+ " FROM ";
	
		   sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SEQ ASC) AS RNUM, "
		   		+ "			SEQ, ID, WDATE, TITLE, CONTENT, READCOUNT, DEL "
		   		+ " FROM BG_NOTICE "
		   		+ " WHERE DEL = 0 ";
		   
	String sqlWord = "";
	
	if(choice.equals("title")) {
		sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
	} else if(choice.equals("writer")) {
		sqlWord = " WHERE ID='" + searchWord.trim() + "'";
	} else if(choice.equals("content")) {
		sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
	}
	sql += sqlWord;
	
	sql += " ORDER BY SEQ ASC )";
	sql += " WHERE RNUM >= ? AND RNUM <= ? ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	List<NoticeDto> list = new ArrayList<NoticeDto>();
	
	int start, end;
	
	start = 1 + 10 * page;
	end = 10 + 10 * page;
	
	try {
		conn = DBConnection.getConnection();
		psmt = conn.prepareStatement(sql);
		
		psmt.setInt(1, start);
		psmt.setInt(2, end);
		
		rs = psmt.executeQuery();
		
		while(rs.next()) {
			int i = 1;
			NoticeDto dto = new NoticeDto(rs.getInt(i++), 
										  rs.getString(i++), 
										  rs.getString(i++), 
										  rs.getString(i++), 
										  rs.getString(i++), 
										  rs.getInt(i++), 
										  rs.getInt(i++));
			list.add(dto);
					
		}
		
		System.out.println("getNoticePagingList Finally Success");
		
	} catch (SQLException e) {
		System.out.println("getNoticePagingList Failed");
		e.printStackTrace();
		
	} finally {
		DBClose.close(psmt, conn, rs);
	}
	
	return list;
	
		
	}
}
