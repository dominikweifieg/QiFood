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
