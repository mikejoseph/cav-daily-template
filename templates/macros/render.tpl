{% macro media(media, template) %}
	{% if template %}
		{% set pth %}media/{{ media.type ~ '_' ~ template }}.tpl{% endset %}
	{% else %}
		{% set pth %}media/{{ media.type }}.tpl{% endset %}
	{% endif %}
	
	{% include pth %}
{% endmacro %}

{% macro mm(media) %}
	{% import 'macros/meta.tpl' as metaRender %}
	{% if media.type|lower == 'soundslide' %}
		{% set type = 'slideshow' %}
	{% elseif media.type|lower == 'flash' %}
		{% set type = 'interactive' %}
	{% else %}
		{% set type = media.type %}
	{% endif %}
	
	{% if media.type|lower == 'pdf' %}
		{% set URL = media.urlOriginal %}
	{% else %}
		{% set URL = media.urlMultimedia %}
	{% endif %}

	{% set icnPth = 'gfn-blackletter/assets/icons/' ~ media.type|lower ~ '.png' %}
	
	<div class="mmbox">
		{% if media.type|lower == 'audio' %}
		<div class="mmb">
			{% set pth %}media/{{ media.type }}.tpl{% endset %}
			{% include pth %}
		</div>
		{% else %}
		<div class="thumb">
			<a href="{{ URL }}"><img src="{{ media.urlThumbnail }}" alt="{{ media.base_name }}" /></a>
		</div>
		{% endif %}
		
		<div class="aside"><h4><img src="{{ icnPth|url }}" alt="" />&nbsp;&nbsp;<a href="{{ URL }}">{{ media.title ? media.title : media.base_name }}</a></h4></div>
		<div>{{ metaRender.dateLine(media.created) }} {% if media.authors.length %}<span class="byline aside">| {{ media.authors.splat('name')|join(', ') }}</span>{% endif %}</div>
	</div>
{% endmacro %}

{% macro section(media) %}
	{% import 'macros/meta.tpl' as metaRender %}
	{% if media.type|lower == 'soundslide' %}
		{% set type = 'slideshow' %}
	{% elseif media.type|lower == 'flash' %}
		{% set type = 'interactive' %}
	{% else %}
		{% set type = media.type %}
	{% endif %}
	
	{% if media.type|lower == 'pdf' %}
		{% set URL = media.urlOriginal %}
	{% else %}
		{% set URL = media.urlMultimedia %}
	{% endif %}

	{% set icnPth = 'gfn-blackletter/assets/icons/' ~ media.type|lower ~ '.png' %}
	
	<div class="boot mmb">
		{% if media.type|lower == 'audio' %}
		<div class="mmb">
			{% set pth %}media/{{ media.type }}.tpl{% endset %}
			{% include pth %}
		</div>
		{% else %}
		<div class="thumb mmb">
			<a href="{{ URL }}"><img src="{{ media.urlThumbnail }}" alt="{{ media.base_name }}" /></a>
		</div>
		{% endif %}
		
		<div class="mmb">
			<h4><img src="{{ icnPth|url }}" alt="" />&nbsp;&nbsp;<a href="{{ URL }}">{{ media.title ? media.title : media.base_name }}</a></h4>
			<div>{{ metaRender.dateLine(media.created) }} {% if media.authors.length %}<span class="byline aside">| {{ media.authors.splat('name')|join(', ') }}</span>{% endif %}</div>
		</div>
		<div class="clear"> </div>
	</div>
{% endmacro %}