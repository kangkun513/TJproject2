<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소설 내용 수정 PAGE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
<link rel="stylesheet" href="./css/read.css"/>

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
			<form action="selectByIdx?job=updateOK" method="post">
				<div class="row justify-content-center">
				
				<div class="col-lg-2 bg-light justify-content-center align-items-center">
					<div style="display: none;">
						<input name="idx" value="${mainvo.idx}"/>
						<input name="currentPage" value="${currentPage}"/>
						<input name="job" value="updateOK"/>
					</div>
					<hr/><h4 align="center">정보 및 메뉴</h4><hr/>
					<div id="div2_1" class="d-flex flex-column justify-content-center align-items-center">
						<label for="title">
							소설 제목<br/>
							<input class="form-control" id="title" maxlength="100" name="subject" value="${mainvo.subject}" style="width: 100%;"/>
						</label>
					</div><hr/>
			
					<div id="div2_3" align="center">
						<input class="btn btn-primary btn-sm" type="submit" value="수정 완료"
							style="width: 100%; height: 80%;"/>
						<input class="btn btn-secondary btn-sm" type="button" value="수정 취소" style="width: 100%; height: 80%;"
							onclick="location.href='selectByIdx?idx=${mainvo.idx}&currentPage=${currentPage}'"/>
					</div><hr/>
				</div>
				
				<div class="col-lg-8">
					<div class="center">
						<hr/><h4 align="center">소설 내용 수정</h4><hr/>
						<table id="table1" class="table table-light" style="width: 100%;">
							<tr style="height: 2em;">
								<th style="width: 15%;">작성자 ID</th>
								<td style="width: 85%;">${mainvo.id}</td>
							</tr>
							<tr style="height: 2em;">
								<th>카테고리</th>
								<td>
									<select id="category" name="category" class="form-control" >
											<option selected="selected">${mainvo.category}</option>
											<option>공포</option>
											<option>스릴러</option>
											<option>미스테리</option>
											<option>순정</option>
											<option>코미디</option>
											<option>역사</option>
									</select>
								</td>
							</tr>
							<tr style="height: 2em;">
								<th>조회수</th>
								<td>${mainvo.hit}</td>
							</tr>
							<tr style="height: 2em;">
								<th>추천수</th>
								<td>${mainvo.good}</td>
							</tr>
							<tr style="height: 2em;">
								<th>작성 날짜</th>
								<fmt:formatDate var="Date" value="${mainvo.writeDate}" pattern="yyyy/MM/dd a h:mm:ss"/>
								<td>${Date}</td>
							</tr>
							<tr>
								<th><label for="contents">내용</label></th>
								<td>
									<textarea class="form-control" id="contents" name="content" maxlength="100000"
										style="height: 20em; resize: none;">${mainvo.content}</textarea>
								</td>
							</tr>
						</table>
							
					</div>
				</div>
				
				
				<div class="col-lg-2 bg-light justify-content-center align-items-center">
					<div style="position: sticky; top:5rem;">
						<hr/><h4 align="center">추천 소설</h4><hr/>
							<div class="rankHyper2" style="color: #198754;">
							조회수 TOP 5<br/>
							</div>
							<ol>
								<c:set var="list" value="${selectHit.list}" />
								<c:forEach var="vo" items="${list}">
									<c:if test="${vo.deleted == 'no'}">
										<li style="color: #198754;">
											<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
											<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
											<div class="rankHyper hitRank" data-bs-toggle="tooltip" data-bs-placement="top" title="${subject}(${vo.hit})">
												<a class="link-success link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
													href="increment?idx=${vo.idx}&currentPage=${currentPage}">
												${subject}(${vo.hit})</a>
											</div>
										</li>
									</c:if>
									<c:if test="${vo.deleted == 'yes'}">
										<li style="color: #198754;">
											<div class="rankHyper hitRank">
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
									<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
									<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
									<div class="rankHyper goodRank" data-bs-toggle="tooltip" data-bs-placement="top" title="${subject}(${vo.good})">
										<a class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
											href="increment?idx=${vo.idx}&currentPage=${currentPage}">
										${subject}(${vo.good})</a>
									</div>
								</li>
								</c:if>
								<c:if test="${vo.deleted == 'yes'}">
								<li>
									<div class="rankHyper goodRank">
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
								<fmt:formatDate var="Date" value="${vo.writeDate}" pattern="a h:mm:ss"/>
									<fmt:formatDate var="todaydate" value="${todayDate}" pattern="yyyy/MM/dd"/>
									<fmt:formatDate var="todayMonth" value="${todayDate}" pattern="yyyyMM"/>
									<fmt:formatDate var="todayDay" value="${todayDate}" pattern="dd"/>
									<fmt:formatDate var="writedate" value="${vo.writeDate}" pattern="yyyy/MM/dd"/>
									<fmt:formatDate var="writeMonth" value="${vo.writeDate}" pattern="yyyyMM"/>
									<fmt:formatDate var="writeDay" value="${vo.writeDate}" pattern="dd"/>
									<c:if test="${todaydate == writedate}">
										<c:if test="${vo.deleted == 'no'}">
											<li style="color: #0d6efd;">
												<div class="rankHyper newRank">
													<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
													<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
													<a class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
														data-bs-toggle="tooltip" 
														data-bs-placement="top"
														title="${subject}(${Date})"
														href="increment?idx=${vo.idx}&currentPage=${currentPage}">
													${subject}</a>
												</div>
											</li>
										</c:if>
									</c:if>
									<c:if test="${(todayMonth == writeMonth && writeDay == todayDay - 1) || 
										 (( (todayMonth % 100 == 1 && writeMonth == todayMonth - 89) || 
											((todayMonth % 100 == 2 || 
											todayMonth % 100 == 4 || 
											todayMonth % 100 == 6 || 
											todayMonth % 100 == 8 || 
											todayMonth % 100 == 9 || 
											todayMonth % 100 == 11) && writeMonth == todayMonth - 1)) && todayDay == 1 && writeDay == 31) || 
										 (( (todayMonth % 100 == 5 || 
											todayMonth % 100 == 7 ||
											todayMonth % 100 == 10 || 
											todayMonth % 100 == 12) && writeMonth == todayMonth - 1) && todayDay == 1 && writeDay == 30) || 
										 ( todayMonth % 100 == 3 && writeMonth == todayMonth - 1 && todayDay == 1 && (writeDay == 28 || writeDay == 29))}">
										<c:if test="${vo.deleted == 'no'}">
											<li style="color: #0d6efd;">
												<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
												<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>	
												<div class="rankHyper newRank"data-bs-toggle="tooltip" data-bs-placement="left" title="${subject}(어제 ${Date})">
													<a class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
														href="increment?idx=${vo.idx}&currentPage=${mainList.currentPage}">
													${subject}</a>
												</div>
											</li>
										</c:if>
										<c:if test="${vo.deleted == 'yes'}">
											<li>
												<div class="rankHyper newRank">
													삭제된 글입니다
												</div>
											</li>
										</c:if>
									</c:if>
							</c:forEach>
						</ol><hr/>
					</div>
				</div>
				
				</div>
				
			</form>
		</div>
</div>

</body>
</html>