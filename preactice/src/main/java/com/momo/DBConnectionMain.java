package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionMain {

	public static void main(String[] args) {
		/*
		 * 1. 드라이버 로딩
		 * 		DB에 접근하기 위해 필요한 라이브러리가 있는지 확인
		 * 
		 * 2. 커넥션 객체를 생성(얻어온다)
		 * 
		 * */ 
		
		String url = "jdbc:oracle:thin:@localhost:1521:myoracle";
		String id = "test";
		String pw = "1234";
		
		
		// 쿼리를 커넥션 객체를 얻어오기 위한 Connection 연결
		// 1. 드라이버 로딩
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("오라클드라이버 확인");
			// 2. 커넥션 생성
			Connection con= DriverManager.getConnection(url, id, pw);
			// 3. 쿼리문장 준비
			String sql = "select sysdate from dual";
			
			// 4. 쿼리문장실행
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			// 숫자를 입력시 1부터
			// 숫자 또는 결과집합의 컬럼명 SYSDATE
			System.out.println(rs.getString(1));
			
		} catch (ClassNotFoundException e) {
			// 드라이브 로딩실패시
			System.out.println("드라이버 로딩실패 - 라이브라리가 등록되었는지 확인해주세요.");
			e.printStackTrace();
		} catch (SQLException e) {
			// Connection 객체 생성 실패시
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}
		
	}

}
