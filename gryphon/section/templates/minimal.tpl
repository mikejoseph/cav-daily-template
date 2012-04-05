{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}
{% block flag %}{{ section.name|upper }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set sidebar1 = articles.shift(1) %}
{% set sidebar2 = articles.shift(1) %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}

<div class="grid_8">
	<div class="grid_4 alpha">
		{{ articleRender.dom(topStory) }}
		
		<hr class="single" />
		
		<div class="grid_2 alpha">
			{% for article in sidebar1 %}
				{{ articleRender.sidebar(article) }}
			{% endfor %}
		</div>
		
		<div class="grid_2 omega">
			{% for article in sidebar2 %}
				{{ articleRender.sidebar(article) }}
			{% endfor %}
		</div>
	</div>
	
	<div class="grid_4 omega">
		<ul class="boot">
			{% for article in articles %}
				<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> {{ metaRender.dateLine(article.modified) }}</li>
			{% endfor %}
		</ul>
		
		<hr class="single" />
		<h4 class="ind"><a href="{{ 'search'|url }}?a=1&amp;tg={{ section.tags.splat('name')|join(',') }}">{{ section.name }} archive &raquo;</a></h4>
	</div>
	<div class="clear mb"> </div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/section_min.tpl' %}
</div>

<div class="clear mbb"> </div>
{% endblock content %}