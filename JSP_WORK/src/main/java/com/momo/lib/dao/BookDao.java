package com.momo.lib.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.lib.dto.BookDto;

/**
 * DB에 접근하여 쿼리를 질의한다.
 * 
 */
public class BookDao extends DBConnPool {
	
	/**
	 * 도서목록을 조회후 리스트를 반환
	 * @return
	 */
	public List<BookDto> getList(){
		
		List<BookDto> list = new ArrayList<>();
		
		String sql = "select * from book";
		
		try {
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			
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
	
	
}
