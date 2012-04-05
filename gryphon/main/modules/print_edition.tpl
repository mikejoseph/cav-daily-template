{% fetch printed from media with [
	'limit': 1,
	'order': 'created desc',
	'where': 'status = 1',
	'withTags': ['printedition']
] %}
{% set printed = printed.shift() %}

<div class="wrap shade mb">
	<h6 class="ind mmb"><a href="http://issuu.com/otterbein/docs">Print edition &raquo;</a></h6> 
	<div class="mmb" style="text-align:center;">
		{% if printed.uid %}
			<a href="{{ printed.urlDefault }}"><img src="{{ printed.urlThumbnail }}" /></a>
		{% endif %}
	</div>
</div>
