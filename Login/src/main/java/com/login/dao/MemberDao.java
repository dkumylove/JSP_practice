package com.login.dao;

import java.sql.SQLException;

import com.login.common.DBConnPool;
import com.login.dto.MemberDto;

public class MemberDao extends DBConnPool {
	
	/**
	 * id,pw를 전달받아 DB에 등록된 사용자가 있는지 조회후 MemberDto 반환
	 * @param id
	 * @param pw
	 * @return
	 */
	public MemberDto login(String id, String pw) {
		MemberDto dto = null;
		
		String sql = "select * "
				+ "from member "
				+ "where id = ? and pass = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
//				dto.setId(rs.getString(1));
//				dto.setPass(rs.getString(2));
				
				//String id = rs.getString(id);
				String name = rs.getString("name");
				String regidate = rs.getString("regidate");
				
				// 로그인성공시 MemberDto객체를 생성후 반환
				dto = new MemberDto(id, name, regidate);
				return dto;
				
			} else {
				// 로그인실패
				return null;
			}
			
		} catch (SQLException e) {
			System.out.println("MemberDao.login()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		return null;
	}
}
