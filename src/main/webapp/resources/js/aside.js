$(document).ready(function() {

	$(window).resize(function() {

		$checkWidth = $(window).width();

		if ($checkWidth > 980) {
			$("aside ul").css("display", "block");
		} else {
			$("aside ul").css("display", "none");
		}
	});

	$("aside h3").click(function() {

		if ($(window).width() < 980) {
			$(this).next("ul").slideToggle();

		}

	});

});
