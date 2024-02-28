<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-color: green;
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
	display: inline-block;
	float: left;
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
	<div class="container">
		<div id="div0">
			<img src="#" alt="이미지 없음" />
		</div>

		<div>
			<div id="div1" style="padding-left: 10em">
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
		</div>

		<div id="divA"
			style="text-align: right; padding-top: 20px; padding-right: 20px">
			<input class="btn btn-primary" type="button" value="login"
				style="width: 35%" /> <input class="btn btn-dark" type="button"
				value="register" style="width: 50%" />
		</div>

		<div id="div2">
			div2
			<div id="div2_1">subject</div>

			<div id="div2_2">explain</div>

			<form action="#" method="post">
				<div id="div2_3" align="center">
					<input class="category" type="radio" value="작성자">글쓴이 <input
						class="category" type="radio" value="제목" /> 제목 <input type="text"
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
							<div class="login-wrap p-4 p-md-5">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-user-o"></span>
								</div>
								<h3 class="text-center mb-4">Sign In</h3>
								<form action="" class="login-form">
									<div class="form-group">
										<input type="text" class="form-control rounded-left"
											placeholder="Username" required>
									</div>
									<div class="form-group d-flex">
										<input type="password" class="form-control rounded-left"
											placeholder="Password" required>
									</div>
									<div class="form-group">
										<button type="submit"
											class="form-control btn btn-primary rounded submit px-3">Login</button>
									</div>
									<div class="form-group d-md-flex">
										<div class="w-50">
											<label class="checkbox-wrap checkbox-primary">Remember
												Me <input type="checkbox" checked> <span
												class="checkmark"></span>
											</label>
										</div>
										<div class="w-50 text-md-right">
											<a href="#">Forgot Password</a>
										</div>
									</div>
								</form>
							</div>
						</td>
					</tr>
					<tr>
						<td style="border: 1px solid blue; height: 13em"></td>
					</tr>

				</table>

			</div>
		</div>

		<div id="div4">div4</div>

		<div id="div5">div5</div>


	</div>


</body>
</html>