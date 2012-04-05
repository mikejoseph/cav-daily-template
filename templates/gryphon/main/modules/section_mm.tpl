{% fetch multimedia from media with [
	'order': 'created desc',
	'limit': 5,
	'where': 'status = 1 AND type != "image"',
	'withTags': section.tags.splat('name')
] %}
{% fetch galleries from gallery with [
	'order': 'created desc',
	'limit': 5,
	'where': 'status = 1',
	'withTags': section.tags.splat('name')
] %}
{{ multimedia.merge(galleries, 'created', true) }}

{% set mmName = section.name %}

{% if not multimedia.length %}
	{% fetch multimedia from media with [
		'order': 'created desc',
		'limit': 5,
		'where': 'status = 1 AND type != "image"',
		'withTags': ['multimedia']
	] %}
	{% fetch galleries from gallery with [
		'order': 'created desc',
		'limit': 5,
		'where': 'status = 1'
	] %}
	{{ multimedia.merge(galleries, 'created', true) }}
	
	{% set mmName = False %}
{% endif %}

{% set top = multimedia.shift %}
{% set multimedia = multimedia.shift(4) %}
{% import "macros/render.tpl" as render %}

{% if top %}
<div class="wrap mmb">
	<h6>{% if mmName %}{{ mmName }} {% endif %}Galleries and multimedia</h6>
</div>

{% if top.media_type == 'Gallery' %}
	<div class="boot mmb">
		<div class="mmb"><a href="{{ top.urlDefault }}"><img src="{{ top.urlPreview }}" alt="{{ top.slug }}" /></a></div>
		
		<div class="mmb">
			<h4><img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" alt="" />&nbsp;<a href="{{ top.urlDefault }}">{{ top.title }}</a></h4>
			<div>{{ metaRender.dateLine(top.created) }} <span class="dateline sm">| {{ top.media.length|int2noun('image')|upper }}</span></div>
			
			<div class="caption">
				{{ top.description_formatted }}
			</div>
		</div>
	</div>
{% else %}
	{{ render.section(top) }}
{% endif %}

{% for item in multimedia %}
	{% if item.media_type == 'Gallery' %}
		<div class="boot mmb">
			<div class="thumb mmb">
				<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" alt="{{ item.slug }}" /></a>
			</div>
			
			<div class="mmb">
				<h4><img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" alt="" />&nbsp;<a href="{{ item.urlDefault }}">{{ item.title }}</a></h4>
				<div>{{ metaRender.dateLine(item.created) }} <span class="sm dateline">| {{ item.media.length|int2noun('image')|upper }}</span></div>
			</div>
			<div class="clear"> </div>
		</div>
	{% else %}
		{{ render.section(item) }}
	{% endif %}
{% endfor %}
<div class="clear mb"></div>
{% endif %}