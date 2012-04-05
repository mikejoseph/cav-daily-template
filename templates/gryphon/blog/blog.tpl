{% extends "gryphon/base.tpl" %}
{% block title %} :: Blogs : {{ blog.name }}{% endblock %}
{% block description %}{{ blog.description_formatted|striptags }}{% endblock %}
{% block activeNav %}blogs{% endblock %}
{% block flag %}Blogs{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ blog.name }}" href="{{ blog.url }}.xml" />
{% endblock %}

{% block content %}
{% import 'macros/meta.tpl' as metaRender %}
<div class="grid_8">
	<div class="right"><img src="{{ 'gfn-blackletter/assets/49.png'|url }}" style="position:relative;top:2px;" /> <a href="{{ blog.url }}.xml">RSS</a></div>
	<h1>{{ blog.name }}</h1>
		
	<div class="mmb"> </div>
	
	{% set image = blog.media.grab('type', 'image', true).shift() %}
	{% if image %}
		<div class="image mb">
			<a href="{{ blog.url }}"><img src="{{ image.urlOriginal }}" alt="{{ blog.slug }}" /></a>
		</div>
	{% endif %}
	
	<div class="body-copy boot mmb">
		{{ blog.description_formatted }}
	</div>
	
	{% for post in posts %}
		<h3 class="mmb"><a href="{{ post.url }}">{{ post.headline }}</a> &nbsp;<span class="aside2">{{ post.commentTotal|int2noun('comment') }} |</span> {{ metaRender.dateLine(post.created) }}</h3>
		
		<div>
			{{ post.abstract_formatted }}
			<p><a href="{{ post.url }}">Continue reading &raquo;</a></p>
		</div>
		
		<div class="clear mmb"></div>
		<hr class="mb" />
	{% endfor %}
	
	<div class="pagination"><ul>
	{% if pagination.getPrevious() %}
		<li><a href="{{ pagination.getPrevious().url }}">&laquo;</a></li>
	{% endif %}
	{% for page in pagination.getPages() %}
		{% if page.isCurrent() %}
			<li class="active"><a href="{{ page.url }}">{{ page.label }}</a></li>
		{% else %}
			<li><a href="{{ page.url }}">{{ page.label }}</a></li>
		{% endif %}
	{% endfor %}
	{% if pagination.getNext() %}
		<li><a href="{{ pagination.getNext().url }}">&raquo;</a></li>
	{% endif %}
	</ul>
	<div class="clear"></div></div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear mbb"></div>
{% endblock content %}