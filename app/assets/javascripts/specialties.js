//Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

flag = false;
function doSmth(event) {
	if (flag == true) {
		$(event.target).parents(".row").find('.hidden-column').hide();
		$(event.target).find('.hidden-column').hide();
		flag = false;
	}
	else {
		$(event.target).parents(".row").find('.hidden-column').show();
		$(event.target).find('.hidden-column').show();
		flag = true;
	}
	return false;
}