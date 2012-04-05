{% extends "gryphon/base.tpl" %}
{% block title %} :: Print Edition{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% fetch fronts from media with [
	'limit': 4,
	'order': 'created desc',
	'where': 'status = 1',
	'withTags': ['pdffrontpage']
] %}
{% fetch sports from media with [
	'limit': 4,
	'order': 'created desc',
	'where': 'status = 1',
	'withTags': ['pdfsportspage']
] %}

{% import "macros/meta.tpl" as metaRender %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>Print Edition</h1>
	
	<div class="mmb"> </div>
	
	<div class="body-copy boot mb">
		<p>Click the thumbnails below to download PDFs of recent pages from our print edition.</p>
	</div>
	
	<div class="wrap shade mb">
		<div class="right ind"><a href="{{ 'search'|url }}?a=1&amp;tg=pdffrontpage">More &raquo;</a></div>
		<h6 class="ind mmb">Front Pages</h6>
	
		{% for item in fronts %}
			<div class="grid_2{% if loop.index == 1 %} alpha{% elseif loop.index == 4 %} omega{% endif %} mmb" style="text-align:center;">
				<a href="{{ item.urlOriginal }}"><img src="{{ item.urlThumbnail }}" /></a>
				<br /><strong class="caption">{{ item.title }}</strong>
			</div>
		{% endfor %}
		<div class="clear"> </div>
	</div>
	
	<div class="wrap shade mb">
		<div class="right ind"><a href="{{ 'search'|url }}?a=1&amp;tg=pdfsportspage">More &raquo;</a></div>
		<h6 class="ind mmb">Sports Pages</h6>
	
		{% for item in sports %}
			<div class="grid_2{% if loop.index == 1 %} alpha{% elseif loop.index == 4 %} omega{% endif %} mmb" style="text-align:center;">
				<a href="{{ item.urlOriginal }}"><img src="{{ item.urlThumbnail }}" /></a>
				<br /><strong class="caption">{{ item.title }}</strong>
			</div>
		{% endfor %}
		<div class="clear"> </div>
	</div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>
<div class="clear"> </div>
{% endblock content %}