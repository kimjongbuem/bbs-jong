package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// ������ ���̽� ���� ��ü�� ������ ! //
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
			conn = DriverManager.getConnection(dbURL,dbID, dbPassword); // jdbc ����̹� ����
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("������ �����ϴ�~");
		}
	}
	public int login(String userID, String userPassword) { // �α����Լ�.
		String SQL = "SELECT userPassword FROM USER WHERE userID= ?";
		try {
			pstmt = conn.prepareStatement(SQL); // sqL������ �ִ´�.
			pstmt.setString(1, userID); // �ʿ��� ������. ? 1��° �����ٰ� ���� �ִ´�.
			rs = pstmt.executeQuery();//��������
			if(rs.next()) { //�������� �ִ°�? �� ���̵� �־��°�?
				if(rs.getString(1).equals(userPassword)) // ���ǿ� �´� 1��° row���� �н����� ��
					return DatabaseState.SUCCESS; //����
				else
					return DatabaseState.INCOSISTENCY_PASSWORD; // ��й�ȣ ����
			}
			return DatabaseState.NOTFOUND_ID; //���̵� �����
		}catch(Exception e) {
			e.printStackTrace();
		}
		return DatabaseState.ERR; // ������
	}
}
