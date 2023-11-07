<%@page import="com.momo.dto.EmpDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.EmpDao"%>
<%@page import="com.momo.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>JDBC 테스트 1</h2>
	<% 
	
		// Connection 객체 생성
		DBConnection dbcon = new DBConnection();
		dbcon.stmt = dbcon.con.createStatement();
		
		// 쿼리문장 준비
		dbcon.rs = dbcon.stmt.executeQuery("select sysdate from dual");
		
		// 쿼리문장실행
		dbcon.rs.next();
		out.print("데이터베이스 시간 : " + dbcon.rs.getString(1));
		
		// 자원반납
		dbcon.close();
		
		out.print("<br>init param : " + application.getInitParameter("INIT_PARAM"));
		out.print("<br>init param : " + application.getInitParameter("driver"));
		out.print("<br>init param : " + application.getInitParameter("url"));
		out.print("<br>init param : " + application.getInitParameter("id"));
		out.print("<br>init param : " + application.getInitParameter("pw"));
	
	%>
	
	<hr>
	<h2>JDBC 테스트2</h2>
	<% 
	
		// Connection 객체 생성
		DBConnection dbcon2 = new DBConnection(
									application.getInitParameter("driver")
									, application.getInitParameter("url")
									, application.getInitParameter("id")
									, application.getInitParameter("pw")
								);
	
		// 자원반납
		dbcon2.close();
	
	%>
	
	<hr>
	<h2>JDBC 테스트3</h2>
	<% 
		
		// Connection 객체 생성
		DBConnection dbcon3 = new DBConnection(application);
	
		// 자원반납
		dbcon2.close();
	
	%>
	
	<hr>
	<h2>empDao.getList()</h2>
	<% 
		
		EmpDao empDao = new EmpDao(application);
		List<EmpDto> list = empDao.getList();
		
		//out.print(list);
		
		for(EmpDto dto : list){
			//out.print(dto + "<br>");
			dto.getEmp_id();
			dto.getEmp_name();
			dto.getEmp_no();
		}
		
	%>
		
	<hr>
	<table border="1">
		<tr>
			<td>사원ID</td>
			<td>사원명</td>
			<td>주민번호</td>
		</tr>

	
	<% 
	for(EmpDto dto : list){
		
	%>	
		<tr>
			<td><%=dto.getEmp_id() %></td>
			<td><%=dto.getEmp_name() %></td>
			<td><%=dto.getEmp_no() %></td>
		</tr>
	<%
	}
	%>
	</table>
</body>
</html>