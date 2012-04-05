{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}
{% block flag %}{{ section.name|upper }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
{% endblock %}

{% block content %}

{% fetch editorial from article with [
	'limit': 1,
	'order': 'weight desc, created desc',
	'where': 'status = 1',
	'withTags': ['editorial']
] %}

{% fetch columns from article with [
	'limit': 4,
	'order': 'weight desc, created desc',
	'where': 'status = 1',
	'withTags': ['column']
] %}

{% fetch letters from article with [
	'limit': 8,
	'order': 'weight desc, created desc',
	'where': 'status = 1',
	'withTags': ['letters']
] %}

{% fetch cartoon from media with [
	'limit': 1,
	'order': 'weight desc, created desc',
	'where': 'status = 1',
	'withTags': ['cartoon']
] %}
{% set cartoon = cartoon.shift() %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<div class="grid_6 alpha">
		<div class="identifier mmb">Editorial</div>
		
		{% for article in editorial %}
			<h1 class="mmb"><a href="{{ article.url }}">{{ article.headline }}</a> {{ metaRender.dateLine(article.modified) }}<span class="aside"> | {{ article.commentTotal|int2noun('comment') }}</span></h1>
		{% endfor %}
		
		<a href="{{ 'search'|url }}?a=1&amp;tg=editorial" class="head4">More editorials &raquo;</a>
		<hr />
		
		<div class="grid_4 alpha">
			<div class="identifier mmb">Cartoon</div>
			<img src="{{ cartoon.urlPreview }}" alt="{{ cartoon.base_name }}" />
			{{ metaRender.smCred(cartoon) }}
			
			<div class="caption mmb">
				{{ cartoon.caption_formatted }}
			</div>
			
			<p><a href="{{ 'search'|url }}?a=1&amp;tg=cartoon" class="head4">More cartoons &raquo;</a></p>
			
			{% include 'tsn/poll/recent.tpl' %}
		</div>
		
		<div class="grid_2 omega">
			<div class="ind identifier mmb">Letters</div>
			
			<ul class="ind boot mb">
				{% for article in letters %}
					<li><a href="{{ article.url }}" class="head4">{{ article.headline }}</a>
					
					<div>{{ metaRender.dateLine(article.modified) }}<span class="aside"> | {{ article.commentTotal|int2noun('comment') }}</span></div></li>
				{% endfor %}
			
				<li><a href="{{ 'search'|url }}?a=1&amp;tg=letters" class="head4">More letters &raquo;</a></li>
			</ul>
		</div>
	
	</div>
	
	<div class="grid_2 omega">
		<div class="identifier mmb">Columns</div>
		
		{% for article in columns %}
			<a href="{{ article.url }}" class="head3">{{ article.headline }}</a>
			{% if article.authors.length %}
				<div class="dateline sm">By {{ article.authors.splat('name')|join(', ')|upper }}</div>
			{% endif %}
			
			<div class="abstract mb">{{ article.abstract }}
				<div>{{ metaRender.dateLine(article.modified) }}<span class="aside"> | {{ article.commentTotal|int2noun('comment') }}</span></div>
			</div>
		{% endfor %}
		
		<a href="{{ 'search'|url }}?a=1&amp;tg=column" class="head4">More columns &raquo;</a>
	</div>
	
	<div class="clear mb"> </div>		
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/section_min.tpl' %}
</div>

<div class="clear mbb"> </div>
{% endblock content %}