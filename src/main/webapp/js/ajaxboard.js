const login = new XMLHttpRequest(); // 로그인용
const boardshow = new XMLHttpRequest(); // 글 내용 출력용

//	페이지가 로드되자마자 화면에 전체 데이터가 보여지게 하기 위해서 onload 이벤트에서
//	searchFunction() 함수를 실행함
//	onload = function () {
//		searchFunction()
//	}

function commentFormCheck(obj) {
	console.log(obj.content.value)
	if (!obj.content.value || obj.content.value.trim().length == 0) {
		alert('내용을 입력하세요')
		obj.content.value= ''
		obj.content.focus()
		return false;
	}
	return true;
}


//	ajax 로그인 요청 함수
function loginFunction() {
	console.log('loginFunction()')
	
	const url = './AjaxLogin?id=' + encodeURIComponent($('#id').val())
				+ '&pw=' + encodeURIComponent($('#pw').val())
	console.log(url)
	login.open('GET', url, true)
	login.send(null)
	login.onreadystatechange = loginProcess
}

function loginProcess() {
	console.log('loginProcess() 함수에서 요청한 AJAX가 완료되면 자동으로 실행되는 함수')
	
	if (login.readyState == 4 && login.status == 200) {
		let obj = eval('(' + login.responseText + ')')
		let result = obj.result
		let tbody = document.getElementById('ajaxTable')
		tbody.innerHTML = ''
		
		for (let i = 0; i < result.length; i++) {
			let row = tbody.insertRow(i)
			for (let j = 0; j < result[i].length; j++) {
				let cell = row.insertCell(j)
				cell.style.textAlign = "center"
				cell.innerHTML = result[i][j].value
			}
		}
	
	}
}

//	ajax 글 내용 출력 함수
function boardshowFunction() {
	console.log('boardshowFunction()')
	
}
