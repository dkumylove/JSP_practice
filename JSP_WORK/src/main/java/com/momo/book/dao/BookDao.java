package com.momo.book.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.Criteria;
import com.momo.lib.dto.BookDto;

/**
 * DB에 접근하여 쿼리를 질의한다.
 */
public class BookDao extends DBConnPool {
		
	/**
	 * 도서목록을 조회후 리스트를 반환
	 * @return
	 */
	public List<BookDto> getList(Criteria cri){
		
		List<BookDto> list = new ArrayList<>();
		
		String sql = "select *\r\n"
					+ "   	  from book\r\n"
					+ "   	  order by no desc";
		
		try {
			// pageingQuery
			sql = pageingQuery(sql);
			// 쿼리 출력
			System.out.println("sql\n" + sql);
			
			pstmt = con.prepareStatement(sql);
			// 페이지 파라미터 세팅
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			// 쿼리실행
			rs = pstmt.executeQuery();
			
			// 결과집합으로부터 도서의 정보를 가지고와서 dto에 저장 후 리스트에 담아줍니다
			while(rs.next()) {
				
				String no = rs.getString("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String rentyn= rs.getString("rentyn");
				
				BookDto dto = new BookDto(no, title, author, rentyn);
				list.add(dto);
			}
			System.out.println("====" + list);
			
		} catch (SQLException e) {
			System.out.println("BookDao.getList()==SQLException 예외 발생");
			e.printStackTrace();
		}
		return list;
	}
	
	
	/**
	 * 도서의 상세 정보를 조회 후 반환 합니다.
	 * @param no
	 * @return 도서정보(BookDto)
	 */
	public BookDto view(String no) {
		
		BookDto dto = new BookDto();
		
		String sql = "select * from book where no = ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			// ?의 갯수만큼 파라미터를 설정 합니다.
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getString("no"));
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setRentyn(rs.getString("rentyn"));
			}
		} catch (SQLException e) {
			System.out.println("BookDao.view()==SQLException 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	/**
	 * 도서의 총 건수를 조회후 반환
	 * - 집게 함수를 이용하여 게시글의 총건수를 구한다.
	 * @return 도서의 총 건수
	 */
	public int getTotalCnt() {
		
		int res = 0;

		String sql = "select count(*) from book ";
		
		System.out.println("sql : " + sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("BookDao.getTotalCnt()===SQLException 예외 발생");
			e.printStackTrace();
		}
		
		return res;
	}
	
}

