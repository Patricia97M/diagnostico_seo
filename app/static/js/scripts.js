$(function(e){

	function adaptHeaderFull() {
		var navbarHeight = $('#navbar_container').css('height');
		$('#header_page').find('.header-full-screen').css('height','calc(100vh - '+navbarHeight+')');
	}
	setInterval(function(){ adaptHeaderFull(); }, 1000 );

	

/********************  ********************/


        function on() {
            document.getElementById("overlay-section").style.display = "block";
        }
    
        function off() {
            document.getElementById("overlay-section").style.display = "none";
        }

/********************  ********************/


	
});