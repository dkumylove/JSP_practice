package com.momo.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class DBConnection {
	
	// con이 null인경우 예외발생 가능 : DB Connection 생성한 것을 변수에 저장하지 않았기 떄문
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;

	/**
	 * 생성자 - Connection 객체 생성
	 */
	public DBConnection() {
		try {
			// 1. 드라이버로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. DB연결에 필요 정보
			String url = "jdbc:oracle:thin:@localhost:1521:myoracle";
			String id = "test";
			String pw = "1234";
			
			// 2. DB Connection 생성
			// 꼭 변수에 저장해야함. 저장하지 않으면 con이 null이 되면서 예외발생
			con = DriverManager.getConnection(url, id, pw);
		
			System.out.println("DB 연결 성공(기본생성자)");
						
		} catch (ClassNotFoundException e) {
			// 드라이버 로딩실패시
			System.out.println("드라이버 로딩실패 - 라이브러리 확인 필요");
			e.printStackTrace();
		} catch (SQLException e) {
			// 객체생성 실패시
			System.out.println("Connection 객체 생성 실패/ SQLException 예외상황 발생");
			e.printStackTrace();
		}
	}

	/**
	 * 생성자1 - Connection 객체 생성(인수생성자 1)
	 */
	public DBConnection(String driver, String url, String id, String pw) {
		try {
			// 1. 드라이버로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. DB Connection 생성
			con = DriverManager.getConnection(url, id, pw);
		
			System.out.println("DB 연결 성공(인수생성자 1)");
						
		} catch (ClassNotFoundException e) {
			// 드라이버 로딩실패시
			System.out.println("드라이버 로딩실패 - 라이브러리 확인 필요");
			e.printStackTrace();
		} catch (SQLException e) {
			// 객체생성 실패시
			System.out.println("Connection 객체 생성 실패/ SQLException 예외상황 발생");
			e.printStackTrace();
		}
	}
	
	/**
	 * 생성자2 - Connection 객체 생성(application 내장객체를 활용한 Connection 생성)
	 */
	public DBConnection(ServletContext application) {
		String driver = application.getInitParameter("driver");
		String url = application.getInitParameter("url");
		String id = application.getInitParameter("id");
		String pw = application.getInitParameter("pw");
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("application 내장객체를 활용한 Connection 생성 ");
		} catch (ClassNotFoundException e) {
			// 드라이버 로딩실패시
			System.out.println("드라이버 로딩실패 - 라이브러리 확인 필요");
			e.printStackTrace();
		} catch (SQLException e) {
			// 객체생성 실패시
			System.out.println("Connection 객체 생성 실패/ SQLException 예외상황 발생");
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
