<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/style.css?ver1.0.0">
<script type="text/javascript">
	function checkValue() {
		var cv = document.data;
		
		if(!cv.sno.value){
			alert("학생번호가 입력되지 않았습니다.");
			cv.sno.focus();
			return false;
		}
		
		if(!cv.ekor.value){
			alert("국어점수가 입력되지 않았습니다.");
			cv.ekor.focus();
			return false;
		}
		
		if(!cv.emath.value){
			alert("수학점수가 입력되지 않았습니다.");
			cv.emath.focus();
			return false;
		}
		
		if(!cv.eeng.value){
			alert("영어점수가 입력되지 않았습니다.");
			cv.eeng.focus();
			return false;
		}
		
		if(!cv.ehist.value){
			alert("역사점수가 입력되지 않았습니다.");
			cv.ehist.focus();
			return false;
		}
		
		alert("학생 성적이 모두 입력되었습니다.");
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 id="title">학사관리 프로그램 작성 안내</h2>
		<form name="data" method="post" action="student_insert_c.jsp" onsubmit="return checkValue()">
			<table id="table_line">
				<tr>
					<th>학번</th>
					<td><input type="text" name="sno" autofocus></td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td align="left"><input type="text" name="ekor" size="8"></td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td><input type="text" name="emath" size="8"></td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td ><input type="text" name="eeng" size="8"></td>
				</tr>
				<tr>
					<th>역사점수</th>
					<td><input type="text" name="ehist" size="8"></td>
				</tr>
				<tr>
					<th colspan="3">
						<input type="submit" value="등록하기">
						<input type="reset" value="다시입력">
						<input type="button" value="학생목록조회" onclick="location.href='student_list.jsp'">
					</th>
				</tr>
			</table>
		</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>