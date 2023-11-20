package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.momo.dto.Job;

public class DBConnectionSelf {

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:myoracle";
		String id = "test";
		String pw = "1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<Job> list = new ArrayList<>();
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 확인");
			
			// 2. 커넥션 생성
			con = DriverManager.getConnection(url, id, pw);
			
			// 3. 쿼리 문장 준비
			String sql = "select * from job";
			
			// 4. 쿼리 문장 실행
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			// 5. 반복문을 통해 출력
			while(rs.next()) {
				Job job = new Job();
				job.setJobCode(rs.getString("job_code"));
				job.setJobName(rs.getString("job_name"));
				System.out.print(rs.getString("job_code") + " ");
				System.out.println(rs.getString("job_name"));
				
				list.add(job);
			}
			System.out.println("=================");
			System.out.println(list);
			
		} catch (ClassNotFoundException e) {
			// 드라이브 로딩 실패
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			// 객채 생성 실패
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		} finally {
			// 닫기
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
				
			} catch (SQLException e) {
				System.out.println("자원해제 중 예외상황이 발생하였습니다.");	
				e.printStackTrace();
			}
			
		}

	}

}
