<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입하기</title>

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
<script type="text/javascript" src="./js/register.js" defer="defer"></script>
<link rel="stylesheet" href="./css/register.css"/>
</head>
<body>

<div class="container">
	
	<div>
		<div id="div0">
			<a href="list.jsp">
				<img src="./images/clock.png" alt="이미지 없음" width="100px"/>
			</a>
		</div>

		<div>
			<div id="div1">
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
						<td style="border: 1px solid black; height: 2em;">3</td>
						<td style="border: 1px solid black;">3-1</td>
						<td style="border: 1px solid black;">3-2</td>
						<td style="border: 1px solid black;">3-3</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="divA">
			<!-- 로그인하지 않은 상태 -->
			<c:if test="${loginCheck != 1}">
				<input class="btn btn-primary" type="button" value="Login"
					style="width: 100px; height: 75%;" onclick="location.href='./login.jsp?backPage=1&currentPage=${currentPage}'" />
				<input class="btn btn-dark" type="button" value="Register"
					style="width: 100px; height: 75%;" onclick="location.href='./register.jsp'"/>
			</c:if>
			<!-- 로그인한 상태 -->
			<c:if test="${loginCheck == 1}">
				${loginInfoID}님 환영합니다
				<input class="btn btn-primary" type="button" value="logout"
					style="width: 100px; height: 75%;" onclick="location.href='./logout.jsp?backPage=1&currentPage=${currentPage}'" />
			</c:if>
		</div>
	</div>

		<div id="div3">
			div3
			<div style="border: 3px solid red; height: 95%;" align="center" >
				<div class="container p-3">
	<form action="registerProcess.jsp" method="post">
		<table class="table table-hover">
			<tr class="table-primary">
				<th class="align-middle text-center" colspan="3" style="font-size: 30px;">
					회원 가입 양식
				</th>
			</tr>
			<tr>
				<th class="align-middle table-warning" width="150">
					<label for="id">아이디</label>
				</th>
				<td>
					<input 
						id="id" 
						class="form-control form-control-sm" 
						type="text" 
						name="id" 
						placeholder="아이디를 입력하세요" 
						autocomplete="off"
						maxlength="20"/>
				</td>
			</tr>
			<tr>
				<th class="align-middle table-warning">
					<label for="pw">비밀번호</label>
				</th>
				<td colspan="2">
					<input 
						id="pw" 
						class="form-control form-control-sm" 
						type="password" 
						name="pw" 
						placeholder="비밀번호를 입력하세요" 
						autocomplete="off"
						maxlength="20"
						onkeyup="passwordCheckFunction()"/>
				</td>
			</tr>
			<tr>
				<th class="align-middle table-warning">
					<label for="pw2">비밀번호 확인</label>
				</th>
				<td colspan="2">
					<input 
						id="pw2" 
						class="form-control form-control-sm" 
						type="password" 
						name="pw2" 
						placeholder="비밀번호를 다시 한 번 입력하세요" 
						autocomplete="off"
						maxlength="20"
						onkeyup="passwordCheckFunction()"/>
				</td>
			</tr>
			<tr>
				<th class="align-middle table-warning">
					<label for="name">이름</label>
				</th>
				<td colspan="2">
					<input 
						id="name" 
						class="form-control form-control-sm" 
						type="text" 
						name="name" 
						placeholder="이름을 입력하세요" 
						maxlength="20"
						autocomplete="off"/>
				</td>
			</tr>
			<tr>
				<th class="align-middle table-warning">
					<label for="ncik">닉네임</label>
				</th>
				<td colspan="2">
					<input 
						id="nick" 
						class="form-control form-control-sm" 
						type="text" 
						name="nick" 
						placeholder="닉네임을 입력하세요" 
						maxlength="20"
						autocomplete="off"/>
				</td>
			</tr>
			<tr>
				<th class="align-middle table-warning">
					<label for="email">이메일</label>
				</th>
				<td colspan="2">
					<input 
						id="email" 
						class="form-control form-control-sm" 
						type="email" 
						name="email" 
						placeholder="이메일을 입력하세요" 
						maxlength="100"
						autocomplete="off"/>
				</td>
			</tr>
			<tr>
				<td class="align-middle table-success text-center" colspan="3">
					<!-- 비밀번호 일치 검사 결과 메시지가 출력될 영역 -->
					<h5 id="passwordCheckMessage" style="color: red; font-weight: bold;"></h5>
					<!-- 아이디 중복 검사 결과 메시지가 출력될 영역 -->
					<h5 id="idCheckMessage" style="color: tomato; font-weight: bold;"></h5>
					<!-- 오류 메시지가 출력될 영역 -->
					<h5 id="errorMessage" style="color: dodgerblue; font-weight: bold;">
						${messageType} ${messageContent}<input id="registerb"  type="text" value="${registerOk}">
					</h5>
					<input class="btn btn-outline-primary btn-sm" type="submit" value="회원가입" />
					<input class="btn btn-outline-danger btn-sm" type="reset" value="다시쓰기"/>
				</td>
			</tr>
		</table>
	</form>
</div>

			</div>
		</div>




	</div>


</body>
</html>