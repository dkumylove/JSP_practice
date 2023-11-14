package com.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.board.DBConnPool;
import com.board.dto.BoardDto;

public class BoardDao extends DBConnPool  {
	
	public BoardDto getOne(String num) {
		BoardDto dto = new BoardDto();
		
		// 쿼리문 만들기
		String sql = "select * from board where num = ?"; 
	
		try {
			// ? 값 넣어줌/ ? 이용한 인파라미터를 사용할수 있다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			// 쿼리실행
			rs = pstmt.executeQuery();
			
			// dto에 담기
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("content"));
				dto.setContent(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
			
			}
		
		} catch (SQLException e) {
			System.out.println("BoardDao.getOne()===SQLException 예외 발생");
			e.printStackTrace();
		}
		// 값출력
		return dto;
	}

	/**
	 * DB로부터 리스트를 조회후 반환
	 */
	public List<BoardDto> getList() {
		List<BoardDto> list = new ArrayList<>();
		
		// 쿼리 정의
		String sql = "select * from board";
		
		// 인파라미터를 설정할 수 있으므로 쿼리 실행전 sql문장을 세팅
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 다음행이 있는지 확인
			while(rs.next()) {
				
				// dto에 담아서 리스트(여러행이므로)로 반환
				BoardDto dto = new BoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title")); 
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				// list에 답기
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("BoardDao.getList()===SQLException 예외발생");
			e.printStackTrace();
		}
		
		return list;
	}
}
