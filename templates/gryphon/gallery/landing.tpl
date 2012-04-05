{% extends "gryphon/base.tpl" %}
{% block title %} :: Multimedia : Photo Galleries{% endblock %}
{% block activeNav %}multimedia{% endblock %}
{% block flag %}Multimedia{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}
{% set top = galleries.shift() %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<div id="galtabs">
		<ul id="galtabs_list">
			{% for image in top.media %}
				<li><a href="#galimg{{ loop.index }}"></a></li>
			{% endfor %}
		</ul>
		
		{% for image in top.media %}
			{% if loop.first %}
				{% set prevLink = null %}
			{% else %}
				{% set prevLink = (loop.index - 1) %}
			{% endif %}
			
			{% if loop.index == top.media.length %}
				{% set nextLink = null %}
			{% else %}
				{% set nextLink = (loop.index + 1) %}
			{% endif %}
			<div id="galimg{{ loop.index }}" class="panel ui-tabs-hide">
				<div class="grid_6 alpha">
					<div class="imgbox mmb">
						<img src="{{ image.url }}" alt="{{ image.base_name }}" />
					</div>
					
					<!--
					{% if not 'skip import'|in(image.meta) %}
						{% if dswSync.buyURL(image) %}
							<a href="{{ dswSync.buyURL(image) }}" class="reprints-button"></a>
						{% else %}
							<a href="{{ config.get('dsw:fotourl')|url }}" class="reprints-button"></a>
						{% endif %}
					{% endif %}
					-->
					{{ metaRender.smCred(image) }}
				</div>
				
				<div class="grid_2 omega">
					<div class="galnav mmb">
						{% if nextLink %}
							<a href="#galimg{{ nextLink }}" class="next"></a>
						{% else %}
							<a class="next-inactive"></a>
						{% endif %}
						
						{% if prevLink %}
							<a href="#galimg{{ prevLink }}" class="prev"></a>
						{% else %}
							<a class="prev-inactive"></a>
						{% endif %}
					
						<strong>Image {{ loop.index }} of {{ top.media.length }}</strong>
						<div class="clear mmb">&nbsp;</div>
						<hr class="light mmb" />
					
						<div class="caption">{{ image.caption_formatted }}</div>
					</div>
				</div>
			</div>
		{% endfor %}
	</div>

	<div class="clear"></div>
	<div class="mmb"></div>
	
	<div class="grid_6 alpha">
		<h3 class="mmb"><a href="{{ top.urlDefault }}">{{ top.title }}</a></h3>
		
		<div class="abstract boot mmb">
			{{ top.description_formatted }}
		</div>
		
		<div class="caption mmb">Published {{ top.created|date('F j, Y') }}</div>
	</div>
	
	<div class="grid_2 omega">
		{% set toolitem = top %}
		{% include 'gryphon/multimedia/tools.tpl' %}
	</div>
	
	<div class="clear mb"></div>
	
	{% for item in galleries %}
	<div class="wrap grid_4 mb{% if loop.index % 2 == 1 %} alpha{% else %} omega{% endif %}">
		<div class="mmbox">
			<div class="thumb">
				<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" alt="{{ item.slug }}" /></a>
			</div>
			
			<div class="aside"><h4><img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" alt="" />&nbsp;&nbsp;<a href="{{ item.urlDefault }}">{{ item.title }}</a></h4></div>
			<div class="sm">{{ metaRender.dateLine(item.created) }} <span class="dateline">| {{ item.media.length }} IMAGES</span></div>
		</div>
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
	
	<div class="mb"></div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/multimedia.tpl' %}
</div>

<div class="clear mbb"></div>
{% endblock content %}
