function categorySearch(){
	// console.log('categorySearch 실행')
	let category = document.getElementById('category').options[document.getElementById('category').selectedIndex].value
	// console.log('category: '+ category) // ok
	
	document.getElementsByName('searchVal')[0].value = category
	document.getElementById('search').submit()
}


















