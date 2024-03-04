<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장하기</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js"></script>
<link rel="stylesheet" href="./css/write.css"/>


</head>
<body>
	<div class="container">
		<div id="div0">
			<a href="./list.jsp">
				<img src="./images/clock.png" alt="이미지 없음" width="100px"
					style="margin-left: 10px" />
			</a>
		</div>
		<div>
			<div id="div1" style="padding-left: 7em">
				<table>
					<tr>
						<td style="border: 1px solid black; width: 10em; height: 2em;">
							1</td>
						<td style="border: 1px solid black; width: 10em;">1-1</td>
						<td style="border: 1px solid black; width: 10em;">1-2</td>
						<td style="border: 1px solid black; width: 10em;">1-3</td>
					<tr>
						<td style="border: 1px solid black; height: 2em;">2</td>
						<td style="border: 1px solid black;">2-1</td>
						<td style="border: 1px solid black;">2-2</td>
						<td style="border: 1px solid black;">2-3</td>
					</tr>
					<tr>
						<td style="border: 1px solid black; height: 3em;">
							<a href="./main.jsp">
								<img alt="홈버튼" src="./images/menu_re.png"
									style="width:145px; padding-left: 10px; padding-top:7px">
							</a>
						</td>
						<td style="border: 1px solid black;">3-1</td>
						<td style="border: 1px solid black;">3-2</td>
						<td style="border: 1px solid black;">3-3</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="divA"
			style="text-align: right; padding-top: 10px; padding-right: 15px">
			<!-- 로그인하지 않은 상태 -->
			<c:if test="${loginCheck != 1}">
				<input class="btn btn-primary" type="button" value="login"
					style="width: 35%" onclick="location.href='./login.jsp?backPage=1&idx=${mainvo.idx}&currentPage=${currentPage}'" />
				<input class="btn btn-dark" type="button" value="register"
					style="width: 50%" />
			</c:if>
			<!-- 로그인한 상태 -->
			<c:if test="${loginCheck == 1}">
				${loginInfoID}님 환영합니다
				<input class="btn btn-primary" type="button" value="logout"
					style="width: 35%" onclick="location.href='./logout.jsp?backPage=1&idx=${mainvo.idx}&currentPage=${currentPage}'" />
			</c:if>
		</div>

		<div id="div2">
			div2
			<div id="div2_1">subject</div>

			<form action="#" method="post">
				<div id="div2_3" align="center">
					<input name="searchbar_category" class="category" type="radio"
						value="작성자">작성자 <input name="searchbar_category"
						class="category" type="radio" value="제목" /> 제목 <input type="text"
						style="width: 90%; margin-bottom: 4%" />
					<input
						class="btn btn-sm btn-outline-success" type="submit" value="검색" />
				</div>
			</form>
		</div>

		<div id="div3">
			div3
			<div style="border: 3px solid red; height: 95%">
				<form action="./writeOK.jsp" class="form-control" method="post">
					<table class="table" id="table1">
						<tr class="div3_tr1">
							<td class="div3_tr1" style="height: 1em" colspan="2">
								<h3># 글작성</h3>
							</td>
						</tr>
						<tr class="div3_tr1">
							<td style="width: 16%">blank2</td>
							<td style="border: 1px solid black; width: 75%; height: 1em;">blank_2</td>
						</tr>
						<tr class="div3_tr1">
							<td>카테고리</td>
							<td style="border: 1px solid black; width: 75%; height: 3em;">
								<select name="category" class="form-control">
									<option>카테고리 입력</option>
									<option>공포</option>
									<option>스릴러</option>
									<option>미스테리</option>
									<option>순정</option>
									<option>코미디</option>
									<option>역사</option>
							</select>
							</td>
						</tr>
						<tr class="div3_tr1">
							<td class="div3_tr1" style="height: 1em">제목</td>
							<td><input class="form-control" name="subject" type="text"
								placeholder="제목을 입력하세요." /></td>
						</tr>
						<tr class="div3_tr1">
							<td>내용</td>
							<td style="border: 1px solid black; width: 80%; height: 25em;">
								<textarea class="form-control" name="content"
									style="height: 100%; resize: none;"></textarea>
							</td>
						</tr>
						<tr class="div3_tr1">
							<td>blank6</td>
							<td style="border: 1px solid black; width: 80%; height: 2em;">black_6</td>
						</tr>
						<tr class="div3_tr1">
							<td>blank7</td>
							<td style="border: 1px solid black; width: 80%; height: 2em;">blank_7</td>
						</tr>
						<tr class="div3_tr1">
							<td>blank8</td>
							<td style="border: 1px solid black; width: 100%; height: 50px;"
								align="center">
								<input class="btn btn-sm btn-primary"
										type="submit" value="Save" /> &nbsp;&nbsp; 
								<input class="btn btn-sm btn-danger" type="button" value="Cancel"
										onclick="location.href='./goBack.jsp?backPage=${param.backPage}'" /></td>
						</tr>

					</table>
				</form>
			</div>
		</div>

		<div id="div4">div4 ${param.backPage}</div>

		<div id="div5">div5</div>

	</div>

</body>
</html>