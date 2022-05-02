<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% //jdbc 드라이버 로딩 
String driverClass = "mysql-connector-java-8.0.28.jar";

try {
	Class.forName(driverClass);
	out.print("JDBC 드라이버 로딩 성공!<br>");
}catch (ClassNotFoundException err){
	out.println("JDBC Driver loading 실패!!...WEB-INF/lib 폴더 확인<br>");
}

//MariaDB 연결
String url = "jdbc:mariadb://localhost:3306/";
String id = "root";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;

try{
conn = DriverManager.getConnection(url, id, pw);
out.println("MariaDB 서버 연결 성공!<br>");
}catch (SQLException sqlerr){
	out.println("Maria 서버 연결 실패!<br>");
	out.println(sqlerr.getMessage() + "<br>");
}

// PreparedStatement 구문 설정

try{
String sql = "CREATE DATABASE news";

pstmt = conn.prepareStatement(sql);
	
pstmt.executeUpdate();

out.print("데이터 베이스 생성 성공!<br>");
}catch(SQLException sqlerr){
	out.print("데이터 베이스 생성 실패!<br>");
	out.print(sqlerr.getMessage() + "<br>");
}finally{
	
//연결 종료

//if(rset != null) rset.close();
if(pstmt != null) pstmt.close();
if(conn != null) conn.close();
}
%>
</body>
</html>