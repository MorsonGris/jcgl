$(document).ready(function() {
	$("#contact").click(function () {
        document.getElementById('light').style.display='block';
        /* document.getElementById('fade').style.display='block'; */
    })
    $("#contact2").click(function () {
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
    $("#maps").click(function () {
        document.getElementById('map').style.display='block';
        /* document.getElementById('fade').style.display='block'; */
    })
    $("#closeMap").click(function () {
        document.getElementById('map').style.display='none';
        /* document.getElementById('fade').style.display='none'; */
    })
	$.goup({
        trigger: 100,
        bottomOffset: 300,
        locationOffset: 2,
    })
	
})