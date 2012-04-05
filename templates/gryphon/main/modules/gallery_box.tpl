{% fetch theTag from tag with [
	'limit': 1,
	'order': 'uid asc',
	'where': 'name_normalized = "' ~ tagName ~ '"'
] %}
{% set theTag = theTag.splat('name') %}

{% fetch boxGal from gallery with [
	'limit': 1,
	'order': 'created desc',
	'where': 'status = 1',
	'withTags': theTag
] %}
{% set boxGal = boxGal.shift() %}
{% import "macros/meta.tpl" as metaRender %}

<div class="wrap mmb">
	<h6 class=""><img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" alt="" /> <a href="{{ boxGal.urlDefault }}">{{ boxGal.title }} &raquo;</a></h6>
</div>

<div class="imagetabs">
	<ul class="pagination">
		{% for image in boxGal.mediaOrdered %}
			<li><a href="#img{{ loop.index }}">{{ loop.index }}</a></li>
		{% endfor %}
	</ul>
</div>
<div class="clear"> </div>

{% for image in boxGal.mediaOrdered %}
<div id="img{{ loop.index }}" class="panel">
	<div class="mmb">
		<img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" />
	</div>
	
	{#
	{% if not 'skip import'|in(image.meta) %}
		{% if dswSync.buyURL(image) %}
			<a href="{{ dswSync.buyURL(image) }}" class="reprints-button"></a>
		{% else %}
			<a href="{{ config.get('dsw:fotourl')|url }}" class="reprints-button"></a>
		{% endif %}
	{% endif %}
	#}
	
	{{ metaRender.smCred(image) }}
	
	<div class="clear mmb"> </div>
	<div class="caption mmb">
		{{ image.caption_formatted }}
		{% if image.articles.length %}
			<div><a href="{{ image.articles[0].url }}">Read the article &raquo;</a></div>
		{% endif %}
	</div>
</div>
{% endfor %}