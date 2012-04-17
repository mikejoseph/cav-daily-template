$(document).ready(function() {
	$('.carousel').carousel({
		interval: 5000
	});

	$('#main-navigation ul li ul').css({
		'display': 'none',
		'opacity': 1
	});
	var _current = $('#main-navigation .selected');
	_current.children('ul').css('display', 'block');

	$('#main-navigation > div > div > ul > li').mouseenter(function(e) {
		var $this = $(this);
		$this.siblings().find('ul').css('display', 'none');
		$this.children('ul').css('display', 'block');
	}).mouseleave(function(e) {
		if( _current.length > 0 ) {
			_current.children('ul').css('display', 'block');
			_current.siblings().find('ul').css('display', 'none');
		}
	});

	$('.fancybox').fancybox();
});