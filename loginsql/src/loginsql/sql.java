package loginsql;

import com.mysql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

public class sql {
	private static Connection getConn() {

		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://192.168.1.102:3306/RUNOOB?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
		String username = "root";
		String password = "123456";
		Connection conn = null;
		try {
			Class.forName(driver); // classLoader,加载对应驱动
			conn = (Connection) DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	private static int insert(member student) {
		Connection conn = getConn();
		int i = 0;
		String sql = "INSERT INTO `member` (`name`, `password`) VALUES (?, ?)";
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			
			 pstmt.setString(1, student.getName());
             pstmt.setString(2,student.getPassword());
			 
             i = pstmt.executeUpdate();

			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	private static int update(member student) {
		Connection conn = getConn();
		int i = 0;
		String sql = "update member set Password='" + student.getPassword() + "' where Name='" + student.getName()
				+ "'";
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			i = pstmt.executeUpdate();
			System.out.println("resutl: " + i);
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	private static Integer getAll() {
		Connection conn = getConn();
		String sql = "select * from member";
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			int col = rs.getMetaData().getColumnCount();
			System.out.println("============================");
			while (rs.next()) {
				for (int i = 1; i <= col; i++) {
					System.out.print(rs.getString(i) + "\t");
					if ((i == 2) && (rs.getString(i).length() < 8)) {
						System.out.print("\t");
					}
				}
				System.out.println("");
			}
			System.out.println("============================");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private static int delete(String name) {
		Connection conn = getConn();
		int i = 0;
		String sql = "delete from member where name='" + name + "'";
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			i = pstmt.executeUpdate();
			System.out.println("resutl: " + i);
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public static void main(String args[]) {
		sql.getAll();
		sql.insert(new member("cdy", "1234"));
		sql.getAll();
		sql.delete("cd");

		sql.getAll();
	}
}