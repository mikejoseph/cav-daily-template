{% extends "gryphon/base.tpl" %}
{% block title %} :: RSS Feeds{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}


{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>RSS Feeds</h1>
	
	<div class="mmb"> </div>
	
	<div class="body-copy">
		<p>Subscribe to our RSS (<a href="http://en.wikipedia.org/wiki/Rss" target="_new">Really Simple Syndication</a>) feeds to get the latest updates from {{ config.get('publication:name') }} delivered directly to your favorite feed reader. You can subscribe to the comment feed of any article on our site by clicking the RSS ( <img src="{{ 'gfn-blackletter/assets/tools/feed.png'|url }}" alt="RSS" style="position:relative;top:2px;" /> ) link in the article sidebar.</p>
	</div>
	
	<hr class="single" />
	
	<div class="grid_4 alpha">
		<h3 class="mmb"><img src="{{ 'gfn-blackletter/assets/49.png'|url }}" alt="(RSS)" />&nbsp;&nbsp;<a href="{{ 'recent/article.xml'|url }}">Recent Articles and Blog Posts</a></h3>
		
		<h2 class="mmb">Section Feeds</h2>
		
		<ul class="hat mb">
			
			<li><h4><img src="{{ 'gfn-blackletter/assets/49.png'|url }}" alt="(RSS)" />&nbsp;&nbsp;<a href="{{ 'section/news.xml'|url }}">News</a></h4></li>
			
			<li><h4><img src="{{ 'gfn-blackletter/assets/49.png'|url }}" alt="(RSS)" />&nbsp;&nbsp;<a href="{{ 'section/sports.xml'|url }}">Sports</a></h4></li>
		
			<li><h4><img src="{{ 'gfn-blackletter/assets/49.png'|url }}" alt="(RSS)" />&nbsp;&nbsp;<a href="{{ 'section/ae.xml'|url }}">A&amp;E</a></h4></li>
		
			<li><h4><img src="{{ 'gfn-blackletter/assets/49.png'|url }}" alt="(RSS)" />&nbsp;&nbsp;<a href="{{ 'section/opinion.xml'|url }}">Opinion</a></h4></li>
		</ul>
		<!--
		<h2 class="mmb">Sports Feeds</h2>
		
		<ul class="hat mb">
			{% fetch sportsSub from section with [
				'limit': 30,
				'order': 'name asc',
				'where': 'status = 1 AND sidebar = "sports"'
			] %}
			{% for item in sportsSub %}
				<li><h4><img src="{{ 'gfn-blackletter/assets/49.png'|url }}" alt="(RSS)" />&nbsp;&nbsp;<a href="{{ item.url }}.xml">{{ item.name }}</a></h4></li>	
			{% endfor %}
		</ul>
		-->
	</div>
	
	<div class="grid_4 omega">
		<h2 class="mmb">Blog Feeds</h2>
		{% fetch blogs from blog with [
			'limit': 30,
			'order': 'name asc',
			'where': 'status = 1'
		] %}
		<ul class="hat mb">
			{% for item in blogs %}
				<li><h4><img src="{{ 'gfn-blackletter/assets/49.png'|url }}" alt="(RSS)" />&nbsp;&nbsp;<a href="{{ item.url }}.xml">{{ item.name }}</a></h4></li>
			{% endfor %}
		</ul>
	</div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>
<div class="clear"> </div>
{% endblock content %}
