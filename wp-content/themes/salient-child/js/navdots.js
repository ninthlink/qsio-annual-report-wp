
jQuery(function($){
	$('#top nav ul.sf-menu > li a').each( function(){
		var label,
		    el = $(this);
		el.after('<span>'+ el.text() + '</span>');
		el.text('');
		label = $(this.nextSibling);
		// transition end to hide the element
		label.on('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',
			function(evt){
				// console.log(evt.originalEvent.propertyName);
				if(evt.originalEvent.propertyName == 'opacity' && label.css('opacity') == 0){
					label.css('display','none');
					// console.log('transitionend opacity on', label);
				}
			}
		);
		// make sure to show it before transition
		el.on('mouseenter', function(){
			label.css('display','block');
			// console.log('mouseenter');
		});
	});
});