package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// 데이터 베이스 접근 객체를 만들자 ! //
public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3307/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "4010kjbv";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID, dbPassword); // jdbc 드라이버 연결
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("에러가 났습니당~");
		}
	}
	public int login(String userID, String userPassword) { // 로그인함수.
		String SQL = "SELECT userPassword FROM USER WHERE userID= ?";
		try {
			pstmt = conn.prepareStatement(SQL); // sqL문장을 넣는다.
			pstmt.setString(1, userID); // 필요한 값지정. ? 1번째 값에다가 값을 넣는다.
			rs = pstmt.executeQuery();//쿼리실행
			if(rs.next()) { //다음행이 있는가? 즉 아이디가 있었는가?
				if(rs.getString(1).equals(userPassword)) // 조건에 맞는 1번째 row에서 패스워드 비교
					return DatabaseState.SUCCESS; //성공
				else
					return DatabaseState.INCOSISTENCY_PASSWORD; // 비밀번호 오류
			}
			return DatabaseState.NOTFOUND_ID; //아이디가 없어요
		}catch(Exception e) {
			e.printStackTrace();
		}
		return DatabaseState.ERR; // 디비오류
	}
}
