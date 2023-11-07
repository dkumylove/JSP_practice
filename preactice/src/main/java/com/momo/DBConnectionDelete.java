package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionDelete {

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:myoracle";
		String id = "test";
		String pw = "1234";
		
		Connection conn = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("오라클드라이버 확인");
			
			// 2. 커낵션생성
			conn = DriverManager.getConnection(url, id, pw);
			
			// 3. 쿼리생성
			String sql = "delete from job where job_code = ?";
			
			// 4. pstmt 객체 생성 (동적일때 사용)
			// 처음에 꺼내올떄 sql문을 진행/ 실행할떄 sql문 안넣음
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			// 5. 인파라미터 세팅
			// 쿼리상에 ?로 작성된 부분을 값으로 변경
			pstmt.setString(1, "99");
		
			
			// stmt.executeQuery(sql);
			// 	select 문장을 실행 할 경우 ResultSet을 반환
			// stmt.executeUpdate(sql);
			// update, insert, delete 의 경우 int타입을 반환 한다.
			//          -> 실행결과 몇건이 처리되었는지
			
			// 6. 쿼리 생힝
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 삭제되었습니다.");
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}
		
	}

}
