{% fetch galleries from gallery with [
	'limit': 3,
	'order': 'created desc',
	'where': 'status = 1'
] %}
{% set top = galleries.shift() %}
{% import "macros/meta.tpl" as metaRender %}

<div class="wrap mmb">
	<h6><a href="{{ 'gallery'|url }}">Photo galleries &raquo;</a></h6>
</div>

<div class="boot mmb">
	<div class="mmb"><a href="{{ top.urlDefault }}"><img src="{{ top.urlPreview }}" /></a></div>
	
	<div class="mmb">
		<h4><img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" alt="" />&nbsp;&nbsp;<a href="{{ top.urlDefault }}">{{ top.title }}</a></h4>
		<div>{{ metaRender.dateLine(top.created) }} <span class="sm dateline">| {{ top.media.length }} IMAGES</span></div>
		
		<div class="caption">
			{{ top.description_formatted }}
		</div>
	</div>
</div>

{% for item in galleries %}
<div class="boot mmb">
	<div class="thumb mmb">
		<a href="{{ item.urlDefault }}"><img src="{{ item.urlThumbnail }}" /></a>
	</div>
	
	<div class="mmb">
		<h4><img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" alt="" />&nbsp;&nbsp;<a href="{{ item.urlDefault }}">{{ item.title }}</a></h4>
		<div>{{ metaRender.dateLine(item.created) }} <span class="sm dateline">| {{ item.media.length }} IMAGES</span></div>
	</div>
	<div class="clear"> </div>
</div>
{% endfor %}

<h4><a href="{{ 'gallery'|url }}">More galleries &raquo;</a></h4>
<div class="clear mb"> </div>