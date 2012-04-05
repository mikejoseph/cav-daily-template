{% extends "gryphon/base.tpl" %}
{% block title %} :: Blogs{% endblock %}
{% block activeNav %}blogs{% endblock %}
{% block flag %}Blogs{% endblock %}
{% block content %}
{% import 'macros/meta.tpl' as metaRender %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}

<div class="grid_8">
	<h1>{{ config.get('publication:name') }} Blogs</h1>
		
	<div class="mmb"> </div>
	
	<div class="body-copy boot mmb">
		<p>Opinions expressed in blog posts are those of the authors, and not of {{ config.get('publication:name') }}.</p>
	</div>
	
	{% for blog in blogs %}
		{% set posts = blog.blogPosts %}
		<h3 class="mmb"><a href="{{ blog.url }}">{{ blog.name }}</a> &nbsp;<span class="aside2">{{ posts.length|int2noun('entry') }} | <a href="{{ blog.url }}.xml">RSS</a> | Last updated:</span> {{ metaRender.dateLine(posts[0].created) }}</h3>
		
		{% set image = blog.media.grab('type', 'image', true).shift() %}
		{% if image %}
			<div class="image mb">
				<a href="{{ blog.url }}"><img src="{{ image.urlOriginal }}" alt="{{ blog.slug }}" /></a>
			</div>
		{% endif %}
		
		<div class="caption">
			{{ blog.description_formatted }}
		</div>
		
		<hr class="mb" />
		
	{% endfor %}
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear mbb"></div>
{% endblock content %}