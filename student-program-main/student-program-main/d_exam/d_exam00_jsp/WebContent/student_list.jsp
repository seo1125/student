<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layout/db_connect.jsp" %>
<%
 String sql =" select sno as 학번, sname as 이름 , "
	+ " substr(sno, 1, 1) as 학년, "
	+ " substr(sno, 2, 2) as 반, "
	+ " substr(sno, 4, 2) as 번호, "
	+ " case sgender when 'M' then '남' "
	+ " when 'F' then '여' end 성별, "
             	+ "sphone as 전화번호, "
	+ " saddress 주소 "
	+ " from student_tbl_03";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 id="title">학생목록</h2>
		<table id="table_line">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			<% while(rs.next()) { %>
			<tr align="center">
				<td><%= rs.getString("학번") %></td>
				<td><%= rs.getString("이름") %></td>
				<td><%= rs.getString("학년") %></td>
				<td><%= rs.getString("반") %></td>
				<td><%= rs.getString("번호") %></td>
				<td><%= rs.getString("성별") %></td>
				<td><%= rs.getString("전화번호") %></td>
				<td><%= rs.getString("주소") %></td>
			</tr>
			<% } %>
		</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>