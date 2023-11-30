<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layout/db_connect.jsp" %>
<%
	String sql = " SELECT "
			  + " SUBSTR(a.sno, 1, 1) AS 학년, "
			  + "SUBSTR(a.sno, 2, 2) AS 반, "
			  + "SUBSTR(a.sno, 4, 2) AS 번호, "
			  + "sname AS 이름, "
			  + "ekor AS 국어, "
			  + "emath AS 수학, "
			  + "eeng AS 영어, "
			  + "ehist AS 역사, "
			  + "ekor + emath + eeng + ehist AS 합계, "
			  + "round((ekor + emath + eeng + ehist) / 4.0, 1) AS 평균, "
			  + "rank() " + " over(ORDER BY (ekor + emath + eeng + ehist) / 4.0 DESC NULLS LAST) AS 순위 "
			+ "FROM "
			  + "student_tbl_03 a "
			+ "LEFT OUTER JOIN " 
			  + "exam_tbl_03 b ON a.sno = b.sno ";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	int cnt = 0;
	int sum_kor = 0;
	int sum_math = 0;
	int sum_eng = 0;
	int sum_hist = 0;
	int sum_total = 0;
	double sum_avg = 0;
%>

<%!
    public String scoreNull(String score) {
        return (score == null) ? "" : score;
    }
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
			<tr style="background-color: lightblue; color: black;">
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>이름</th>
				<th>국어</th>
				<th>수학</th>
				<th>영어</th>
				<th>역사</th>
				<th>합계</th>
				<th>평균</th>
				<th>순위</th>
			</tr>
			
			<% while(rs.next()) {
				if(rs.getString("국어") != null){
					cnt += 1;
				}
				sum_kor += rs.getInt("국어");
				sum_math += rs.getInt("수학");
				sum_eng += rs.getInt("영어");
				sum_hist += rs.getInt("역사");
				sum_total += rs.getInt("합계");
				sum_avg += rs.getDouble("평균");
			%>
			<tr align="center">
				<td><%=rs.getString("학년")%></td>
                <td><%=rs.getString("반")%></td>
                <td><%=rs.getString("번호")%></td>
                <td><%=rs.getString("이름")%></td>
                <td><%=scoreNull(rs.getString("국어"))%></td>
                <td><%=scoreNull(rs.getString("수학"))%></td>
                <td><%=scoreNull(rs.getString("영어"))%></td>
                <td><%=scoreNull(rs.getString("역사"))%></td>
                <td><%=scoreNull(rs.getString("합계"))%></td>
                <td><%=scoreNull(rs.getString("평균"))%></td>
				<td><%=(rs.getString("평균") == null) ? "" : rs.getString("순위")%></td>
			</tr>
				
				
			<%
				} 
			%>
			<tr align="center">
				<th colspan="4">총 합</th>
				<td><%= sum_kor %></td>
				<td><%= sum_math %></td>
				<td><%= sum_eng %></td>
				<td><%= sum_hist %></td>
				<td><%= sum_total %></td>
				<td><%= Math.round((double) sum_avg / cnt * 10.0) / 10.0%></td>
				<td></td>
			</tr>
			<tr align="center">
				<th colspan="4">총평균</th>
				<td><%=Math.round((double) sum_kor / cnt * 10.0) / 10.0 %></td>
				<td><%=Math.round((double) sum_math / cnt * 10.0) / 10.0 %></td>
				<td><%=Math.round((double) sum_eng / cnt * 10.0) / 10.0 %></td>
				<td><%=Math.round((double) sum_hist / cnt * 10.0) / 10.0 %></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>