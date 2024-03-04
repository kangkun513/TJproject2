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
<link rel="stylesheet" href="./css/login.css"/>

</head>
<body>

	<div class="container">
		<div id="div0">
			<a href="./main.jsp">
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
			style="text-align: right; padding-top: 20px; padding-right: 20px">
			<c:if test="${loginCheck != 1}">
				<input class="btn btn-primary" type="button" value="login"
					style="width: 35%" onclick="location.href='./login.jsp'" />
			</c:if>
			<c:if test="${loginCheck == 1}">
				<input class="btn btn-primary" type="button" value="logout"
					style="width: 35%" onclick="location.href='./logout.jsp'" />

			</c:if>
			<input class="btn btn-dark" type="button" value="register"
				style="width: 50%" />
		</div>

		<div id="div2">
			div2
		<div id="div2_1">subject</div>
			<form action="#" method="post">
				<div id="div2_3" align="center">
					<input name="search_category" class="category" type="radio"
						value="작성자" checked="checked">작성자
					<input
						name="search_category" class="category" 
						type="radio" value="제목" />제목 
					<input name="search_searchbar" type="text"
						style="width: 90%; margin-bottom: 4%" /> <input
						class="btn btn-sm btn-outline-success" type="submit"
						style="width: 50%;" value="검색" />
				</div>
			</form>
		</div>

		<div id="div3">
			div3
			<div style="border: 3px solid red; height: 95%; padding-left: 6em">
				<table>
					<tr>
						<td style="border: 1px solid blue; width: 36em; height: 4em;"></td>
					</tr>
					<tr>
						<td style="border: 1px solid blue; height: 29em">
							<!-- -->
							<div class="login-wrap p-4 p-md-5">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-user-o"></span>
								</div>
								<h3 class="text-center mb-4">Search Password</h3>
								<form action="./search_pw_OK.jsp?backPage=${param.backPage}" id="forgotWindow" class="forgot-form"
									method="post">
									<div class="form-group">
										<input name="id" type="text" class="form-control rounded-left"
											placeholder="id를 입력해주세요." required="required"><br/>
									</div>
									<div class="form-group">
										<input name="name" type="text" class="form-control rounded-left"
											placeholder="이름을 입력해주세요" required="required"><br/>
									</div>
									<div class="form-group d-flex">
										<input name="email" type="email"
											class="form-control rounded-left" placeholder="이메일을 입력해주세요."
											required="required">
									</div>
									<div class="form-group">
										<br/><button type="submit"
											class="form-control btn btn-primary rounded submit px-3">찾기</button>
									</div>
									<div class="form-group d-md-flex">
									
									</div>
								</form>
								<!-- -->
							</div>
						</td>
					</tr>
					<tr>
						<td style="border: 1px solid blue; height: 13em"></td>
					</tr>

				</table>

			</div>
		</div>

		<div id="div4">div4 ${param.backPage} </div>

		<div id="div5">div5</div>

	</div>

</body>
</html>