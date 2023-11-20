package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.common.DBConnection;
import com.momo.dto.EmpDto;

import jakarta.servlet.ServletContext;



public class EmpDao extends DBConnPool{
	
//	public EmpDao(ServletContext application) {
//		super(application);
//	}
	

	// Emp 테이블이 가지고있는 데이터를 조회해서 List를 만듬
	public List<EmpDto> getList() {
		//List<타입> 변수명 = new ArrayList<>();
		List<EmpDto> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			String sql = "select * from employee";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				//System.out.println();
				// 콘솔에 출력하던 값을 화면에 출력
				EmpDto dto = new EmpDto();
				dto.setEmp_id(rs.getString(1));
				dto.setEmp_name(rs.getString(2));
				dto.setEmp_no(rs.getString(3));
				
				list.add(dto);
			}
			System.out.println("list 완성");
			
			// 자원반납
			close();
			
		} catch (SQLException e) {
			// 객체생성 실패시
			System.out.println("EmpDao.getList()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		return list;
	}
	
	public static void main(String[] args) {
		//EmpDao empDao = new EmpDao();
		//empDao.getList();
	}
	
}
