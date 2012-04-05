{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}
{% block activeNav %}home{% endblock %}
{% block styles %}
<link rel="stylesheet" type="text/css" href="{{ 'gfn-blackletter/css/thickbox.css'|url }}" media="screen, projection" />
{% endblock %}

{% block scripts %}
<script type="text/javascript" src="{{ 'gfn-blackletter/js/thickbox-compressed.js'|url }}"></script>
{% endblock %}

{% block content %}
{% helper dswSync %}
{% import "macros/meta.tpl" as metaRender %}

{% set mugShot = page.media.grab('meta', 'mugshot', true) %}
{% set images = page.media.grab('type', 'image', true) %}

{% set video = page.media.grab('type', 'video', true) %}
{% set audio = page.media.grab('type', 'audio', true) %}
{% set slides = page.media.grab('type', 'soundSlide', true) %}
{% set interactives = page.media.grab('type', 'flash', true) %}
{% set pdfs = page.media.grab('type', 'pdf', true) %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>{{ page.title }}</h1>
	
	<div class="mmb"> </div>
	
	{% if page.sidebar or video.length or audio.length or slides.length or interactives.length or pdfs.length or images.length %}
	<div id="story-sidebar" class="grid_4 omega">	
		{% if page.sidebar %}
			<div class="hat mmb">
				<div class="infobox">
					{{ page.sidebar_formatted }}
				</div>
			</div>
		{% endif %}
	
		{% for image in images %}
			<div class="mmb"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" /></div>
			
			{% if config.get('dsw:fotobroker:url') %}
				{% if not 'skip import'|in(image.meta) %}
					{% if dswSync.buyURL(image) %}
						<a href="{{ dswSync.buyURL(image) }}" class="reprints-button"></a>
					{% else %}
						<a href="{{ config.get('dsw:fotourl')|url }}" class="reprints-button"></a>
					{% endif %}
				{% endif %}
			{% endif %}
			
			{{ metaRender.smCred(image) }}
		
			<div class="clear mmb"> </div>
			<div class="caption mmb">
				{{ image.caption_formatted }}
			</div>
		{% endfor %}
	
		{% if video.length or audio.length or slides.length or interactives.length or pdfs.length %}
			<div class="wrap mmb">
				<h6>Multimedia</h6>
			</div>
			{% for item in video %}{{ render.section(item) }}{% endfor %}
			{% for item in audio %}{{ render.section(item) }}{% endfor %}
			{% for item in slides %}{{ render.section(item) }}{% endfor %}
			{% for item in interactives %}{{ render.listItem(item) }}{% endfor %}
			{% for item in pdfs %}{{ render.section(item) }}{% endfor %}
		{% endif %}
		
	</div><!-- #story-sidebar -->
	{% endif %}
	
	{% for item in mugShot %}
		<div class="thumb">
			<img src="{{ item.urlThumbnail }}" alt="{{ item.base_name }}" />
			<div class="aside"><strong>{{ item.caption_formatted }}</strong></div>
		</div>
	{% endfor %}

	<div class="body-copy boot mmb">
		{{ page.content_formatted }}
		<div class="clear"> </div>
	</div>
	
	<div class="caption mmb">
		Updated {{ page.modified|date('F j, Y') }}
	</div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>
<div class="clear"> </div>
{% endblock content %}