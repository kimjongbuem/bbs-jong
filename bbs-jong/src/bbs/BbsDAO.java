package bbs;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; // 외부 라이브러리 추가
public class BbsDAO {
		private Connection conn;
		private ResultSet rs;
		
		public BbsDAO()
		{
			try {
				System.out.println("Test Start!");
				String dbURL ="jdbc:mysql://localhost:3307/BBS?characterEncoding=UTF-8&serverTimezone=UTC"; // mysql ... ->
				String dbID="root";
				String dbPassword = "4010kjbv";
				Class.forName("com.mysql.cj.jdbc.Driver");	//Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("fail");
			}
		}
		public String getDate() {
			String SQL = "SELECT NOW()";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return "";
		}
		
		public int getNext() {
			String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; // 첫번째 게시물경우
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1;// 데이터베이스 오류
		}
		
		public int write(String bbsTitle, String userID, String bbsContent) {
			String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
			try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
			return -1;// 데이터베이스오류
		}
}
