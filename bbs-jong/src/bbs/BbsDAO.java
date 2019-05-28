package bbs;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; // 외부 라이브러리 추가
import java.util.ArrayList;
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
		public ArrayList<Bbs> getList(int pageNumber){ // 특정한 페이지에 따른 10개;
			String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
			ArrayList<Bbs> list = new ArrayList<>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,getNext() - (pageNumber - 1)*10);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Bbs bbs= new Bbs();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					list.add(bbs);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
		}
		public boolean nextPage(int pageNumber) { // 페이징 처리위 한 함수
			String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,getNext() - (pageNumber - 1)*10);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return false;
		}
		public Bbs getBbs(int bbsID) {
			String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,bbsID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					Bbs bbs= new Bbs();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					return bbs;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
}
