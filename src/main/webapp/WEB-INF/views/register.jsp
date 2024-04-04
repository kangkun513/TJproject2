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
<link rel="stylesheet" href="./css/register.css" />
<script>
	$(() => {
	    let message = '${msg}'
	    if (message != null && message.trim() != '') {
	        alert(message)
	    } else { }
	})
</script>
</head>
<body>

<div class="container">

	<div class="container bg-light">
		<nav class="navbar navbar-light bg-light static-top justify-content-center">
			<div class="row">
				<div class="col-lg-2 d-flex align-items-center">
					<div class="flex-grow-1">
					<input id="texthovButton" class="btn btn-warning" type="button" value="메인으로" onclick="location.href='./'"
						data-bs-toggle="tooltip" 
						data-bs-placement="top"
						title="메인 페이지로 이동합니다"
						style="width: 100%; height: 100%; max-height: 5em; background-color: #E4992E; border-color: #E4992E;"/>
					<input id="texthovButton" class="btn btn-warning" type="button" value="소설 목록" onclick="location.href='list'"
						data-bs-toggle="tooltip" 
						data-bs-placement="bottom"
						title="소설글 목록 페이지로 이동합니다"
						style="width: 100%; height: 100%; max-height: 5em; background-color: #F8B54A; border-color: #F8B54A;"/>
					</div>
				</div>
		
				<div class="col-lg-8 justify-content-center" class="text-center">
					<span>
						<img alt="소설 투고 사이트" src="./images/logo.jpg" class="img-fluid" width="100%">
					</span>
				</div>
				
			    <div class="col-lg-2 d-flex align-items-center justify-content-center">
	              	<div class="flex-grow-1">
		                <!-- 로그인하지 않은 상태 -->
						<c:if test="${loginCheck != 1}">
							<div class="d-flex">
							<input id="texthovButton" class="btn btn-warning" type="button" value="로그인"
								data-bs-toggle="tooltip" 
								data-bs-placement="top"
								title="로그인 페이지로 이동합니다"
								style="width: 100%; height: 100%; max-height: 3em; background-color: #F6C243; border-color: #F6C243;" 
								onclick="location.href='./login?backPage=1&currentPage=${mainList.currentPage}'" />
							</div>
							<div class="d-flex">
							<input id="texthovButton" class="btn btn-warning" type="button" value="회원가입"
								data-bs-toggle="tooltip" 
								data-bs-placement="bottom"
								title="회원가입 페이지로 이동합니다" 
								style="width: 100%; height: 100%; max-height: 3em; background-color: #D09F2E; border-color: #D09F2E;"
								onclick="location.href='./register?currentPage=${mainList.currentPage}'"/>
							</div>
						</c:if>
						<!-- 로그인한 상태 -->
						<c:if test="${loginCheck == 1}">
							<div class="d-flex align-items-center justify-content-center"
								style="width: 100%; height: 100%; max-height: 5em; border-radius: 10px; background-color: #eae2e2;">
				                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
				                  alt="이미지 없음"
				                  style="width: 80px; padding: 5px; border-radius: 10px;">
								<span class="loginInfo"><strong>${loginInfoID}</strong></span><br/>
							</div>
							<div class="d-flex">
							<input id="texthovButton" class="btn btn-warning" type="button" value="로그아웃"
								data-bs-toggle="tooltip" 
								data-bs-placement="bottom"
								title="현재 계정에서 로그아웃합니다"
								style="width: 100%; height: 100%; max-height: 3em; background-color: #EA7B7B; border-color: #EA7B7B;" 
								onclick="location.href='./logout?backPage=1&currentPage=${mainList.currentPage}'" />
							</div>
						</c:if>
	              	</div>
			    </div>
			</div>
		</nav>
	</div>
	
	
	<div class="container bg-light">
		<div class="row justify-content-center">
		
			<div id="div3">
				<form action="registerProcess" method="post">
					<div
						style="border-style: outset; border-radius: 15px; height: 95%;"
						align="center">
						<table class="table table-light" style="width: 80%;">
							<tr style="height: 10em">
								<th class="align-middle text-center" colspan="3"
									style="font-size: 30px;">회원 가입</th>
							</tr>
							<tr>
								<th class="register align-middle table-light" style="width: 10%;">
									<label for="id">아이디</label>
								</th>
								<td class="register align-middle"><input id="id"
									class="form-control form-control-sm" type="text" name="id"
									placeholder="아이디를 입력하세요" autocomplete="off" maxlength="20" required="required"
									oninvalid="setCustomValidity('가입할 계정의 아이디를 입력하세요')"
									oninput="setCustomValidity('')"/></td>
							</tr>
							<tr class="register">
								<th class="register align-middle table-light"><label
									for="pw">비밀번호</label></th>
								<td colspan="2" class="register align-middle"><input id="pw"
									class="form-control form-control-sm" type="password" name="pw"
									placeholder="비밀번호를 입력하세요" autocomplete="off" maxlength="20" required="required"
									onkeyup="passwordCheckFunction()"
									oninvalid="setCustomValidity('가입할 계정의 비밀번호를 입력하세요')"
									oninput="setCustomValidity('')"/></td>
							</tr>
							<tr class="register">
								<th class="register align-middle table-light"><label
									for="pw2">비밀번호 확인</label></th>
								<td colspan="2" class="register align-middle"><input id="pw2"
									class="form-control form-control-sm" type="password" name="pw2"
									placeholder="비밀번호를 다시 한 번 입력하세요" autocomplete="off" required="required"
									maxlength="20" onkeyup="passwordCheckFunction()" 
									oninvalid="setCustomValidity('가입할 계정의 비밀번호를 입력하세요')"
									oninput="setCustomValidity('')"/></td>
							</tr>
							<tr class="register">
								<th class="register align-middle table-light"><label
									for="name">이름</label></th>
								<td colspan="2" class="register align-middle"><input id="name"
									class="form-control form-control-sm" type="text" name="name" required="required"
									placeholder="이름을 입력하세요" maxlength="20" autocomplete="off" 
									oninvalid="setCustomValidity('가입할 계정의 이름을 입력하세요')"
									oninput="setCustomValidity('')"/></td>
							</tr>
							<tr class="register">
								<th class="register align-middle table-light"><label
									for="nick">닉네임</label></th>
								<td colspan="2" class="register align-middle"><input id="nick"
									class="form-control form-control-sm" type="text" name="nick" required="required"
									placeholder="닉네임을 입력하세요" maxlength="20" autocomplete="off" 
									oninvalid="setCustomValidity('가입할 계정의 닉네임을 입력하세요')"
									oninput="setCustomValidity('')"/></td>
							</tr>
							<tr class="register">
								<th class="register align-middle table-light"><label
									for="email">이메일</label></th>
								<td colspan="2" class="register align-middle"><input id="email"
									class="form-control form-control-sm" type="email" name="email" required="required"
									placeholder="이메일을 입력하세요" maxlength="100" autocomplete="off" 
									oninvalid="setCustomValidity('가입할 계정의 이메일을 입력하세요')"
									oninput="setCustomValidity('')"/>
								</td>
							</tr>
							<tr class="register" style="height: 10em;">
								<td class="align-middle text-center table-light" colspan="3">
									<!-- 비밀번호 일치 검사 결과 메시지가 출력될 영역 -->
									<h5 id="passwordCheckMessage"
										style="color: red; font-weight: bold;"></h5> <!-- 아이디 중복 검사 결과 메시지가 출력될 영역 -->
									<h5 id="idCheckMessage"
										style="color: tomato; font-weight: bold;"></h5> <!-- 오류 메시지가 출력될 영역 -->
									<h5 id="errorMessage"
										style="color: dodgerblue; font-weight: bold;">
										${messageType} ${messageContent}<input id="registerb"
											type="text" value="${registerOk}" hidden="hidden"/>
									</h5> <input class="btn btn-outline-primary btn-sm" type="submit"
									value="회원가입" /> <input class="btn btn-outline-danger btn-sm"
									type="reset" value="다시쓰기" />
								</td>
							</tr>
						</table>
					</div>
				</form>

			</div>
		</div>
	</div>
	
</div>

</body>
</html>