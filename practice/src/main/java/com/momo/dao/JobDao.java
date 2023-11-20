package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnection;
import com.momo.dto.Job;

import jakarta.servlet.ServletContext;

public class JobDao extends DBConnection{
	
	// 생성자
	public JobDao(ServletContext application) {
		super(application);
	}

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
