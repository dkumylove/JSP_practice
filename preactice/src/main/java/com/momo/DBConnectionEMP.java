package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionEMP {

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
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// 쿼리를 커넥션 객체를 얻어오기 위한 Connection 연결
		// 1. 드라이버 로딩
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("오라클드라이버 확인");
			// 2. 커넥션 생성
			con = DriverManager.getConnection(url, id, pw);
			// 3. 쿼리 문장 준비
			String sql = "select emp_id, emp_name, emp_no from employee";
			
			// 4. 쿼리 문장 실행
			stmt = con.createStatement();
			
			// stmt.executeQuery(sql);
			// 	select 문장을 실행 할 경우 ResultSet을 반환
			// stmt.executeUpdate(sql);
			// update, insert, delete 의 경우 int타입을 반환 한다.
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				// 숫자를 입력시 1부터
				// 숫자 또는 결과집합의 컬럼명 SYSDATE
				System.out.print(rs.getString("emp_id") + " ");
				System.out.print(rs.getString("emp_name")+ " ");
				System.out.println(rs.getString("emp_no"));
//				System.out.print(rs.getString(1) + " ");
//				System.out.print(rs.getString(2) + " ");
//				System.out.println(rs.getString(3));
			}
			
		} catch (ClassNotFoundException e) {
			// 드라이브 로딩실패시
			System.out.println("드라이버 로딩실패 - 라이브라리가 등록되었는지 확인해주세요.");
			e.printStackTrace();
		} catch (SQLException e) {
			// Connection 객체 생성 실패시
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		} finally {
			// 자원닫기(예외발생할수 있기떄문에 예외처리)
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch(Exception e) {
				System.out.println("자원해제 중 예외상황이 발생하였습니다.");
				e.printStackTrace();
			}
			
		}
		
	}

}
