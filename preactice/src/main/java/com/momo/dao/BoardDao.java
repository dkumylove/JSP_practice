package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.BoardDto;

public class BoardDao extends DBConnPool {
	
	/**
	 * 
	 */
//	public int insertBoard(BoardDto dto) {
//	
//}
	
	/**
	 * 게시글 삭제하기
	 */
	public int deleteBoard(String num) {
		String sql = "delete from board where num = ?";
		
		int res = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("BoardDao.deleteBoard()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	/**
	 * 게시글의 조회수를 1증가 시켜준다.
	 * insert, update, delete 의 반환 타입은 int(몇건의 처리 되었는지 반환)
	 * 반환타입은 int로 설정
	 */
	public int visitcountUp(String num) {
		// 원래는 int로 받아야 하지만 오류나는게 시르면 void로 반환가능
		String sql = "update board\r\n"
				+ "set visitcount = visitcount+1\r\n"
				+ "where num = ? ";
		
		int res = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			// ? 개수 만큼 만들면 됨, 1번쨰 ? 값은 num
			pstmt.setString(1, num);
			
			res = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("BoardDao.visitcountUp()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 한건 게시글을 조회후 반환
	 * @return BoardDto
	 */
	public BoardDto getOne(String num) {
		BoardDto dto = new BoardDto();
		
		String sql = "select * from board where num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDto();
				dto.setTitle(rs.getString("Title"));
				dto.setContent(rs.getString("Content"));
				dto.setId(rs.getString("Id"));
				dto.setPostdate(rs.getString("Postdate"));
				dto.setVisitcount(rs.getString("Visitcount"));
			}
			return dto;
			
		} catch (SQLException e) {
			System.out.println("BoardDao.getOne()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 게시글 목록을 반환
	 * @return 
	 */
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
			System.out.println("BoardDao.getList()===SQLException 예외 발생");
			e.printStackTrace();
		}
		
		return list;
	}
}
