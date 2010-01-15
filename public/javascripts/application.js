// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function add_effect(effect, id)
{
	if($('effect_finder'))
	{
		new Insertion.Top('effect_finder', '<input type="hidden" name="effect_ids[]" id="effect_' + id + '" value="' + id + '"/>');
	}
	v = $('effects').value.strip().split("\n");
	v.pop();
	v.push(effect);
	$('effects').value = v.join("\n") + "\n";
	$('effects').focus();
}

function add_author(name, id)
{
	new Insertion.After('selected', '<input type="hidden" name="author_ids[]" id="author_' + id + '" value="' + id + '"/>');
	span_id = "author_name_" + id;
	new Insertion.Bottom('selected', '<span id="' + span_id + '">' + name + "</span>&nbsp;&nbsp; ");
	new Effect.Highlight(span_id)
}

function update_start_end_dates(element, value)
{
	if($('event_start_3i').value > $('event_end_3i').value)
	{
		$('event_end_3i').value = $('event_start_3i').value;
	}
	if($('event_start_2i').value > $('event_end_2i').value)
	{
		$('event_end_2i').value = $('event_start_2i').value;
	}
	if($('event_start_1i').value > $('event_end_1i').value)
	{
		$('event_end_1i').value = $('event_start_1i').value;
	}
	if($('event_start_4i').value > $('event_end_4i').value)
	{
		$('event_end_4i').value = parseInt($('event_start_4i').value) + 1;
	}
}

function hide_aliment_preview()
{
	$("aliment_preview").each(function(preview)
	{
		preview.fade();
	});
}

function getPageSize() {
      
   var xScroll, yScroll;

if (window.innerHeight && window.scrollMaxY) {	
	xScroll = window.innerWidth + window.scrollMaxX;
	yScroll = window.innerHeight + window.scrollMaxY;
} else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
	xScroll = document.body.scrollWidth;
	yScroll = document.body.scrollHeight;
} else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
	xScroll = document.body.offsetWidth;
	yScroll = document.body.offsetHeight;
}

var windowWidth, windowHeight;

if (self.innerHeight) {	// all except Explorer
	if(document.documentElement.clientWidth){
		windowWidth = document.documentElement.clientWidth; 
	} else {
		windowWidth = self.innerWidth;
	}
	windowHeight = self.innerHeight;
} else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
	windowWidth = document.documentElement.clientWidth;
	windowHeight = document.documentElement.clientHeight;
} else if (document.body) { // other Explorers
	windowWidth = document.body.clientWidth;
	windowHeight = document.body.clientHeight;
}	

// for small pages with total height less then height of the viewport
if(yScroll < windowHeight){
	pageHeight = windowHeight;
} else { 
	pageHeight = yScroll;
}

// for small pages with total width less then width of the viewport
if(xScroll < windowWidth){	
	pageWidth = xScroll;		
} else {
	pageWidth = windowWidth;
}

return [pageWidth,pageHeight];
}