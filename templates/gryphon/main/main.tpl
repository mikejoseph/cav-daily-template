{% extends "gryphon/base.tpl" %}
{% block activeNav %}home{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set centerStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

	<div class="row">
		<div class="span3">
			<h3>Recent News:</h3>

			{% for article in articles %}
				{{ articleRender.threeCol(article) }}
				<hr class="spacer" />
			{% endfor %}

			<hr class="spacer" />

			{% include 'gryphon/main/modules/calendar.tpl' %}

		</div>
		<div class="span5">

			{{ articleRender.dom(topStory) }}

			<hr class="hairline double spacer" />

			{% for article in centerStories %}
				{{ articleRender.fiveCol(article) }}
				<hr class="spacer" />
			{% endfor %}

			<hr class="hairline spacer" />

			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span6">
							<h3><a href="#">Sports</a></h3>
							<ul class="item-list">
							{% fetch sports from article with [
								'where': 'status = 1',
								'order': 'weight desc, created desc',
								'limit': 4,
								'withTags': ['sports']
							]%}
							{% for article in sports %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
							{% endfor %}
							</ul>
						</div>
						<div class="span6">
							<h3><a href="#">tableau</a></h3>
							<ul class="item-list">
							{% fetch tableau from article with [
								'where': 'status = 1',
								'order': 'weight desc, created desc',
								'limit': 4,
								'withTags': ['tableau']
							]%}
							{% for article in tableau %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
							{% endfor %}
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span6">
							<h3><a href="#">Opinion</a></h3>
							<ul class="item-list">
							{% fetch opinion from article with [
								'where': 'status = 1',
								'order': 'weight desc, created desc',
								'limit': 4,
								'withTags': ['opinion']
							]%}
							{% for article in opinion %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
							{% endfor %}
							</ul>
						</div>
						<div class="span6">
							<h3><a href="#">Life</a></h3>
							<ul class="item-list">
							{% fetch life from article with [
								'where': 'status = 1',
								'order': 'weight desc, created desc',
								'limit': 4,
								'withTags': ['life']
							]%}
							{% for article in life %}
								<li><h4><a href="{{ article.url }}">{{ article.headline }}</a><span> | {{ article.created|date('M d') }}</span></h4></li>
							{% endfor %}
							</ul>
						</div>
					</div>
				</div>
			</div>

			<hr class="hairline double spacer" />

			{% include 'gryphon/main/modules/featured-mm.tpl' %}

		</div>

		<div class="span4">

			<div class="btn-group" id="social-buttons">
				<a href="#" class="btn"><i class="icon-twitter-sign"></i> Follow</a>
				<a href="#" class="btn"><i class="icon-facebook-sign"></i> Friend</a>
				<a href="#" class="btn"><i class="icon-heart"></i> Feed</a>
			</div>

			<hr class="double hairline" />

			{% include 'gryphon/main/ads/rectangle.tpl' %}

			<hr class="double harline" />

			{% include 'gryphon/main/modules/recent.tpl' %}

			<hr class="double spacer" />

			{% include 'gryphon/main/modules/twitter_feed.tpl' %}

		</div>
	</div>


{% endblock content %}
