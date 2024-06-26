<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
			<div class="col-lg-2 bg-light justify-content-center align-items-center">
				<hr/><h4 align="center">메뉴</h4><hr/>
			
				<div id="div2_1" class="d-flex flex-column justify-content-center align-items-center">
				<span style="display: inline-block;">글 제목/ID 검색<br/></span>
				<form id="search" action="search" method="post">
						<select name="searchTag" class="form-control form-control-sm">
							<option value="subject">제목</option>
							<option value="id">아이디</option>
						</select>
						<input class="form-control form-control-sm" size="12" name="searchVal" type="text" placeholder="검색어 입력" 
							required="required" 
							oninvalid="setCustomValidity('검색어를 입력하세요')"
							oninput="setCustomValidity('')"/> 
						<input type="submit" class="btn btn-outline-secondary btm-sm" value="검색" maxlength="10"
							style="width: 100%;" />
					</form>
				</div><hr/>
			
				<div id="div2_2" class="d-flex flex-column justify-content-center align-items-center">카테고리 검색
					<select id="category" 
	                  class="form-control form-control-sm" 
	                  style="width: 100%; text-align: center;"
	                  onchange="categorySearch()"> 
							<option>장르</option>
							<option value="공포">공포</option>
							<option value="스릴러">스릴러</option>
							<option value="미스터리">미스터리</option>
							<option value="순정">순정</option>
							<option value="코미디">코미디</option>
							<option value="역사">역사</option>
							<option value="판타지">판타지</option>
							<option value="무협">무협</option>
					</select>
				</div><hr/>
		</div>

		<div class="col-lg-8">
			
			<div class="d-flex align-items-center justify-content-center">
				<table>
					<tr>
						<td style="width: 36em; height: 4em;"></td>
					</tr>
					<tr>
						<td style="height: 29em">
							<!-- -->
							<div class="login-wrap p-4 p-md-5">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-user-o"></span>
								</div>
								<h3 class="text-center mb-4">Search Password</h3>
								<form action="./search_pw_OK?backPage=${param.backPage}" id="forgotWindow" class="forgot-form"
									method="post">
									<div class="form-group">
										<input name="id" type="text" class="form-control rounded-left"
											placeholder="id를 입력해주세요." required="required"
											oninvalid="setCustomValidity('찾으시는 계정의 아이디를 입력하세요')"
											oninput="setCustomValidity('')"/><br/>
									</div>
									<div class="form-group">
										<input name="name" type="text" class="form-control rounded-left"
											placeholder="이름을 입력해주세요" required="required"
											oninvalid="setCustomValidity('찾으시는 계정의 이름을 입력하세요')"
											oninput="setCustomValidity('')"/><br/>
									</div>
									<div class="form-group d-flex">
										<input name="email" type="email"
											class="form-control rounded-left" placeholder="이메일을 입력해주세요."
											required="required"
											oninvalid="setCustomValidity('찾으시는 계정의 이메일을 입력하세요')"
											oninput="setCustomValidity('')"/>
									</div>
									<div class="form-group">
										<br/><button type="submit"
											class="form-control btn btn-secondary rounded submit px-3">찾기</button>
									</div>
									<div class="form-group d-md-flex">
									
									</div>
								</form>
								<!-- -->
							</div>
						</td>
					</tr>
					<tr>
						<td style=" height: 13em"></td>
					</tr>

				</table>

			</div>
		</div>

		<div class="col-lg-2 bg-light justify-content-center align-items-center">
				<hr/><h4 align="center">추천 소설</h4><hr/>
					<div class="rankHyper2" style="color: #198754;">
					조회수 TOP 5<br/>
					</div>
					<ol>
						<c:set var="list" value="${selectHit.list}" />
						<c:forEach var="vo" items="${list}">
							<c:if test="${vo.deleted != 'yes'}">
								<li style="color: #198754;">
									<div class="rankHyper">
										<a class="link-success link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
											href="increment?idx=${vo.idx}&currentPage=${currentPage}">
										<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
										<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>	
										${subject}(${vo.hit})</a>
									</div>
								</li>
							</c:if>
							<c:if test="${vo.deleted == 'yes'}">
								<li style="color: #198754;">
									<div class="rankHyper">
										<a href="">삭제된 글입니다</a>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ol><hr/>
					<div class="rankHyper2" style="color: #dc3545;">
					추천수 TOP 5<br/>
					</div>
					<ol>
						<c:set var="list" value="${selectGood.list}" />
						<c:forEach var="vo" items="${list}">
							<c:if test="${vo.deleted == 'no'}">
							<li style="color: #dc3545;">
								<div class="rankHyper">
									<a class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
										href="increment?idx=${vo.idx}&currentPage=${currentPage}">
									<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
									<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
									${subject}(${vo.good})</a>
								</div>
							</li>
							</c:if>
							<c:if test="${vo.deleted == 'yes'}">
							<li style="color: #dc3545;">
								<div class="rankHyper">
									삭제된 글입니다
								</div>
							</li>
							</c:if>
						</c:forEach>
					</ol><hr/>
					<div class="rankHyper2" style="color: #0d6efd;">
					Today NEW 5<br/>
					</div>
					<ol>
						<c:set var="list" value="${selectNew.list}" />
						<c:forEach var="vo" items="${list}">
							<fmt:formatDate var="writeDate" value="${vo.getWriteDate()}" pattern="MM/dd HH:mm:ss"/>
							<c:if test="${vo.deleted == 'no'}">
								<li style="color: #0d6efd;">
									<div class="rankHyper">
										<a class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
											href="increment?idx=${vo.idx}&currentPage=${currentPage}">
										<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
										<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>	
										${subject}</a>
									</div>
								</li>
							</c:if>
							<c:if test="${vo.deleted == 'yes'}">
								<li style="color: #0d6efd;">
									<div class="rankHyper">
										삭제된 글입니다
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ol><hr/>
				</div>
				
			</div>
		</div>

	</div>

</body>
</html>