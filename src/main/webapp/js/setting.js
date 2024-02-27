function setting(idx, mode, title, name, content) {
	let frm = document.commentForm // 댓글 폼을 저장함
//	수정 또는 삭제할 댓글 번호를 넣어줌, 댓글 입력 작업 시는 0을 넣어줌
	frm.idx.value = idx
//	commentOK.jsp에서 사용할 댓글 작업 모드를 넣어줌: 1 → 저장, 2 → 수정, 3 → 삭제
	frm.mode.value = mode
//	submit 버튼에 표시할 텍스트를 넣어줌	
	frm.title.value = title
//	수정 또는 삭제할 댓글 작성자 이름을 댓글 폼의 name 속성이 name인 텍스트 상자에 넣어줌	
	frm.name.value = name
//	수정 또는 삭제할 댓글 내용을 댓글 폼의 name 속성이 content인 textarea에 넣어줌
	while (content.indexOf('<br/>') != -1) {
		content = content.replace('<br/>', '\r\n')
	}
	frm.content.value = content
}