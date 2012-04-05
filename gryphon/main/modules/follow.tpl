{% set items = config.get('dsw:followurls') %}
<div class="wrap mmb">
	<h6 class="ind">Follow us</h6>
</div>

<ul class="ind boot mb">
	{% for key, val in items %}
	<li>
		{% if val.icon %}
			{% set path = 'gfn-blackletter/assets/tools/' ~ val.icon %}
			<img src="{{ path|url }}" alt="" style="position:relative;top:2px;" />&nbsp;
		{% endif %}
		<a href="{{ val.url|url }}" class="head4">{{ val.label }}</a>
	</li>
	{% endfor %}
	<li><a href="{{ 'page/feeds'|url }}">More feeds &raquo;</a></li>
</ul>

{% include 'gryphon/ads/button_120x60.tpl' %}