package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;

// DBConnPool : 톰켓에서 제공해주는 기능을 사용하여 커넥션풀이라는 공간에 커넥션 객체를 미리 생성 해 놓고 사용하는 객체
// main 메소드 사용이 불가능, 서버기 실행되야 사용이 가능
// 만약 main메서드를 이용해서 테스트를 하고 싶다면 상속객객체를 DBConnection으로 교체
public class BoardDao extends DBConnPool{
	
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
				// 데이터를 dto에 저장
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
	 * + 페이징 처리
	 * @param endNum 
	 * @param startNum 
	 * @return List<BoardDto>
	 */
	public List<BoardDto> getList(Criteria cri) {
		
		List<BoardDto> list = new ArrayList<>();
		
//		String sql = "select num, title, content, id, "
//		+ "to_char(postdate, 'yyyy-mm-dd') postdate, visitcount "
//		+ "from board "
//		+ "order by num desc";
		
		String where = "";
		
		// 검색어와 검색 필드에 값이 들어 있다면 조건 문장을 생성
		if(!"".equals(cri.getSearchField()) && !"".equals(cri.getSearchWord())) {
			where = " where " + cri.getSearchField() 
						+ " like '%" + cri.getSearchWord() + "%'";
		}
		
		System.out.println("where : " + where);
		
		String sql = "select *\r\n"
				+ "	  from (select rownum rnum, b.*\r\n"
				+ "  	    from ( select *\r\n"
				+ "  	           from board\r\n"
				+ where
				+ "  	           order by num desc) b )\r\n"
				+ "	  where rnum between ? and ?";
		
		//DB로 부터 게시글의 목록을 조회하여 list에 담아 반환한다.
		try {
			pstmt = con.prepareStatement(sql);
			// 시작번호 = 끝번호- ( 페이지당 게시물 수 - 1)
			pstmt.setInt(1, cri.getStartNum());
			// 끝번호 = 페이지 번호 * 페이지당 게시물수
			pstmt.setInt(2, cri.getEndNum());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 데이터를 dto에 저장
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
	
	/**
	 * 게시물의 총 건수를 조회후 반환
	 * - 집게 함수를 이용하여 게시글의 총건수를 구한다.
	 * @return 게시글의 총 건수
	 */
	public int getTotalCnt(Criteria cri) {
		
		int res = 0;
		
		String where = "";
		
		// 검색어와 검색 필드에 값이 들어 있다면 조건 문장을 생성
		if(!"".equals(cri.getSearchField()) && !"".equals(cri.getSearchWord())) {
			where = "where " + cri.getSearchField() 
						+ " like '%" + cri.getSearchWord() + "%'";
		}
		
		String sql = "select count(*) from board " + where;
		
		System.out.println("sql : " + sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("BoardDao.getTotalCnt()===SQLException 예외 발생");
			e.printStackTrace();
		}
		
		return res;
	}
}
