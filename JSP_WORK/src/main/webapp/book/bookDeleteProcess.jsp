<%@page import="com.momo.book.dao.BookDao"%>
<%@page import="com.momo.utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<%
		BookDao dao = new BookDao();
		if(request.getParameter("no") != null){
			String num = request.getParameter("no");
			if(dao.deleteBook(num) != 1) {
				JSFunction.alertBack("존재하지 않는 도서목록입니다.", out);
			}
			// 정상적으로 삭제처리가 된 경우
			// 메시지 처리후 리스트 페이지로 이동 합니다.
			JSFunction.alertLocation("삭제되었습니다.", "/book/list", out);
			
		} else {
			/*
			out.print("<script type='text/javascript'>");
			// 메시지 출력후 이전페이지로 이동
			out.print("alert('게시물번호(num)을 확인할수 없습니다.');");
			// 뒤로가기
			out.print("history.back()");
			out.print("</script>");
			*/
			
			JSFunction.alertBack("도서목록(no)을 확인할수 없습니다.", out);
		}
		
	%>
	

</body>
</html>