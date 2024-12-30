package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

import dto.CommuNoticeDto;

public class CommuNoticeDao {
	public static Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";	//"hr";	 오라클 계정
		String pw = "soomgo";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
//		System.out.println("<<DB접속 완료>>");
		return conn;
	}
	public void noticeInsert(int userIdx, String message, Integer commentsIdx, Integer chatIdx, Integer estimateIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql ="INSERT INTO notice(user_idx, message, notice_date, comments_idx, chat_idx, estimate_idx, read) " + 
				" VALUES(?, ?, sysdate, ?, ?, ?, 0)";    // 0 -> read가 0 이면 '안 읽음'.
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, userIdx);
		pstmt.setString(2, message);
		
		if(commentsIdx == null)
			pstmt.setNull(3, Types.INTEGER);
		else 
			pstmt.setInt(3, commentsIdx);
		
		if(chatIdx == null)
			pstmt.setNull(4, Types.INTEGER);
		else
			pstmt.setInt(4, chatIdx);

		if(estimateIdx == null)
			pstmt.setNull(5, Types.INTEGER);
		else
			pstmt.setInt(5, estimateIdx);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	public ArrayList<CommuNoticeDto> getNoticeList(int userIdx) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT n.user_idx,n.read, n.message, n.estimate_idx, n.comments_idx, n.chat_idx, n.notice_date, " + 
					"    (CASE  " + 
					"    WHEN n.estimate_idx IS NOT NULL THEN " + 
					"        (SELECT gi.name " + 
					"        FROM estimate e " + 
					"        INNER JOIN gosu_infor gi ON e.g_users_idx = gi.users_idx " + 
					"        WHERE e.estimate_idx = n.estimate_idx) " + 
					"    WHEN n.comments_idx IS NOT NULL THEN " + 
					"        (SELECT u.alias " + 
					"        FROM comments co " + 
					"        INNER JOIN users u ON co.users_idx = u.users_idx " + 
					"        WHERE co.comments_idx = n.comments_idx) " + 
					"    WHEN n.chat_idx IS NOT NULL THEN " + 
					"        (SELECT u.alias" + 
					"        FROM chat_contents cc " + 
					"        INNER JOIN users u ON cc.users_idx = u.users_idx " + 
					"        WHERE cc.chat_idx = n.chat_idx) " + 
					"    END) name, " + 
					"    (CASE " + 
					"    WHEN n.estimate_idx IS NOT NULL THEN " + 
					"        (SELECT s.title " + 
					"        FROM estimate e " + 
					"        INNER JOIN service s ON e.service_idx = s.service_idx " + 
					"        WHERE n.estimate_idx = e.estimate_idx) " + 
					"    WHEN n.estimate_idx IS NULL THEN null " + 
					"    END) svc_name " + 
					"FROM notice n " + 
					"WHERE n.user_idx = ? AND n.read = 0 " + 
					"ORDER BY n.notice_date DESC"; 
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, userIdx);
		
		ArrayList<CommuNoticeDto> noticeList = new ArrayList<CommuNoticeDto>();
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int read = rs.getInt("read");
			String message = rs.getString("message");
			int estimateIdx = rs.getInt("estimate_idx");
			int commentsIdx = rs.getInt("comments_idx");
			int chatIdx = rs.getInt("chat_idx");
			String noticeDate = rs.getString("notice_date");
			String name = rs.getString("name");
			String serviceName = rs.getString("svc_name");
//System.out.println("CNDao - name : " + name);
//System.out.println("CNDao - serviceName : " + serviceName);
			noticeList.add(new CommuNoticeDto(read, message, estimateIdx, commentsIdx, chatIdx, noticeDate, name, serviceName));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return noticeList;
	}
	
	public void noticeSetToRead(int userIdx) throws Exception{
		Connection conn = getConnection();
		
		String sql = "UPDATE notice SET read=1 WHERE read=0 AND user_idx=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, userIdx);
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
