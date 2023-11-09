package com.momo.dao;

import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.dto.MemberDto;

public class MemberDao extends DBConnPool {
	
	// login() 메소드 만들기
	public MemberDto login(String id, String pw) {
		
		MemberDto memberDto = new MemberDto();
		
		String sql ="select *\r\n"
				+ "from member\r\n"
				+ "where id = ? and pass = ?";
		
		try {
			// 입력받은 사용자 정보를 DB로부터 조회
			pstmt = con.prepareStatement(sql);
			
			// ? 를 값으로 변환, 파라미터 세팅
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 로그인성공
				memberDto.setId(rs.getString(1));
				memberDto.setName(rs.getString(2));
				memberDto.setRegidate(rs.getString(4));
				
				// 사용자 정보를 MemberDto 객체에 담아서 반환
				System.out.println("=== 로그인성공");
				return memberDto;
				
			} else {
				// 로그인실패
				return null;
			}
			
			
		} catch (SQLException e) {
			System.out.println("SQLException 예외상황 발생");
			e.printStackTrace();
		}
		return null;
	}
	
}
