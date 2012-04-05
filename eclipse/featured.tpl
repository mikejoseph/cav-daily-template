{% fetch items from eclipse:ad with [
	'where': 'status = 1',
	'order': 'category_id'
] %}
<div class="modh"></div>
<div class="mod">
	<h4>Featured classifieds</h4>
	<ul class="hat aside mmb">
	{% for ad in items %}
		<li>{{ ad.copy }} &mdash; <a href="{{ ad.category.url }}">{{ ad.category.name }}</a></li>
	{% endfor %}
	</ul>
</div>
<div class="modf mb"></div>