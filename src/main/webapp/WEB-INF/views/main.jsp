<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소설 투고 사이트 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
<link rel="stylesheet" href="./css/main.css"/>
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
<jsp:useBean id="todayDate" class="java.util.Date"/>

<div class="container">
	
	<div class="container bg-light">
		<nav class="navbar navbar-light bg-light static-top justify-content-center">
			<div class="row">
				<div class="col-lg-2 d-flex align-items-center">
					<input id="novelListButton" class="btn btn-warning" type="button" value="소설 목록" onclick="location.href='list'"
						data-bs-toggle="tooltip" 
						data-bs-placement="bottom"
						title="소설글 목록 페이지로 이동합니다"
						style="width: 100%; height: 100%; max-height: 5em; background-color: #E4992E; border-color: #E4992E;"/>
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
							<input id="loginButton" class="btn btn-warning" type="button" value="Login"
								data-bs-toggle="tooltip" 
								data-bs-placement="bottom"
								title="로그인 페이지로 이동합니다"
								style="width: 100%; height: 100%; max-height: 3em; background-color: #F6C243; border-color: #F6C243;" 
								onclick="location.href='./login?backPage=1&currentPage=${mainList.currentPage}'" />
							</div>
							<div class="d-flex">
							<input id="registerButton" class="btn btn-warning" type="button" value="Register"
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
							<input id="logoutButton" class="btn btn-warning" type="button" value="로그아웃"
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
			<!-- 세부 카테고리 -->
			<div class="col-lg-2 bg-light justify-content-center align-items-center">
				<hr/><h4 align="center">메뉴</h4><hr/>
				
				<div id="div2_1" class="d-flex flex-column justify-content-center align-items-center">글 제목/ID 검색
					<form id="search" action="search" method="post">
						<select name="searchTag" class="form-control form-control-sm">
							<option value="subject">제목</option>
							<option value="id">아이디</option>
						</select>
						<input class="form-control form-control-sm" size="12" name="searchVal" type="text" placeholder="검색어 입력" 
							value="${searchVal}" required="required" 
							oninvalid="setCustomValidity('검색어를 입력하세요')"
							oninput="setCustomValidity('')"/>
						<input type="text" value="${category}" name="category" hidden="hidden"/>
						<input type="submit" onclick="search()" value="검색" maxlength="10"
							class="btn btn-outline-secondary btm-sm" 
							data-bs-toggle="tooltip" 
							data-bs-placement="bottom"
							title="입력하신 검색어로 소설글을 검색합니다"
							style="width: 100%;" />
					</form>
				</div><hr/>
				
				<div id="div2_2" class="d-flex flex-column justify-content-center align-items-center">카테고리 검색
						<span style="width: 100%;" data-bs-toggle="tooltip" data-bs-placement="bottom" 
							title="선택하신 카테고리로 소설글을 검색합니다">
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
						</select></span>
				</div><hr/>
				
				
				<div id="div2_3" class="d-flex justify-content-center align-items-center">
					<input
						class="btn btn-outline-info btm-sm ab"
						id="writeButton"
						type="button" 
						value="글쓰기" 
						data-bs-toggle="tooltip" 
						data-bs-placement="bottom"
						title="소설글 작성 페이지로 이동합니다"
						style="width: 100%; height: 80%; font-size: 20px;"
						onclick="location.href='write?currentPage=${mainList.currentPage}'"/>
				</div><hr/>
			</div>
		
		
				<!-- 중간 창 소설 목록 리스트 -->
				<div class="col-lg-8 bg-light">
					<hr/><h4 align="center">글 목록</h4><hr/>
					<table id="table1" class="table table-light table-hover" style="table-layout: fixed;">
					<!-- 헤드 -->
					<thead>
						<tr class="div3_tr1">
							<td class="col-lg-2">글 순번</td>
							<td class="col-lg-4">소설 제목</td>
							<td class="col-lg-2">카테고리</td>
							<td class="col-lg-2">작가</td>
							<td class="col-lg-2">조회수</td>
						</tr>
					</thead>	
					
					<!-- 소설 목록을 보여줄 개시판 -->
					<!-- 글을 출력함 -->
					<!-- "/list"에서 mainList에 저장된 1페이지 분량의 글을 꺼내옴 -->
					<c:set var="list" value="${mainList.list}"/>
					<tbody>
						<!-- 글이 없으면 글이 없다고 출력한다. -->
						<c:if test="${list.size() == 0}">
							<tr class="table-danger">
								<td colspan="5" class="align-middle">
									<marquee>게시글이 없습니다</marquee>
								</td>
							</tr>
						</c:if>
						
						<!-- 글이 있으면 글의 개수만큼 반복하며 글의 목록을 출력함 -->
						<c:if test="${list.size() != 0}">
						
						<c:set var="new_idx" value="${mainList.totalCount - (mainList.currentPage - 1) * mainList.pageSize}"/>
						<!-- 반복하여 출력함 -->
						<c:forEach var="vo" items="${list}">
							<tr>
								<!-- 번호 -->
								<td class="align-middle text-center">${new_idx}</td>
								
									<!-- 삭제된 글일 경우 -->
									<c:if test="${vo.deleted == 'yes'}">
										<td class="align-middle text-center">
											삭제된 글입니다
										</td>
									</c:if>
									<!-- 삭제되지 않은 글일 경우 -->
									<c:if test="${vo.deleted != 'yes'}">
										<!-- 제목에 태그를 적용하지 못하게 한다. -->
										<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
										<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
										<td class="align-middle text-center subjectHyper"
											data-bs-toggle="tooltip" data-bs-placement="left" title="${subject}">
											<a style="width: 100%;"
												class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
												href="increment?idx=${vo.idx}&currentPage=${mainList.currentPage}">
												${subject}
											</a>
										</td>
									</c:if>
								
								
								<!-- 카테고리 -->
								<td class="align-middle text-center">
									${vo.category}
								</td>
								
								<!-- 작가 id -->
								<td class="align-middle text-center idText"
									data-bs-toggle="tooltip" data-bs-placement="right" title="${vo.id}">
									${vo.id}
								</td>
								<!-- 조회수-->
								<td class="align-middle text-center">
								<!-- 삭제된 글일 경우 -->
									<c:if test="${vo.deleted == 'yes'}">
										-
									</c:if>
									<!-- 삭제되지 않은 글일 경우 -->
									<c:if test="${vo.deleted != 'yes'}">
										${vo.hit}
									</c:if>
								</td>
							</tr>
							
							<c:set var="new_idx" value="${new_idx - 1}"/>
						
							</c:forEach>
						</c:if>
						
						</tbody>
						<!-- 페이징 작업 -->
						<thead>
							<tr height="100">
								<td class="align-middle text-center border border-0" colspan="5">
									
									<!-- 처음으로 -->
									<c:if test="${mainList.currentPage > 1}"> 
										<button 
											class="btn btn-outline-secondary"
											type="button"
											data-bs-toggle="tooltip" 
											data-bs-placement="top"
											title="처음 페이지로 이동합니다"
											onclick="location.href='?currentPage=1'"
										>처음</button>
									</c:if>
									
									<c:if test="${mainList.currentPage <= 1}">
										<span data-bs-toggle="tooltip" data-bs-placement="top" 
											title="이미 처음 페이지입니다">
										<button 
											class="btn btn-outline-secondary"
											type="button"
											disabled="disabled">처음</button>
										</span>
									</c:if>
									
									<!-- 10페이지 앞으로 -->
									<c:if test="${mainList.startPage > 1}">
										<button 
											class="btn btn-outline-secondary" 
											type="button"
											data-bs-toggle="tooltip" 
											data-bs-placement="top"
											title="이전 10개 페이지로 이동합니다" 
											onclick="location.href='?currentPage=${mainList.startPage - 1}'"
										>이전</button>
									</c:if>
									
									<c:if test="${mainList.startPage <= 1}">
										<span data-bs-toggle="tooltip" data-bs-placement="top" 
											title="이미 첫 10개 페이지입니다">
										<button 
											class="btn btn-outline-secondary" 
											type="button" 
											disabled="disabled">이전</button>
										</span>
									</c:if>
									
									<!-- 페이지 이동 버튼 -->
									<c:forEach var="i" begin="${mainList.startPage}" end="${mainList.endPage}" step="1">
							
										<c:if test="${mainList.currentPage == i}">
											<span data-bs-toggle="tooltip" data-bs-placement="top" 
												title="현재 ${i}페이지입니다">
											<button 
												class="btn btn-light"
												type="button" 
												disabled="disabled">${i}</button>
											</span>
										</c:if>
										
										<c:if test="${mainList.currentPage != i}">
											<button 
												class="btn btn-outline-secondary" 
												type="button" 
												data-bs-toggle="tooltip" 
												data-bs-placement="top"
												title="${i}페이지로 이동합니다"
												onclick="location.href='?currentPage=${i}'"
											>${i}</button>
										</c:if>
									</c:forEach>
									
									<!-- 10페이지 뒤로 -->
									<c:if test="${mainList.endPage < mainList.totalPage}">
										<button 
											class="btn btn-outline-secondary" 
											type="button" 
											data-bs-toggle="tooltip" 
											data-bs-placement="top"
											title="다음 10개 페이지로 이동합니다" 
											onclick="location.href='?currentPage=${mainList.endPage + 1}'"
										>다음</button>
									</c:if>
									
									<c:if test="${mainList.endPage >= mainList.totalPage}">
										<span data-bs-toggle="tooltip" data-bs-placement="top" 
											title="이미 마지막 10개 페이지입니다">
										<button 
											class="btn btn-outline-secondary" 
											type="button" 
											disabled="disabled">다음</button>
										</span>
									</c:if>
									
									<!-- 마지막으로 -->
									<c:if test="${mainList.currentPage < mainList.totalPage}">
										<button 
											class="btn btn-outline-secondary" 
											type="button" 
											data-bs-toggle="tooltip" 
											data-bs-placement="top"
											title="마지막 페이지로 이동합니다" 
											onclick="location.href='?currentPage=${mainList.totalPage}'"
										>마지막</button>
									</c:if>
							
									<c:if test="${mainList.currentPage >= mainList.totalPage}">
										<span data-bs-toggle="tooltip" data-bs-placement="top" 
											title="이미 마지막 페이지입니다">
										<button 
											class="btn btn-outline-secondary" 
											type="button" 
											disabled="disabled">마지막</button>
										</span>
									</c:if>
									
								</td>
							</tr>
						</thead>
						
					</table><hr/>
				</div>
	
		
				<!-- 오른 쪽 새글, 추천 글 -->
				<div class="col-lg-2 bg-light justify-content-center align-items-center">
					<hr/><h4 align="center">추천 소설</h4><hr/>
						<div class="dropdown" data-bs-toggle="tooltip" data-bs-placement="top" 
							title="조회수가 높은 상위 소설 5개">
							<a class="btn btn-outline-success dropdown-toggle" href="" role="button" 
								  id="dropdownMenuLinkHit"
								  data-bs-toggle="dropdown"
								  aria-expanded="false"
								  style="width: 100%; height: 80%;">
									조회수 TOP 5<br/>
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLinkHit">
								<c:set var="list" value="${selectHit.list}" />
								<c:forEach var="vo" items="${list}">
									<c:if test="${vo.deleted != 'yes'}">
										<li>
											<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
											<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>	
											<div class="rankHyper hitRank" data-bs-toggle="tooltip" data-bs-placement="left" title="${subject}(${vo.hit})">
												<a style="display: block;" class="link-success link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
													href="increment?idx=${vo.idx}&currentPage=${mainList.currentPage}">
												${subject}(${vo.hit})</a>
											</div>
										</li>
									</c:if>
									<c:if test="${vo.deleted == 'yes'}">
										<li>
											<div class="rankHyper hitRank">
												<a href="">삭제된 글입니다</a>
											</div>
										</li>
									</c:if>
								</c:forEach>
							</ul><hr/>
						</div>
					
						<div class="dropdown" data-bs-toggle="tooltip" data-bs-trigger="hover hide" 
							title="추천수가 높은 상위 소설 5개">
								<a class="btn btn-outline-danger dropdown-toggle form-control" href="" role="button" 
								   id="dropdownMenuLinkGood"
								   data-bs-toggle="dropdown"
								   aria-expanded="false"
								   style="width: 100%; height: 80%;">
								   추천수 TOP 5<br/>
								</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLinkGood">
								<c:set var="list" value="${selectGood.list}" />
								<c:forEach var="vo" items="${list}">
									<c:if test="${vo.deleted == 'no'}">
										<li>
											<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
											<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>	
											<div class="rankHyper goodRank" data-bs-toggle="tooltip" data-bs-placement="left" title="${subject}(${vo.good})">
												<a style="display: block;" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
													href="increment?idx=${vo.idx}&currentPage=${mainList.currentPage}">
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
							</ul><hr/>
						</div>
						
						<div class="dropdown" data-bs-toggle="tooltip" data-bs-placement="top" 
							title="오늘 올라온 최신 소설 5개">
							<a class="btn btn-outline-primary dropdown-toggle" href="" role="button" 
							   id="dropdownMenuLinkNew"
							   data-bs-toggle="dropdown"
							   aria-expanded="false"
							   style="width: 100%; height: 80%;">
								Today NEW 5<br/>
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLinkNew">
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
											<li>
												<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
												<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>	
												<div class="rankHyper newRank"data-bs-toggle="tooltip" data-bs-placement="left" title="${subject}(오늘 ${Date})">
													<a style="display: block;" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
														href="increment?idx=${vo.idx}&currentPage=${mainList.currentPage}">
													${subject}</a>
												</div>
											</li>
										</c:if>
										<c:if test="${vo.deleted == 'yes'}">
											<li>
												<div class="rankHyper newRank">삭제된 글입니다</div>
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
										 ( todayMonth % 100 == 3 && writeMonth == todayMonth - 1 && todayDay == 1 && writeDay == 29)}">
										<c:if test="${vo.deleted == 'no'}">
											<li>
												<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
												<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>	
												<div class="rankHyper newRank"data-bs-toggle="tooltip" data-bs-placement="left" title="${subject}(어제 ${Date})">
													<a style="display: block;" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
														href="increment?idx=${vo.idx}&currentPage=${mainList.currentPage}">
													${subject}</a>
												</div>
											</li>
										</c:if>
										<c:if test="${vo.deleted == 'yes'}">
											<li>
												<div class="rankHyper newRank">삭제된 글입니다</div>
											</li>
										</c:if>
									</c:if>
								</c:forEach>
							</ul><hr/>
						</div>
					</div>
					
			</div>
		</div>
		
</div>

</body>
</html>