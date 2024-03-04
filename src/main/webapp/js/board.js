function setting(idx, mode) {
	// console.log('setting(' + mode + ')')
	// console.log('form'+ idx)
	if (mode == 1) {
		document.getElementById('updateform'+ idx).style.display = 'block'
		document.getElementById('replyform'+ idx).style.display = 'none'
	} else if (mode == 2) {
		document.getElementById('updateform'+ idx).style.display = 'none'
		document.getElementById('replyform'+ idx).style.display = 'block'
	} else if (mode == 3) {
		document.getElementById('updateform'+ idx).style.display = 'none'
		document.getElementById('replyform'+ idx).style.display = 'none'
	}
}

function commentFormCheck(obj) {
	console.log(obj.name.value)
	console.log(obj.content.value)
	if (!obj.name.value || obj.name.value.trim().length == 0) {
		alert('이름을 입력하세요')
		obj.name.value= ''
		obj.name.focus()
		return false;
	} else if (!obj.content.value || obj.content.value.trim().length == 0) {
		alert('내용을 입력하세요')
		obj.content.value= ''
		obj.content.focus()
		return false;
	}
	return true;
}

function commentUpdateFormCheck(obj) {
	console.log('commentUpdateFormCheck()')
}
