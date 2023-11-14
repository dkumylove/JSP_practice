package com.login.dao;

import java.sql.SQLException;

import com.login.common.DBConnPool;

public class HelloDao extends DBConnPool {
	
	/**
	 * DB로부터 현재시간을 조회후 반환한다.
	 * @return
	 */
	public String getTime() {
		String time = "";
		
		String sql ="select sysdate from dual";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				time = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("HelloDao.getTime()===SQLException 예외상황 발생");
			e.printStackTrace();
		}
		
		return time;
	}
}
