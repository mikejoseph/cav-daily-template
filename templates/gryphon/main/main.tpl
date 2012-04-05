{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ config.get('dsw:siteslogan') }}{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set sidebarStories = articles.shift(2) %}
{% set centerStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}

<div class="grid_8">

	<div class="grid_2 alpha">
		{% for article in sidebarStories %}
			{{ articleRender.sidebar(article) }}
		{% endfor %}
	</div>
	
	<div class="grid_6 omega">
		{{ articleRender.dom(topStory) }}
		
		<ul class="hat">
			{% for article in centerStories %}
				{{ articleRender.list(article) }}
			{% endfor %}
		</ul>
	</div>
	
</div>

<div class="grid_4">

	{% include 'gryphon/main/modules/calendar.tpl' %}
	{% include 'gryphon/ads/rectangle_300x250.tpl' %}


</div>

<div class="clear mb"> </div>

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}

<div class="clear mb"> </div>


<div class="grid_4">
	{% include 'gryphon/main/modules/sectionbox.tpl' with ['sec': 'sports', 'limit': 3] %}

	{% include 'gryphon/main/modules/sectionbox.tpl' with ['sec': 'news', 'limit': 3] %}

	{% include 'gryphon/main/modules/sectionbox.tpl' with ['sec': 'ae', 'limit': 3] %}

	{% include 'gryphon/main/modules/sectionbox.tpl' with ['sec': 'opinion', 'limit': 3] %}

</div>

<div class="grid_4">
 	{% include 'gryphon/main/modules/fb_fan.tpl' %}
	{% include 'gryphon/main/modules/recent.tpl' %}

</div>

<div class="grid_4">
    
	{% include 'gryphon/main/modules/twitter_feed.tpl' %}
	{% include 'gryphon/ads/rectangle_300x250.tpl' %}

</div>

<div class="clear mb"> </div>

<div class="grid_6">
	{% include 'gryphon/main/modules/mm_viewer.tpl' %}
	
	{% include 'tsn/poll/recent.tpl' %}
</div>

<div class="grid_4">
	{% include 'gryphon/main/modules/galleries_home.tpl' %}	
</div>
	
<div class="grid_2">
	{% include 'gryphon/main/modules/follow.tpl' %}

	{#% include 'gryphon/main/modules/print_edition.tpl' %#}
	
	{% include 'gryphon/main/modules/print_edition_magazine.tpl' %}
</div>

<div class="clear mb"> </div>
{% endblock content %}
