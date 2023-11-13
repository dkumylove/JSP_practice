package com.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ojdbc를 이용하여 DB접근하고 커넥션을 얻어 온다.
 * 라이브러리 잘 설치되어 잘 로딩이 되는지 확인페이지
 */
public class DBConnection {
	
	public static void main(String[] args) {
		
		// DB연결에 필요 정보
		// jdbc:oracle:thin:@아이피:포트:SID
		String url = "jdbc:oracle:thin:@localhost:1521:myoracle";
		String id = "test";
		String pw = "1234";
		
		try {
			// 1. 드라이버 로딩 - ojdbc6
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. DB Connection 생성
			// 데이터베이스에 접근후 인증과정을 거쳐 커넥션을 얻어옴
			Connection con = DriverManager.getConnection(url, id, pw);
			
			// 쿼리를 질의하기 위해 필요한 객체를 생성
			Statement stmt = con.createStatement();
			
			// 쿼리실행
			// select - ResultSet
			// insert, delete, update - int
			ResultSet rs= stmt.executeQuery("select sysdate from dual");
			
			rs.next();
			System.out.println("현재시간 : " + rs.getString(1));
			
		} catch (ClassNotFoundException e) {
			// 드러이버 로딩 실패시
			System.out.println("드라이버 로딩실패 - 라이브러리 확인 필요");
			e.printStackTrace();
		} catch (SQLException e) {
			// 객체생성 실패시
			System.out.println("Connection 객체 생성 실패===SQLException 예외상황 발생");
			e.printStackTrace();
		}
	}
}
