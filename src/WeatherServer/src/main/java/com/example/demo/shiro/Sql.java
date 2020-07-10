
package com.example.demo.shiro;

import com.example.demo.enity.User;

import java.sql.*;

public class Sql {
	private static Connection getConn() {

		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/RUNOOB?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
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
    public static boolean exist(String username) throws SQLException {
    	Connection conn = getConn();
		String sql = "select * from member";
		String name;
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				name=rs.getString("name");
				if(name.equals(username)) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
    }
    public static boolean passwordIsRight(String username,String pw) {
    	Connection conn = getConn();
		String sql = "select * from member";
		String name;
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				name=rs.getString("name");
				if(name.equals(username)) {
					if(pw.equals(rs.getString("password"))) {
						return true;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
    }
	public static int insert(User user) {
		Connection conn = getConn();
		int i = 0;
		String sql = "INSERT INTO `member` (`name`, `password`) VALUES (?, ?)";
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			
			 pstmt.setString(1, user.getUsername());
             pstmt.setString(2,user.getPassword());
			 
             i = pstmt.executeUpdate();

			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	private static int update(User user) {
		Connection conn = getConn();
		int i = 0;
		String sql = "update member set Password='" + user.getPassword() + "' where Name='" + user.getUsername()
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

	public static void main(String args[]) throws SQLException {
		Sql.exist("cdy1");
		User user=new User();
		user.setUsername("lpy");
		user.setPassword("1234");
		System.out.println(Sql.insert(user));;
	}

}