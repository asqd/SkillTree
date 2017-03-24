// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-throttle-debounce
//= require react
//= require react_ujs
//= require components
//= require_tree .
//= require tether
//= require bootstrap

window.htypes = {
  "Зач": "Зачет",
  "К/п": "Курсовые проекты",
  "К/р": "Курсовые работы",
  "КСР": "Контроль самостоятельной работы",
  "Лаб": "Лабораторные работы",
  "Лек": "Лекции",
  "Пр": "Практические занятия",
  "СРС": "Самостоятельная работа студента",
  "Экз": "Экзамен"
}

window.htype_bages = {
  "Зач": "warning",
  "К/п": "default",
  "К/р": "default",
  "КСР": "info",
  "Лаб": "info",
  "Лек": "success",
  "Пр": "info",
  "СРС": "default",
  "Экз": "warning"
}

$(window).load(function(){
	// accordion settings
  $("#accordion .specialty-row").accordion({
    collapsible: true,
    autoHeight: false,
    active: false,
    navigation: true,
    heightStyle: "content"
	});

  // make links in accordion works
  $('#accordion a').click(function(e) {
    if (!$(this).hasClass('delete-link')) {
      e.stopPropagation();
    }
  })

	$('#accordion').find('.specialty-row').bind('click', function() {
    var id = $(this).data('id');
    $.getScript('/disciplines/by_specialty/' + parseInt(id), function(){
    })
	});


	$(window).bind('scroll', function(e) {
		scrolled()
	})

	var flag = false;

	function scrolled()
	{

		var $scrolled = $(window).scrollTop()
		var $header = $('.header-top').height()

		if($scrolled >= $header)
		{
			if(flag == false)
			{
				$('header').addClass('fixed')
				flag = true
			}
		}
		if($scrolled < $header)
		{
			if(flag == true)
			{
				$('header').removeClass('fixed')
				flag = false
			}
		}
	}
});