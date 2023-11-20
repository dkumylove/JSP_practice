package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnection;
import com.momo.dto.Job;

import jakarta.servlet.ServletContext;

/**
 * Dao
 * 데이터 액세스 객체(Data Access Object)
 * 
 * 데이터베이스와의 상호작용을 관리하고 데이터베이스에서 데이터를 읽고 쓰는 데 사용
 * 
 * Dto
 * 데이터 전송 객체(Data Transfer Object)
 * 
 * 데이터를 전송하거나 전달하기 위해 사용되는 객체
 */

public class JobDao extends DBConnection{
	
	// 생성자
	public JobDao(ServletContext application) {
		super(application);
	}
	
	/**
	 * job테이블의 내용을 조회수 리스트에 담아서 반환
	 * @return
	 */
	// 메소드 선언
	public List<Job> getList(){
		List<Job> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from job");
			while(rs.next()) {
				Job job = new Job();
				job.setJobCode(rs.getString(1));
				job.setJobName(rs.getString(2));
				
				list.add(job);
			}
		} catch (SQLException e) {
			System.out.println("JobDao.getList()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		
		return list;
	}
	
}
