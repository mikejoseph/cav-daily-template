{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}
{% block flag %}{{ section.name|upper }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
{% endblock %}

{% block content %}
{% set topStory = articles.shift() %}
{% set centerStories = articles.shift(6) %}
{% set sidebar = articles.shift(2) %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}

<div class="grid_8">
	<div class="grid_6 alpha">
		{{ articleRender.dom(topStory) }}

		<ul class="hat mb">
			{% for article in centerStories %}
				{{ articleRender.list(article) }}
			{% endfor %}
		</ul>

	</div>

	<div class="grid_2 omega">
		{% for article in sidebar %}
			{{ articleRender.sidebar(article) }}
		{% endfor %}
		
	</div>
	
	
	<div class="clear mb"> </div>
	
	<div class="grid_4 alpha">
		{% include 'gryphon/main/modules/section_blogs.tpl' %}
	
		<div class="wrap mmb">
			<h6 class="ind">More {{ section.name }}</h6>
		</div>
		
		<ul class="ind">
			{% for article in articles %}
				<li><a href="{{ article.url }}">{{ article.headline }}</a> {{ metaRender.dateLine(article.modified) }}</li>
			{% endfor %}
		</ul>
		
		<h4 class="ind"><a href="{{ 'search'|url }}?a=1&amp;tg={{ section.tags.splat('name')|join(',') }}">{{ section.name }} archive &raquo;</a></h4>
	</div>
	
	<div class="grid_4 omega">
		{% include 'gryphon/main/modules/section_mm.tpl' %}
	</div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/section_min.tpl' %}
</div>

<div class="clear mbb"> </div>
{% endblock content %}