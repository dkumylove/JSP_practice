package com.board;

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
 * 톰켓으로부터 제공받는 기능이므로 서버를 실행 후 테스트 할수 있다.
 * - main 메소드를 이용한 실행이 불가능
 */
public class DBConnPool {
	
	// DB에 접근하기 위해 필요한 데이터
	// -> 리소스에 정의(context.xml)
	
	// DB에 접근하여 쿼리를 질의하기위해 필요한 객체
	// 접근제한자 설정 안하면 기본 디폴트로 설정됨. 다른 페지키에서 사용 못함
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	/**
	 * 생성자, 예외처리
	 * 생성자를 이용하여 커넥션 객체를 얻어옴
	 */
	public DBConnPool() {
		
		try {
			// JNDI를 통해 커넥션 풀 얻어오기
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
			// 커넥션풀을 통해 연결 객체를 멤버 변수 con에 담아준다기
			con = ds.getConnection();
			System.out.println("JNDI를 통해 커넥션 풀에서 커넥션 얻어오기");
			
		} catch (NamingException e) {
			System.out.println("DBConnPool.NamingException===jdbc/myoracle를 찾을수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DBConnPool===SQLException 예외 발생");
			e.printStackTrace();
		}

	}
	/**
	 * 자원반납, 예외처리
	 */
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			System.out.println("자원반납 실패");
			e.printStackTrace();
		}
	}
}
