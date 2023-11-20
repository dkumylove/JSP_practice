package com.momo.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * main 메소드로 실행되는 곳에서 사용할떄 문제 발생
 * 톰켓을 사용하여 실행하기 때문에 서버가 실행이 되지 않으면 실행 안됨
 */

public class DBConnPool {
	
	// con이 null인경우 예외발생 가능 : DB Connection 생성한 것을 변수에 저장하지 않았기 떄문
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
		
	/**
	 * 생성자, 예외처리
	 */
	public DBConnPool() {
			 
		try {
			// JNDI를 통해 커넥션 풀 얻어오기
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
			// 커넥션을 통해 연결 객체를 멤버변수 con에 담아준다
			con = ds.getConnection();
			System.out.println("JNDI를 통해 커넥션 풀에서 커넥셔 얻어오기");
			
		} catch (NamingException e) {
			System.out.println("=============DBConnPool NamingException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("=============DBConnPool SQLException");
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
			System.out.println("자원반납 성공");
		} catch (SQLException e) {
			// 자원반납 중 예외발생
			System.out.println("자원반납 중 예외발생");
			e.printStackTrace();
		}
	}
}
