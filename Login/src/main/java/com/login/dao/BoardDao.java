package com.login.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.login.common.DBConnPool;
import com.login.dto.BoardDto;

/**
 * DB로부터 게시글을 조회, 입력, 수정, 삭제 처리한다.
 */
public class BoardDao extends DBConnPool {
	
	
	/**
	 * 게시글 삭제하기
	 * @param num : 삭제할 게시물 번호
	 * @return res : 삭제할 게시문의 수
	 */
	public int deleteBoard(String num) {
		int res = 0;
		
		// 쿼리문 작성
		String sql = "delete from board where num = ?";
		
		try {
			// 동적 쿼리사용하기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			// 쿼리 실행
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
	public int updeteVisitCount(String num) {
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
			System.out.println("BoardDao.updeteVisitCount()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	/**
	 * DB로부터 1건을 조회후 반환
	 */
	public BoardDto getOne(String num) {
		BoardDto dto = new BoardDto();
		
		// 쿼리문 만들기
		String sql = "select * from board where num = ?";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			// ? 값 넣어줌
			pstmt.setString(1, num);
			
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// dto에 담기
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("Content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
			}
			
		} catch (SQLException e) {
			System.out.println("BoardDao.getOne()===SQLException 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * DB로부터 리스트를 조회후 반환
	 * + 페이징 처리
	 */
	public List<BoardDto> getList(int startNum, int endNum) {
		
		List<BoardDto> list = new ArrayList<>();
		
//		String sql = "select num, title, content, id, "
//				+ "to_char(postdate, 'yyyy-mm-dd') postdate, visitcount "
//				+ "from board "
//				+ "order by num desc";
		
		String sql = "select *\r\n"
				+ "	  from (select rownum rnum, b.*\r\n"
				+ "  	    from ( select *\r\n"
				+ "  	           from board\r\n"
				+ "  	           order by num desc) b )\r\n"
				+ "	  where rnum between ? and ?";
		
		//DB로 부터 게시글의 목록을 조회하여 list에 담아 반환한다.
		try {
			pstmt = con.prepareStatement(sql);
			// 시작번호 = 끝번호- ( 페이지당 게시물 수 - 1)
			pstmt.setInt(1, startNum);
			// 끝번호 = 페이지 번호 * 페이지당 게시물수
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String num = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String postdate = rs.getString("postdate");
				String visitcount = rs.getString("visitcount");
				
				BoardDto dto = new BoardDto(num, title, content, id, postdate, visitcount);
				
				list.add(dto);
			}
		
		} catch (SQLException e) {
			System.out.println("BoardDao.getList()===SQLException 예외 발생");
			e.printStackTrace();
		}
		
		return list;
	}

}
