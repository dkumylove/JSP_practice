package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.common.DBConnection;
import com.momo.dto.EmpDto;

import jakarta.servlet.ServletContext;

/**
 * 데이터 베이스에 접근해서 
 * 테이터 입력, 출력, 삭제, 조회 작업을 처리하는 객체
 * 
 * 현재는 마이바티스 많이 사용
 * Dao -> mapper
 */

public class EmpDao extends DBConnPool{
	
	/**
	 * 생서아를 이용하여 Connection 객체를 생성후
	 * 맴버변수인 con에 저장
	 * @param application
	 */
//	public EmpDao(ServletContext application) {
//		super(application);
//	}
//  주석처리하면 기본생성자 호출됨	
	/**
	 * 데이테베이스로부터 사원의 목록을 조회하여 반환
	 * 조회된 데이터를 반환(화면에 출력)하기 위해 리스트에 담아준다.
	 * @return
	 */
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
