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
				<div class="span6">
					<h3><a href="#">Sports</a></h3>
						<ul class="item-list">
							<li><h4><a href="#">Cavs Crush Georgia Tech, 70-38</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Fan Code</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Team Travels North to Carolina</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Matmen Eye Duke, UNC</a><span> | Jan. 20</span></h4></li>
						</ul>

					<h3><a href="#">Opinion</a></h3>
						<ul class="item-list">
							<li><h4><a href="#">Citizen Power</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Rushing to Pledge</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">A Fairer Vote</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Shooting in the Dark</a><span> | Jan. 20</span></h4></li>
						</ul>
				</div>

				<div class="span6">
					<h3><a href="#">tableau</a></h3>
						<ul class="item-list">
							<li><h4><a href="#">A Spark of Pinterest</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Year of the 'Dragon'</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Bet on this 'War Horse'</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Who's House? 'Safe House'</a><span> | Jan. 20</span></h4></li>
						</ul>

					<h3><a href="#">Life</a></h3>
						<ul class="item-list">
							<li><h4><a href="#">A Hulaba Time</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Money Saving App</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Something to Complain About</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Dirty Little Secret</a><span> | Jan. 20</span></h4></li>
						</ul>
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
