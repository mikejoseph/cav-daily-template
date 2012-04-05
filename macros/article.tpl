{% macro sidebar(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	<a href="{{ article.url }}" class="head3">{{ article.headline }}</a>
	
	{% if article.authors.length %}
		<div class="dateline sm">By {{ article.authors.splat('name')|join(', ')|upper }}</div>
	{% endif %}
	
	<div class="abstract mb">{{ article.abstract_formatted }} {{ metaRender.dateLine(article.modified) }}</div>
{% endmacro %}

{% macro dom(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	
	{% if topImage %}
	<div class="image mmb">
		<a href="{{ article.url }}"><img src="{{ topImage.url }}"  alt="{{ article.headline }}" /></a>
	</div>
	{% endif %}
	
	<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
	
	{% if article.authors.length %}
		<div class="dateline sm">By {{ article.authors.splat('name')|join(', ')|upper }}</div>
	{% endif %}
	
	<div class="abstract mb">
		{{ article.abstract_formatted }}
		{{ metaRender.dateLine(article.modified) }}
	</div>
{% endmacro %}

{% macro list(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	
	<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> {{ metaRender.dateLine(article.modified) }}</li>
{% endmacro %}