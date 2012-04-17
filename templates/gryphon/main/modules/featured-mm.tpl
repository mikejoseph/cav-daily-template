
<h3><a href="{{ 'multimedia'|url }}">Featured Multimedia:</a></h3>

<hr class="spacer" />

{% fetch mm from media with [
	'order': 'weight desc, created desc',
	'limit': 4,
	'where': 'status = 1',
	'withTags': ['multimedia']
]%}
<div id="main-carousel" class="carousel">
	<div class="carousel-inner">
		{% for media in mm %}
		<div class="{% if loop.first %}active {% endif %}item">
			<a href="{{ media.urlDefault }}"><img src="{{ media.url }}" /></a>
			<div class="carousel-caption">
				<h4>{{ media.title }}</h4>
				<p>{{ media.caption_formatted|strip }}</p>
			</div>
		</div>
		{% endfor %}
	</div>

	<a class="carousel-control left" href="#main-carousel" data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#main-carousel" data-slide="next">&rsaquo;</a>
</div>
