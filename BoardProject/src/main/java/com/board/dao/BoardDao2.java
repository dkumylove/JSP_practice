package com.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.board.DBConnPool;
import com.board.dto.BoardDto;

/**
 * DB에 접근해서 데이터에 대한 입력, 수정, 삭제, 조회
 */
public class BoardDao2 extends DBConnPool{
	
	public BoardDto getOne(String num) {
		BoardDto dto = new BoardDto();
		
		// 쿼리문 만들기
		String sql = "select * from board where num = ?"; 
	
		// ? 값 넣어줌
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			// 쿼리실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("content"));
				dto.setContent(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				// join을 이용해서 다른 테이블의 데이터를 함꼐 조회해올 경우,
				// dto에 담기 위해 컬럼을 추가 할수 있다.
				dto.setName(rs.getString("name"));
			}
		
		} catch (SQLException e) {
			System.out.println("BoardDao2.getOne()===SQLException 예외 발생");
			e.printStackTrace();
		}
		// 값출력
		return dto;
	}
	
	
	/**
	 * DB로로부터 리스틑를 조회 반환
	 */
	public List<BoardDto> getList() {
		List<BoardDto> list = new ArrayList<>();
		
		String sql = "select b.*, m.name\r\n"
				+ "from board b, member m\r\n"
				+ "where b.id = m.id";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardDto dto = new BoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("content"));
				dto.setContent(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				// join을 이용해서 다른 테이블의 데이터를 함꼐 조회해올 경우,
				// dto에 담기 위해 컬럼을 추가 할수 있다.
				dto.setName(rs.getString("name"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("BoardDao2.getList()===SQLException 예외 발생");
			e.printStackTrace();
		}
		
		return list;
	}
}
