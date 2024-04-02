<%@page import="com.tjoeun.main.vo.MainCommentVO"%>
<%@page import="com.tjoeun.main.vo.MainCommentList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소설 내용 PAGE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/mainjs.js" defer="defer"></script>
<link rel="stylesheet" href="./css/read.css"/>

</head>
<body>
<jsp:useBean id="todayDate" class="java.util.Date"/>
<fmt:formatDate var="Date" value="${vo.writeDate}" pattern="yyyy/MM/dd a h:mm:ss"/>

<div id="container" class="container">

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
	              	<div class="flex-grow-1 lg-2">
		                <!-- 로그인하지 않은 상태 -->
						<c:if test="${loginCheck != 1}">
							<div class="d-flex">
							<input id="loginButton" class="btn btn-warning" type="button" value="Login"
								data-bs-toggle="tooltip" 
								data-bs-placement="bottom"
								title="로그인 페이지로 이동합니다"
								style="width: 100%; height: 100%; max-height: 3em; background-color: #F6C243; border-color: #F6C243;" 
								onclick="location.href='./login?backPage=1&currentPage=${mainList.currentPage}'" />
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
							<div class="overflow-auto d-flex align-items-center justify-content-center" 
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
			<div class="col-lg-2 bg-light justify-content-center align-items-center">
				<div style="position: sticky; top:5rem;">
					<hr/><h4 align="center">정보 및 메뉴</h4><hr/>
					
					<div id="div2_1" class="d-flex flex-column justify-content-center align-items-center">
						소설 제목<br/>
						<c:if test="${vo.deleted != 'yes'}">
							<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
							<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
							<div class="subjectText" style="text-align: center;">
								<strong>${subject}</strong>
							</div>
						</c:if>
						<c:if test="${vo.deleted == 'yes'}">
							<strong>삭제된 글입니다</strong>
						</c:if>
					</div><hr/>
			
					<div id="div2_2" align="center">
						<!-- 로그인 상태일 경우 -->
						<c:if test="${loginCheck == 1}">
						<c:if test="${vo.deleted == 'yes'}">
							삭제된 글입니다
						</c:if>
							<c:if test="${vo.deleted != 'yes'}">
								<!-- 게시글 아이디와 회원의 아이디가 같을 때 -->
								<c:if test="${vo.id == loginInfoID}">
								<input 
									class="btn btn-primary btn-sm" 
									type="button" value="수정" 
									data-bs-toggle="tooltip" 
									data-bs-placement="top"
									title="해당 글을 수정합니다"
									style="width: 100%; height: 80%;"
									onclick="location.href='selectByIdx?idx=${vo.idx}&currentPage=${currentPage}&job=update'"/>
								<input 
									class="btn btn-danger btn-sm" 
									type="button" value="삭제"  
									data-bs-toggle="tooltip" 
									data-bs-placement="bottom"
									title="해당 글을 삭제합니다"
									style="width: 100%; height: 80%;"
									onclick="location.href='selectByIdx?idx=${vo.idx}&currentPage=${currentPage}&job=delete'"/>
								</c:if>
								<!-- 게시글 아이디와 회원의 아이디가 다를 때 -->
								<c:if test="${vo.id != loginInfoID}">
									<div class="menuInfo">수정, 삭제 불가<br/>
									다른 회원이 작성한 글</div>
								</c:if>
							</c:if>
						</c:if>
						<!-- 로그아웃 상태일 경우 -->
						<c:if test="${loginCheck != 1}">
							<div class="menuInfo">글 수정, 삭제<br/>
							로그인하세요</div>
						</c:if>
					</div><hr/>
					
					<div id="div2_3" align="center">
						
						<!-- 로그인 상태일 경우 -->
						<c:if test="${loginCheck == 1}">
							<!-- 게시글 아이디와 회원의 아이디가 다를 때 -->
							<c:if test="${vo.id != loginInfoID}">
								<!-- 추천 여부 체크 -->
			<%
								String goodcheck = "goodidxcheck" + request.getAttribute("idx");
								
								try {
									if (session.getAttribute(goodcheck).equals("checked")) {
			%>				
									추천하셨습니다
			<%
									} else {
			%>
									<input class="btn btn-info btn-sm" value="추천"  style="width: 100%; height: 80%; font-size: 20px;"
										data-bs-toggle="tooltip" 
										data-bs-placement="top"
										title="해당 소설을 추천합니다"
										onclick="location.href='selectByIdx?idx=${vo.idx}&currentPage=${currentPage}&job=good'"/>
			<%
									}
								} catch (NullPointerException e) {					
			%>
									<input class="btn btn-info btn-sm" value="추천"  style="width: 100%; height: 80%; font-size: 20px;"
										data-bs-toggle="tooltip" 
										data-bs-placement="top"
										title="해당 소설을 추천합니다"
										onclick="location.href='selectByIdx?idx=${vo.idx}&currentPage=${currentPage}&job=good'"/>
			<%						
								}
			%>
							</c:if>
							<!-- 게시글 아이디와 회원의 아이디가 같을 때 -->
							<c:if test="${vo.id == loginInfoID}">
								<input type="button" class="btn btn-info btn-sm" value="추천"  style="width: 100%; height: 80%; font-size: 20px;"
									data-bs-toggle="tooltip" 
									data-bs-placement="bottom"
									title="해당 소설을 추천합니다"
									onclick="alert('본인이 쓴 글은 본인이 추천할 수 없습니다');" />
							</c:if>
						</c:if>
						<!-- 로그아웃 상태일 경우 -->
						<c:if test="${loginCheck != 1}">
							추천<br/>로그인하세요
						</c:if>
					</div><hr/>
					
					<div id="div2_2" align="center">
						<input class="btn btn-sm btn-outline-success" type="button" value="TOP"
							data-bs-toggle="tooltip" 
							data-bs-placement="bottom"
							title="현재 페이지의 맨 위로 이동합니다"
							style="width: 100%; height: 80%; font-size: 20px;" onclick="location.href='#container'"/>
					</div><hr/>
				
				</div>
			</div>
			
			<div class="col-lg-8 bg-light">
				<div class="center">
					<hr/><h4 align="center">소설 내용</h4><hr/>
					<table id="table1" class="table table-light" style="table-layout: fixed;">
						<tr style="height: 2em;">
							<th style="width: 15%">작성자 ID</th>
							<td style="width: 85%">${vo.id}</td>
						</tr>
						<tr style="height: 2em;">
							<th>카테고리</th>
							<td>${vo.category}</td>
						</tr>
						<tr style="height: 2em;">
							<th>조회수</th>
							<td>${vo.hit}</td>
						</tr>
						<tr style="height: 2em;">
							<th>추천수</th>
							<td>${vo.good}</td>
						</tr>
						<tr style="height: 2em;">
							<th>작성 날짜</th>
							<td>${Date}</td>
						</tr>
						<tr>
							<th valign="top">내용</th>
							<c:if test="${vo.deleted != 'yes'}">
								<td class="contentText">
									${vo.content}
								</td>
							</c:if>
							<c:if test="${vo.deleted == 'yes'}">
								<td>삭제된 글입니다</td>
							</c:if>
						</tr>
					</table>
						
					<div id="div5">
						<!-- 댓글 입력 -->
						<div id="div5_2">
							<form method="post" action="commentInsert" id="commentForm" onsubmit="return commentFormCheck(this)">
								<h4>댓글 작성</h4><hr/>
								<c:if test="${vo.deleted == 'yes'}">
								</c:if>
								<c:if test="${vo.deleted != 'yes'}">
									<c:if test="${loginCheck == 1}">
										<div class="d-flex align-items-center justify-content-center">
										<table>
											<tr>
												<th class="align-middle text-center" style="width: 80px;">
													<label for="commentcontent">
														댓글 내용 입력
													</label>
												</th>
												<td colspan="4" style="width: 600px;">
												<textarea class="form-control form-control-sm" id="commentcontent" maxlength="250"
													rows="4" name="content" style="resize: none;"></textarea>
												</td>
											</tr>
											
											<tr>
												<td class="align-middle text-center" colspan="2">
													<input class="btn btn-secondary btn-sm" type="submit" value="댓글 저장"/>
													<input class="btn btn-secondary btn-sm" type="reset" value="다시쓰기"/>
												</td>
											</tr>
										</table>
										</div>
								</c:if>
								</c:if>
								<c:if test="${loginCheck != 1}">
									<div style="height: 10em">로그인하세요</div>
								</c:if>
								<!-- 화면에 보이면 안되는 부분 -->
								<div hidden="hidden">
									<!-- 작성할 댓글의 글번호 -->
									idx: <input type="text" name="idx" value="${vo.idx}" size="1" readonly="readonly"/>
									<!-- 현재 댓글이 어떤 메인글의 댓글인가 -->
									gup: <input type="text" name="gup" value="${vo.idx}" size="1" readonly="readonly"/>
									<!-- 메인글이 표시되던 페이지 번호 -->
									currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1" readonly="readonly"/>
									<!-- 해당 댓글을 작성하는 회원의 아이디 -->
									name: <input type="text" name="name" value="${loginInfoID}" readonly="readonly"/>
								</div>
							</form>
						</div><hr/>
					
						<div id="div5_1" class="item">
							<h4>댓글 목록</h4><hr/>
							<!-- 댓글을 출력함 -->
							<c:set var="comment" value="${commentList.list}"/>
							
							<!-- 댓글이 있는 경우 -->
							<c:if test="${comment.size() != 0}">
								<c:set var="upidx" value="1" />
								<c:forEach var="co" items="${comment}">
								
								<c:set var="updateForm" value="updateform${co.idx}"></c:set>
								<c:set var="replyForm" value="replyform${co.idx}"></c:set>
								
								<fmt:formatDate var="codate" value="${co.writeDate}" pattern="yyyy/MM/dd a h:mm:ss"/>
									<c:set var="name" value="${fn:replace(co.name, '<', '&lt;')}"/>
									<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
									<div>
									
									${upidx}. 
									</div><br/>
									<c:set var="upidx" value="${upidx + 1}" />
									
									<!-- 삭제된 댓글이 아닐 경우 표시 -->
									<c:if test="${co.deleted != 'yes'}">
										<div style="width: 100%;">
											<div class="commentText">${co.content}</div><br/>
											${name}님이 ${codate}에 작성<br/>
											<!-- 댓글 아이디와 회원 아이디가 같을 경우 -->
											<c:if test="${name == loginInfoID}">
												
												<input class="btn btn-primary btn-sm" type="button" value="댓글 수정" onclick="setting(${co.idx}, 1)" />
												<input class="btn btn-danger btn-sm" type="button" value="댓글 삭제" 
													onclick="location.href='commentDelete?idx=${idx}&comidx=${co.idx}&currentPage=${currentPage}'"/>
												
												<form action="commentUpdate" name="${updateForm}" method="post" id="${updateForm}" style="display: none;">
												<textarea class="form-control form-control-sm" maxlength="250" name="content" rows="4"
													style="width: 50%; resize: none; display: inline-block;" required="required"
														oninvalid="setCustomValidity('수정할 댓글 내용을 입력하세요')"
														oninput="setCustomValidity('')"></textarea>
												<div style="display: inline-block;">
													<input class="btn btn-primary btn-sm" type="submit" value="댓글 수정"/><br/>
													<input class="btn btn-secondary btn-sm" type="button" value="수정 취소" onclick="setting(${co.idx}, 3)"/>
												</div>
												<div hidden="hidden">
													idx: <input type="text" name="gup" value="${idx}" size="1" readonly="readonly"/>
													comidx: <input type="text" id="comidx" name="idx" value="${co.idx}" size="1" readonly="readonly"/>
													mode: <input type="text" name="mode" value="1" size="1" readonly="readonly"/>
													currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1" readonly="readonly"/>
												</div>
												</form>
												
											</c:if>
											
											<%-- 
											<% 
												MainCommentList list = new MainCommentList();
												list = request.getAttribute("comm");
												System.out.println(request.getAttribute("comm"));
												for (MainCommentVO vo : request.getAttribute("comm")){
													
												}
												int index;
												int line = 1;
												// for (index = 0; index < co.content.length() - 1)
											
											
											%> 
											
											<c:set var="index" value="0"/>
											<c:set var="line" value="1"/>
											<c:forEach var="linecheck" end="${index == co.content.length() - 1}" items="${co.content.charAt(<%= index %>)}">
												${linecheck}
												<c:if test="${linecheck == 'd'}">
													<c:set var="line" value="${line + 1}"/>
												</c:if>
												<c:set var="index" value="${index + 1}"/>
											</c:forEach><br/>
											${line}
											<c:if test="${line > 20}">
												<input class="btn btn-warning btn-sm" type="button" value="댓글 펼치기" />
											</c:if> 
											--%>
											
										</div><hr/>
									</c:if>
									
									<!-- 삭제된 댓글일 경우 표시 -->
									<c:if test="${co.deleted == 'yes'}">
										<div>삭제된 댓글입니다</div><hr/>
									</c:if>
								
								</c:forEach>
							</c:if>
							<!-- 댓글이 없는 경우 -->
							<c:if test="${comment.size() == 0}">
								<div style="height: 13em;">
									<marquee><b>댓글이 없습니다</b></marquee>
								</div><hr/>
							</c:if>
						</div>
					</div>
					
				</div>
			</div>
	
	
			<!-- 오른 쪽 새글, 추천 글 -->
			<div class="col-lg-2 bg-light justify-content-center align-items-center">
				<div style="position: sticky; top:5rem;">
					<hr/><h4 align="center">추천 소설</h4><hr/>
						<div class="rankHyper2" style="color: #198754;">
						조회수 TOP 5<br/>
						</div>
						<ol>
							<c:set var="list" value="${selectHit.list}" />
							<c:forEach var="vo" items="${list}">
								<c:if test="${vo.deleted != 'yes'}">
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
							<fmt:formatDate var="todaydate" value="${todayDate}" pattern="yy/MM/dd"/>
							<fmt:formatDate var="writedate" value="${vo.writeDate}" pattern="yy/MM/dd"/>
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
	</div>
	
</div>	

</body>
</html>