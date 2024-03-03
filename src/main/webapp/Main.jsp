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
<script type="text/javascript" src="./js/board.js" defer="defer"></script>

<style type="text/css">
#div0 {
	border: 1px solid black;
	height: 120px;
	width: 10%;
	padding: 2px;
	float: left;
}

#div1 {
	border: 1px solid black;
	height: 120px;
	width: 72%;
	background-color:;
	padding: 2px;
	float: left;
	display: inline-block;
}

#divA {
	border: 1px solid black;
	height: 120px;
	width: 15%;
	padding: 2px;
	display: inline-block;
}

#nav {
	border: 1px solid black;
	width: 97%;
	height: 3rem;
}


#div2 {
	width: 17%;
	height: 50rem;
	border: 1px solid black;
	float: left;
	position: relative;
}

#div2_1 {
	width: 85%;
	height: 100px;
	border: 2px solid black;
	background-color: lavender;
	display: inline-block;
	float: left;
	font-size: 15px;
	margin-left: 12px;
	margin-bottom: 10px;
}

#div2_2 {
	width: 85%;
	height: 100px;
	border: 2px solid black;
	background-color: lavender;
	display: inline-block;
	float: left;
	margin-left: 12px;
	margin-bottom: 10px;
}

#div2_3 {
	width: 85%;
	height: 100px;
	border: 2px solid black;
	background-color: lavender;
	display: grid;
   	place-items: center;
	margin-left: 12px;
}

#div3 {
	width: 65%;
	height: 50rem;
	float: left;
	border: 1px solid black;
}

#table1 {
	width: 95%;
	height: 95%;
	margin-left: 15px;
	margin-right: 15px;
}

.div3_tr1 {
	border: 1px solid black;
	background-color: lavender;
	vertical-align : top;
}

.div3_tr2 {
	border: 1px solid black;
	background-color: lavender;
	text-align: center;
}

#div4 {
	width: 15%;
	height: 50rem;
	border: 1px solid black;
	float: left;
}

#div5 {
	border: 1px solid black;
	height: 5rem;
	border: 1px solid black;
	width: 97%;
	display: inline-block;
}

</style>
</head>
<body>

<div class="head container">
	<div class="container">
		<div id="div0">로고 자리
			<input type="button" value="Main으로" onclick="location.href='list.jsp'"/>
		</div>

		<div id="div1" class="text-center">
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
					<td style="border: 1px solid black; height: 3em;">3</td>
					<td style="border: 1px solid black;">3-1</td>
					<td style="border: 1px solid black;">3-2</td>
					<td style="border: 1px solid black;">3-3</td>
				</tr>
			</table>
		</div>

		<div id="divA">로그인 버튼
			<input type="button" 
				   value="로그인" 
				   onclick="location.href='./login.jsp?backPage=1'">
		</div>

		<div id="nav">메뉴</div>
	</div>
</div>	

<div class="body container">
	<div class="row">
		<!-- 세부 카테고리 -->
		<div id="div2">
			왼쪽 창
			<div id="div2_1">
				<form action="search.jsp" method="post">
				<select>
					<option>subject</option>
					<option>id</option>
				</select>
				<input name="searchVal" type="text" placeholder="검색어를 입력하세요" size="18">
				<input type="submit" class="btn btn-outline-primary btm-sm" value="검색">
				</form>
			</div>

			<div id="div2_2">세부 카테고리
					<select id="category">
						<option>카테고리 선택</option>
						<option>공포</option>
						<option>스릴러</option>
						<option>미스테리</option>
						<option>순정</option>
						<option>코미디</option>
						<option>역사</option>
						<option>판타지</option>
						<option>무협</option>
					</select>
			</div>

			<div id="div2_3">
				<input
					class="btn btn-outline-primary btm-sm"
					type="button" 
					value="글쓰기" 
					style="font-size: 13px;" 
					onclick="location.href='write.jsp'"/>
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
						<!-- 제목에 태그를 적용하지 못하게 한다. -->
						<td class="align-middle text-center">
							<c:if test="${vo.deleted == 'no'}">
								<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
								<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
								<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
								${subject}
								</a>
							</c:if>
							<c:if test="${vo.deleted == 'yes'}">
								<a href="">삭제된 글입니다</a>
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
						<td class="align-middle text-center">${vo.hit}</td>	
					</tr>
				</c:forEach>
				</c:if>
				<!-- 소설 목록 페이지 이동 버튼 -->
				<tr>
					<td class="align-middle text-center" colspan="5">
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
						
					</td>
				</tr>
				
			</tbody>
			</table>
		</div>
		
		<!-- 오른 쪽 새글, 추천 글 -->
		<div id="div4" class="right">
			<h4>추천 소설 목록</h4><hr/>
			조회수 높은 소설 목록<br/>
			<ol>
				<c:set var="list" value="${selectHit.list}" />
				<c:forEach var="vo" items="${list}">
					<c:if test="${vo.deleted == 'no'}">
					<li><a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
					${vo.getSubject()}(${vo.getHit()})</a></li>
					</c:if>
					<c:if test="${vo.deleted == 'yes'}">
					<li><a href="">삭제된 글입니다</a></li>
					</c:if>
				</c:forEach>
			</ol><hr/>
			추천 높은 소설 목록<br/>
			<ol>
				<c:set var="list" value="${selectGood.list}" />
				<c:forEach var="vo" items="${list}">
					<c:if test="${vo.deleted == 'no'}">
					<li><a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
					${vo.getSubject()}(${vo.getGood()})</a></li>
					</c:if>
					<c:if test="${vo.deleted == 'yes'}">
					<li><a href="">삭제된 글입니다</a></li>
					</c:if>
				</c:forEach>
			</ol><hr/>
			새로운 소설 목록<br/>
			<ol>
				<c:set var="list" value="${selectNew.list}" />
				<c:forEach var="vo" items="${list}">
					<fmt:formatDate var="writeDate" value="${vo.getWriteDate()}" pattern="MM/dd HH:mm:ss"/>
					<c:if test="${vo.deleted == 'no'}">
					<li><a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
					${vo.getSubject()}(${writeDate})</a></li>
					</c:if>
					<c:if test="${vo.deleted == 'yes'}">
					<li><a href="">삭제된 글입니다</a></li>
					</c:if>
				</c:forEach>
			</ol><hr/>
	</div>
		
		<!-- 페이징 작업 -->
		<div id="div5">div5</div>
		
	</div>
</div>	

</body>
</html>