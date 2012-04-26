{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
{% endblock %}

{% block content %}
{% set topStory = articles.shift() %}
{% set secondary = articles.shift(4) %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

	<div class="row">
		<div class="span8">
			<div class="row">
				<div class="span5">
					{{ articleRender.dom(topStory) }}

					<hr class="hairline double spacer" />

					{% include 'gryphon/main/modules/featured-mm.tpl' %}

				</div>
				<div class="span3">
					{% for article in secondary %}
						{{ articleRender.fourCol(article) }}
						<hr class="spacer" />
					{% endfor %}
				</div>
			</div>

			<hr class="half hairline" />

			<h3>More {{ section.name }}</h3>

			<hr class="half spacer" />
			<div class="row">
				<div class="span4">
					<ul class="item-list">
					{% for article in articles.shift((articles.length/2)-1) %}
						<li>
							<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
							<aside class="byline">
							 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i> </a>
							</aside>
						</li>
					{% endfor %}
					</ul>
				</div>
				<div class="span4">
					<ul class="item-list">
					{% for article in articles %}
						<li>
							<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
							<aside class="byline">
							 by {{ article.authors.splat('name')|join(' and ') }} | {{ article.created|timeSince }} | <a href="{{ article.url }}"><i class="icon-comment"></i> </a>
							</aside>
						</li>
					{% endfor %}
					</ul>
				</div>
			</div>
		</div>
		<div class="span4">

			{% include 'gryphon/main/sidebar/default.tpl' %}
		</div>
	</div>


{% endblock content %}