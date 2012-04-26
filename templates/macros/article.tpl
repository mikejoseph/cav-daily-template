{% macro dom(article) %}
	<article class="abstract five-column">
		{% set images = article.media.grab('type', 'image', true) %}
		{% if images.length %}
		<div class="box">
			<a href="{{ article.url }}"><img src="{{ images[0].url }}" class="block flex-image" /></a>
			<aside>
				{{ images[0].authors.splat('name')|join(' and') }} - {{ images[0].source }}
			</aside>
		</div>
		<hr class="spacer" />
		{% endif %}
		<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
		<aside class="by-line">
		 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i></a>
		</aside>
		<p>
			{{ article.abstract|strip }}
			<br />
			<a href="{{ article.url }}">read more <i class="icon-chevron-right"></i></a>
		</p>
	</article>
{% endmacro %}

{% macro threeCol(article) %}
	<article class="three-column abstract">
		<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
		<aside class="by-line">
		 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i> </a>
		</aside>
		<p>
			{% if article.media[0].type == 'image' %}
				<a href="{{ article.url }}"><img src="{{ article.media[0].urlThumbnail }}" style="max-width:100px" /></a>
			{% endif %}
			{{ article.abstract|strip }}
			<br />
			<a href="{{ article.url }}">read more <i class="icon-chevron-right"></i></a>
		</p>
	</article>

{% endmacro %}

{% macro fourCol(article) %}
	<article class="four-column abstract">
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
		<aside class="by-line">
		 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i> </a>
		</aside>
		<p>
			{% if article.media[0].type == 'image' %}
				<a href="{{ article.url }}"><img src="{{ article.media[0].urlThumbnail }}" style="max-width:100px" /></a>
			{% endif %}
			{{ article.abstract|strip|clip(150) }}
			<br />
			<a href="{{ article.url }}">read more <i class="icon-chevron-right"></i></a>
		</p>
	</article>

{% endmacro %}

{% macro fiveCol(article) %}
	<article class="abstract five-column">
		<h2><a href="{{ article.url }}">{{ article.headline }}</a></h2>
		<aside class="by-line">
		 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i></a>
		</aside>
		<p>
			{% if article.media[0].type == 'image' %}
				<a href="{{ article.url }}"><img src="{{ article.media[0].urlThumbnail }}" style="max-width:100px" /></a>
			{% endif %}
			{{ article.abstract|strip }}
			<br />
			<a href="{{ article.url }}">read more <i class="icon-chevron-right"></i></a>
		</p>
	</article>

{% endmacro %}

