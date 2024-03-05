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

</head>
<body>

<div class="container">

	<div>
		<div id="div0">
			<input class="btn btn-warning" type="button" value="Main으로" onclick="location.href='list.jsp'"
				style="width: 100%; height: 100%;"/>
		</div>

		<div id="div1" class="text-center">소설 투고 사이트</div>

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

	<div>
		<!-- 세부 카테고리 -->
		<div id="div2">
			왼쪽 창
			<div id="div2_1">검색</div>

			<div id="div2_2">카테고리 검색
				<select id="category" class="form-control form-control-sm">
					<option value="카테고리 선택">카테고리 선택</option>
					<option value="공포">공포</option>
					<option value="스릴러">스릴러</option>
					<option value="미스터리">미스터리</option>
					<option value="순정">순정</option>
					<option value="코미디">코미디</option>
					<option value="역사">역사</option>
					<option value="판타지">판타지</option>
					<option value="무협">무협</option>
				</select>
			</div>
			
			<div id="div2_4">
				세부 검색
				<form action="search.jsp" method="post">
					<select name="searchTag" class="form-control form-control-sm">
						<option value="subject">subject</option>
						<option value="id">id</option>
					</select>
					<select name="category" class="form-control form-control-sm">
						<option value="카테고리 선택">카테고리 선택</option>
						<option value="공포">공포</option>
						<option value="스릴러">스릴러</option>
						<option value="미스터리">미스터리</option>
						<option value="순정">순정</option>
						<option value="코미디">코미디</option>
						<option value="역사">역사</option>
						<option value="판타지">판타지</option>
						<option value="무협">무협</option>
					</select>
					<input name="searchVal" type="text" placeholder="검색어를 입력하세요" size="10%"/>
					<input type="submit" class="btn btn-outline-primary btm-sm" value="검색"/>
				</form>
			</div>

			<div id="div2_3">
				<input
					class="btn btn-outline-primary btm-sm"
					type="button" 
					value="글쓰기" 
					style="width: 75%; height: 75%;"
					onclick="location.href='write.jsp?currentPage=${currentPage}'"/>
			</div>
		</div>
		
		
		<!-- 중간 창 소설 목록 리스트 -->
		<div id="div3">
			<table id="table1" >
			<!-- 헤드 -->
			<thead>
				<tr class="div3_tr1">
					<td class="col-sm-2 text-center">소설 번호 idx</td>
					<td class="col-sm-4 text-center">소설 제목(임시) subject</td>
					<td class="col-sm-2 text-center">카테고리</td>
					<td class="col-sm-3 text-center">작가 아이디 id</td>
					<td class="col-sm-2 text-center">조회수</td>
				</tr>
			</thead>	
			
			<!-- 소설 목록을 보여줄 개시판 -->
			<!-- 글을 출력함 -->
			<!-- list.jsp에서 mainList에 저장된 1페이지 분량의 글을 꺼내옴 -->
			<c:set var="list" value="${mainList.list}"/>
			<tbody>
			<!-- 글이 없으면 글이 없다고 출력한다. -->
				<c:if test="${list.size() == 0}">
					<tr class="table-danger">
						<td colspan="5" class="align-middle">
							<marquee>테이블에 저장된 글이 없습니다.</marquee>
						</td>
					</tr>
				</c:if>
				
				<!-- 글이 있으면 글의 개수만큼 반복하며 글의 목록을 출력함 -->
				<c:if test="${list.size() != 0}">
				
				<!-- 반복하여 출력함 -->
				<c:forEach var="vo" items="${list}">
					<tr>
						<!-- 번호 -->
						<td class="align-middle text-center">${vo.idx}</td>
						<td class="align-middle text-center">
							<!-- 삭제된 글일 경우 -->
							<c:if test="${vo.deleted == 'yes'}">
								삭제된 글입니다
							</c:if>
							<!-- 삭제되지 않은 글일 경우 -->
							<c:if test="${vo.deleted != 'yes'}">
								<!-- 제목에 태그를 적용하지 못하게 한다. -->
								<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
								<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
								<div class="boardHyper">
									<a style="width: 100%;" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
										${subject}
									</a>
								</div>
							</c:if>
						</td>
						
						<!-- 카테고리 -->
						<td class="align-middle text-center">
							${vo.category}
						</td>
						
						<!-- 작가 id -->
						<td class="align-middle text-center">
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
				</c:forEach>
				</c:if>
				
			</tbody>
			</table>
		</div>
		
		<!-- 오른 쪽 새글, 추천 글 -->
		<div id="div4" class="right">
			<h4>추천 소설 목록</h4><hr/>
			조회수 높은 소설 목록<br/>
			<ol>
				<c:set var="list" value="${selectHit.list}"></c:set>
				<c:forEach var="vo" items="${list}">
					<li>
						<div class="rankHyper">
							<a class="rankHyper" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
								${vo.getSubject()}(${vo.getHit()})</a>
						</div>
					</li>
				</c:forEach>
			</ol><hr/>
			추천 높은 소설 목록<br/>
			<ol>
				<c:set var="list" value="${selectGood.list}"></c:set>
				<c:forEach var="vo" items="${list}">
					<li>
						<div class="rankHyper">
							<a class="rankHyper" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
								${vo.getSubject()}(${vo.getGood()})</a>
						</div>
					</li>
				</c:forEach>
			</ol><hr/>
			새로운 소설 목록<br/>
			<ol>
				<c:set var="list" value="${selectNew.list}"></c:set>
				<c:forEach var="vo" items="${list}">
					<fmt:formatDate var="writeDate" value="${vo.getWriteDate()}" pattern="MM/dd H:mm:ss"/>
					<li>
						<div class="rankHyper">
							<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
								${vo.getSubject()}</a>
						</div>
					</li>
				</c:forEach>
			</ol>
	</div>
		
	<!-- 페이징 작업 -->
	<div id="div5">
	
		<!-- 처음으로 -->
		<c:if test="${mainList.currentPage > 1}"> 
			<button 
				class="button button1"
				type="button"
				title="첫 페이지로 이동합니다."
				onclick="location.href='?currentPage=1'"
			>처음</button>
		</c:if>
		
		<c:if test="${mainList.currentPage <= 1}">
			<button 
				class="button button2"
				type="button"
				title="이미 첫 페이지 입니다."
				disabled="disabled"
			>처음</button>
		</c:if>
		
		<!-- 10페이지 앞으로 -->
		<c:if test="${mainList.startPage > 1}">
			<button 
				class="button button1" 
				type="button" 
				title="이전 10 페이지로 이동합니다." 
				onclick="location.href='?currentPage=${mainList.startPage - 1}'"
			>이전</button>
		</c:if>
		
		<c:if test="${mainList.startPage <= 1}">
			<button 
				class="button button2" 
				type="button" 
				disabled="disabled" 
				title="이미 첫 10 페이지 입니다."
			>이전</button>
		</c:if>
		
		<!-- 페이지 이동 버튼 -->
		<c:forEach var="i" begin="${mainList.startPage}" end="${mainList.endPage}" step="1">

			<c:if test="${mainList.currentPage == i}">
				<button 
					class="button button2" 
					type="button" 
					disabled="disabled"
				>${i}</button>
			</c:if>
			
			<c:if test="${mainList.currentPage != i}">
				<button 
					class="button button1" 
					type="button" 
					onclick="location.href='?currentPage=${i}'"
				>${i}</button>
			</c:if>
		</c:forEach>
		
		<!-- 10페이지 뒤로 -->
		<c:if test="${mainList.endPage < mainList.totalPage}">
			<button 
				class="button button1" 
				type="button" 
				title="다음 10 페이지로 이동합니다." 
				onclick="location.href='?currentPage=${mainList.endPage + 1}'"
			>다음</button>
		</c:if>
		
		<c:if test="${mainList.endPage >= mainList.totalPage}">
			<button 
				class="button button2" 
				type="button" 
				disabled="disabled" 
				title="이미 마지막 10 페이지 입니다."
			>다음</button>
		</c:if>
		
		<!-- 마지막으로 -->
		<c:if test="${mainList.currentPage < mainList.totalPage}">
			<button 
				class="button button1" 
				type="button" 
				title="마지막 페이지로 이동합니다." 
				onclick="location.href='?currentPage=${mainList.totalPage}'"
			>마지막</button>
		</c:if>

		<c:if test="${mainList.currentPage >= mainList.totalPage}">
			<button 
				class="button button2" 
				type="button" 
				disabled="disabled" 
				title="이미 마지막 페이지 입니다."
			>마지막</button>
		</c:if>
			
	</div>
		
	</div>

</div>

</body>
</html>