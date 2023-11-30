<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layout/db_connect.jsp" %>
<%
	String sql = " SELECT "
            + " SUBSTR(a.sno, 1, 1) AS grade, "
            + " SUBSTR(a.sno, 2, 2) AS class_number, "
            + " SUBSTR(a.sno, 4, 2) AS student_number, "
            + " sname AS name, "
            + " ekor AS korean, "
            + " emath AS math, "
            + " eeng AS english, "
            + " ehist AS history, "
            + " ekor + emath + eeng + ehist AS total, "
            + " round((ekor + emath + eeng + ehist) / 4.0, 1) AS average "
            + " FROM "
            + " student_tbl_03 a "
            + " LEFT OUTER JOIN " 
            + " exam_tbl_03 b ON a.sno = b.sno "
            + " ORDER BY total DESC NULLS LAST";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	int cnt = 0;
	int sum_kor = 0;
	int sum_math = 0;
	int sum_eng = 0;
	int sum_hist = 0;
	int sum_total = 0;
	double sum_avg = 0;
	
	int rank = 1;
	int prev_sum = 0;
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
				if(rs.getString("korean") != null){
					cnt += 1;
				}
				sum_kor += rs.getInt("korean");
				sum_math += rs.getInt("math");
				sum_eng += rs.getInt("english");
				sum_hist += rs.getInt("history");
				sum_total += rs.getInt("total");
				sum_avg += rs.getDouble("average");
				
				
				if(prev_sum != rs.getInt("total")){
					rank = cnt;
				}
				
			%>
			<tr align="center">
				<td><%=rs.getString("grade")%></td>
    			<td><%=rs.getString("class_number")%></td>
    			<td><%=rs.getString("student_number")%></td>
			    <td><%=rs.getString("name")%></td>
			    <td><%=scoreNull(rs.getString("korean"))%></td>
			    <td><%=scoreNull(rs.getString("math"))%></td>
			    <td><%=scoreNull(rs.getString("english"))%></td>
			    <td><%=scoreNull(rs.getString("history"))%></td>
			    <td><%=scoreNull(rs.getString("total"))%></td>
			    <td><%=scoreNull(rs.getString("average"))%></td>
			    <td><%= rank %></td>
			</tr>
				
				
			<%
				prev_sum = rs.getInt("total");
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