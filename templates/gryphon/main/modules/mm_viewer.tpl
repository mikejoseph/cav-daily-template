{% fetch multimedia from media with [
	'where': 'status = 1 AND type != "image"',
	'limit': 4,
	'order': 'weight desc, created desc',
	'withTags': ['multimedia']
] %}
{% set top = multimedia.shift() %}
{% import "macros/render.tpl" as render %}
{% import "macros/meta.tpl" as metaRender %}

<div class="wrap mmb">
	<h6><a href="{{ 'multimedia'|url }}">Featured multimedia &raquo;</a></h6>
</div>

{% if multimedia.length %}

<div class="mmb">
	{{ render.media(top) }}
</div>

<h3><a href="{{ top.urlMultimedia }}">{{ top.title }}</a>
{% if not top.authors.length %}
	{{ metaRender.dateLine(top.created) }}
{% endif %}
</h3>

{% if top.authors.length %}
	<div class="dateline sm">By {{ top.authors.splat('name')|join(', ') }} | {{ metaRender.dateLine(top.created) }}</div>
{% endif %}

<div class="abstract mb">
	{{ top.caption_formatted }}
</div>

<ul class="hat mb">
	{% for item in multimedia %}
		<li><h4><img src="{{ ('gfn-blackletter/assets/icons/' ~ item.type ~ '.png')|url }}" alt="{{ item.type }}" />&nbsp;&nbsp;<a href="{{ item.urlMultimedia }}">{{ item.title }}</a></h4> {{ metaRender.dateLine(item.created) }}</li>
	{% endfor %}
	<li><h4><a href="{{ 'multimedia'|url }}">More multimedia &raquo;</a></h4></li>
</ul>
{% endif %}
