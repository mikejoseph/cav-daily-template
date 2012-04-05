{% fetch theSection from section with [
	'where': 'status = 1 AND slug = "' ~ sec ~ '"'
] %}
{% set tags = theSection[0].tags.splat('name') %}

{% fetch articles from article with [
	'limit': limit,
	'order': 'weight desc, created desc',
	'where': 'status = 1',
	'withTags': tags
] %}

{% import "macros/meta.tpl" as metaRender %}

<div class="wrap mmb">
	<h5 class="ind"><a href="{{ theSection[0].url }}">{{ theSection[0].name }} &raquo;</a></h5>
</div>

<ul class="ind mb">
	{% for article in articles %}
		<li><a href="{{ article.url }}">{{ article.headline }}</a> {{ metaRender.dateLine(article.modified) }}</li>
	{% endfor %}
</ul>