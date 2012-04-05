{% fetch printed from media with [
        'limit': 1,
        'order': 'created desc',
        'where': 'status = 1',
        'withTags': ['printedition']
] %}
{% set printed = printed.shift() %}

<div class="wrap shade mb">
        <h6 class="ind mmb">Print editions</a></h6>
	<h3 class="ind mmb"><a href="http://issuu.com/otterbein/docs">Tan &amp; Cardinal &raquo;</a></h3>
        <div class="mmb" style="text-align:center;">
                {% if printed.uid %}
                        <a href="{{ printed.urlDefault }}"><img src="{{ printed.urlThumbnail }}" /></a>
                {% endif %}
        </div>

{% fetch printed_mag from media with [
	'limit': 1,
	'order': 'created desc',
	'where': 'status = 1',
	'withTags': ['printedition_magazine']
] %}
{% set printed_mag = printed_mag.shift() %}

	<h3 class="ind mmb"><a href="http://issuu.com/otterbein/docs">1847 Magazine &raquo;</a></h3> 
	<div class="mmb" style="text-align:center;">
		{% if printed_mag.uid %}
			<a href="{{ printed_mag.urlDefault }}"><img src="{{ printed_mag.urlThumbnail }}" /></a>
		{% endif %}
	</div>
</div>
