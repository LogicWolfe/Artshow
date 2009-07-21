window.addEvent('domready', function(){
var info_slide = new Fx.Slide('info_box', {mode: 'horizontal', wait:false});

$('main').addEvent('mouseenter',function(e){
    var event = new Event(e);
	info_slide.slideIn();
	event.stop();
});

$('main').addEvent('mouseleave',function(e){
    var event = new Event(e);
	info_slide.slideOut();
	event.stop();
});
});