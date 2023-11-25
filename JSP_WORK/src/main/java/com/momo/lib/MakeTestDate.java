package com.momo.lib;

import java.sql.SQLException;

import com.momo.common.DBConnection;

/**
 * JDBC를 활용한 테스트 데이터를 생성
 * book 테이블에 테스트 데이터를 생성
 */
public class MakeTestDate extends DBConnection{
	
	/**
	 * book 테이블에 데이터를 삽입
	 */
	public void insert() {
		
		// 쿼리문 만들기
		String sql = "insert into book\r\n"
				+ "values (SEQ_BOOK_NUM.nextval, '책'||SEQ_BOOK_NUM.currval, \r\n"
				+ "        'N', '작가'||SEQ_BOOK_NUM.currval)";
		

		try {
			pstmt = con.prepareStatement(sql);

			// 입력 실행
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 입력되었습니다.");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	/**
	 * 자바 프로그램 실행
	 * @param args
	 */
	public static void main(String[] args) {
		MakeTestDate d = new MakeTestDate();
		for(int i = 0; i < 100; i++) {
			d.insert();
		}
		
		// 자원반납
		d.close();
	}
}
