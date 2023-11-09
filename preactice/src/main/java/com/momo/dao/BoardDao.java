package com.momo.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.BoardDto;

public class BoardDao extends DBConnPool {
	
	// 게시판 리스트 만들기
	public List<BoardDto> getList() {
		
		List<BoardDto> list = new ArrayList<>();
		
		String sql = "select * from board";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));				
				dto.setVisitcount(rs.getString("visitcount"));
				
				list.add(dto);
			}
			System.out.println("====" + list);
			return list;
			
		} catch (SQLException e) {
			System.out.println("========SQLException 예외 발생");
			e.printStackTrace();
		}
		
		return list;
	}
}
