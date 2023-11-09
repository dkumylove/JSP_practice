package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.BoardDto;

// DBConnPool : 톰켓에서 제공해주는 기능을 사용하여 커넥션풀이라는 공간에 커넥션 객체를 미리 생성 해 놓고 사용하는 객체
// main 메소드 사용이 불가능, 서버기 실행되야 사용이 가능
// 만약 main메서드를 이용해서 테스트를 하고 싶다면 상속객객체를 DBConnection으로 교체
public class BoardDao extends DBConnPool{
	
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
