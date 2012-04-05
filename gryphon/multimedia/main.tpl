{% extends "gryphon/base.tpl" %}
{% block title %} :: Multimedia : {{ media[0].title }}{% endblock %}
{% block description %}{{ media[0].caption_formatted|striptags }}{% endblock %}
{% block activeNav %}multimedia{% endblock %}
{% block flag %}Multimedia{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="Multimedia" href="{{ '/'|url }}multimedia.xml" />
{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}
{% import "macros/render.tpl" as render %}

{% set top = media.shift() %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<div class="grid_6 alpha">
	{% if top %}
		<div class="mmb">{{ render.media(top) }}</div>

		<h3 class="mmb"><a href="{{ top.urlMultimedia }}">{{ top.title }}</a></h3>
	
		<div class="mmb">{{ metaRender.byLine(top) }}</div>
		<div class="abstract boot mmb">
			{{ top.caption_formatted }}
		</div>
		
		<div class="caption mmb">Published {{ top.created|date('F j, Y') }}</div>
	{% endif %}
	</div>
	
	<div class="grid_2 omega">
		<ul class="ind hat mb">
			<li><img src="{{ 'gfn-blackletter/assets/icons/video.png'|url }}" alt="" />&nbsp;&nbsp;<a href="{{ 'multimedia/video'|url }}" class="head4">Video</a></li>
			
			<li><img src="{{ 'gfn-blackletter/assets/icons/audio.png'|url }}" alt="" />&nbsp;&nbsp;<a href="{{ 'multimedia/audio'|url }}" class="head4">Audio</a></li>
			
			{#
			<li><img src="{{ 'gfn-blackletter/assets/icons/slideshow.png'|url }}" alt="" />&nbsp;&nbsp;<a href="{{ 'multimedia/soundSlide'|url }}" class="head4">Slideshows</a></li>
			#}
			
			<li><img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" alt="" />&nbsp;&nbsp;<a href="{{ 'gallery'|url }}" class="head4">Photo galleries</a></li>
		</ul>
		
	
		{% set toolitem = top %}
		{% include 'gryphon/multimedia/tools.tpl' %}
		<div class="clear mb"></div>
		
		{% if top.articles.length %}
		<div class="mb">
			<div class="caption aside"><strong>Related:</strong></div>
			{% for article in top.articles %}
			<div class="aside mmb"><a href="{{ article.url }}">{{ article.headline }}</a></div>
			{% endfor %}
		</div>
		{% endif %}		
	</div>

	<div class="clear"></div>
	
	{% for item in media %}
	<div class="wrap grid_4 mb{% if loop.index % 2 == 1 %} alpha{% else %} omega{% endif %}">
		{{ render.mm(item) }}
	</div>
	{% endfor %}
	
	<div class="clear"></div>
	<hr class="mmb" />
	
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
	{% include 'gryphon/main/sidebar/multimedia.tpl' %}
</div>

<div class="clear mbb"></div>
{% endblock content %}