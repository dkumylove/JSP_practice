package com.login.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnPool {
	
	// con이 null인경우 예외발생 가능 : DB Connection 생성한 것을 변수에 저장하지 않았기 떄문
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	
	/**
	 * 생성자를 통해 Connection객체를 생성
	 */
	public DBConnPool() {
		
		
		try {
			// JNDI를 통해 커넥션 풀 얻어오기
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
			// 커넥션풀을 통해 연결 객체를 멤버 변수 con에 담아준다기
			con = ds.getConnection();
//			System.out.println("JNDI를 통해 커넥션 풀에서 커넥션 얻어오기 성공");
			
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("select sysdate from dual");
//			
//			if(rs.next()) {
//				System.out.println(rs.getString(1));
//			}
			
		} catch (NamingException e) {
			System.out.println("==========DBConnPool NamingException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("==========DBConnPool SQLException");
			e.printStackTrace();
		}
	}

	/**
	 * 연결해제(자원반납)
	 */
	public void close() {
		try {
			// null이 아니면 자원반납
			if(rs != null)rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			System.out.println("DBConnPool===자원반납 성공");
		} catch (SQLException e) {
			// 자원반납 중 예외발생
			System.out.println(this.getClass().getName());
			System.out.println("DBConnPool===자원반납 중 예외발생");
			e.printStackTrace();
		}
	}
}
