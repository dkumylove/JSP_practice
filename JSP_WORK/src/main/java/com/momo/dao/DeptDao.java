package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnection;
import com.momo.dto.DeptDto;

import jakarta.servlet.ServletContext;
/**
 * DAO(Data Access Object)
 * DB로부터 데이터를 CRUD작업을 처리하는 객체
 */
public class DeptDao extends DBConnection{
	
	// 생성자를 통해서 Connection객체를 생성후 멤버 변수 con에 저장
	public DeptDao(ServletContext application) {
		// application으로부터 
		super(application);
	}
	
	public List<DeptDto> getList() {
		List<DeptDto> list = new ArrayList<>();
		
		String sql = "select * \r\n"
				+ "from department d, location l\r\n"
				+ "where d.location_id = l.local_code";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				DeptDto dto = new DeptDto();
				dto.setDept_id(rs.getString("dept_id"));
				dto.setDept_title(rs.getString("dept_title"));
				dto.setLocal_code(rs.getString("local_code"));
				dto.setLocal_name(rs.getString("local_name"));
				dto.setLocation_id(rs.getString("location_id"));
				dto.setNational_code(rs.getString("national_code"));
				
				list.add(dto);
			}
			// 자원반납
			close();
			
		} catch (SQLException e) {
			System.out.println("DeptDao.getList()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		
		return list;
	}
	
}
