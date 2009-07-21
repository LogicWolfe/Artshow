
window.addEvent('domready', function(){
var info_slide = new Fx.Slide('info_box_overlay', {wait: false, mode: 'horizontal'});
var info_slide2 = new Fx.Slide('info_box_underlay', {wait: false, mode: 'horizontal'});
$('main').addEvent('mouseenter',function(e){
	
    var event = new Event(e);
	info_slide.slideIn();
	info_slide2.slideIn();
	event.stop();
});

$('main').addEvent('mouseleave',function(e){
    var event = new Event(e);
	info_slide.slideOut();
	info_slide2.slideOut();
	event.stop();
});

});