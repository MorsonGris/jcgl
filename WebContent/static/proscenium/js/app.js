$(document).ready(function() {
	$("#phone").click(function () {
        document.getElementById('light').style.display='block';
        /* document.getElementById('fade').style.display='block'; */
    })
    $("#closePhone").click(function () {
        document.getElementById('light').style.display='none';
        /* document.getElementById('fade').style.display='none'; */
    })   
	$.goup({
        trigger: 100,
        bottomOffset: 250,
        locationOffset: 2,
    })
	
})