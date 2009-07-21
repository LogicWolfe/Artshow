// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
//http://kendsnyder.com/sandbox/mouseenter.html
Element.addMethods({
    onmouseenter: function(element,observer) {
        element = $(element);
        element.observe('mouseover',function(evt,currentTarget) {
            var relatedTarget = $(evt.relatedTarget || evt.fromElement);
            if( relatedTarget!=currentTarget && relatedTarget.childOf(currentTarget)==false ) {
                observer();
            } 
        }.bindAsEventListener({},element));
        return element;
    },
    onmouseleave: function(element,observer) {
        element = $(element);
        element.observe('mouseout',function(evt,currentTarget) {
            var relatedTarget = $(evt.relatedTarget || evt.toElement);
            if( relatedTarget!=currentTarget && relatedTarget.childOf(currentTarget)==false ) {
                observer();
            } 
        }.bindAsEventListener({},element));
        return element;
    }
});
