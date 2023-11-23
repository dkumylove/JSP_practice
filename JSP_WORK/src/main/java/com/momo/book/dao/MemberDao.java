package com.momo.book.dao;

import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.dto.MemberDto;

public class MemberDao extends DBConnPool{

	/**
	 * 회원가입
	 * @return
	 */
	public int register(String id, String pw, String name, String email) {
		MemberDto memberDto = new MemberDto();
		
		int res = 0;
		
		String sql = "insert into member (id, pass, name, regidate, email)\r\n"
				+ "            values (?, ?, ?, sysdate, ?)";
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			res = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("MemberDao.register()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		return res;
		
	}
}
