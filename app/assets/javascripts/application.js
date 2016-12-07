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
//= require turbolinks
//= require_tree .

flag = true;
function doSmth(event) {
	if ($(event.target).parents(".row").find('.hidden-column').hasClass('show_disciplines') || 
		$(event.target).parents(".row").find('.hidden-column').hasClass('show_disciplines')) 
	{
		$(event.target).parents(".row").find('.hidden-column').removeClass('show_disciplines');
		$(event.target).find('.hidden-column').removeClass('show_disciplines');
	}
	else 
	{
		$(event.target).parents(".row").find('.hidden-column').addClass('show_disciplines');
		$(event.target).find('.hidden-column').addClass('show_disciplines');
	}
	return false;
}

// function doSmth(event) {
//     if ($(this).find('.hidden-column').hasClass('show_disciplines'))
// 		$(this).find('.hidden-column').removeClass('show_disciplines')
// 	else 
// 		$(this).find('.hidden-column').addClass('show_disciplines');
// 	return false;
// };