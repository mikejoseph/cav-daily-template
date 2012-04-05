{% extends "gryphon/base.tpl" %}
{% block title %} :: Recent content{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}

<div class="grid_8">
	<h2 class="mmb">Recent content</h2>
	<hr class="mb" />
	
	<h3 class="mmb">Recent articles</h3>
	{% for article in articles %}
		<div class="boot mb">
			<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
			<p>
				{{ article.abstract_formatted }}
				{{ metaRender.dateLine(article.modified) }}
			</p>
		</div>
	{% endfor %}
	
	<h3 class="mmb">Recent comments</h3>
	{% for comment in comments %}
		<div class="boot mb">
			<h4><a href="{{ comment.url }}">At {{ comment.created|date('g:ia') }}, {{ comment.name }} said:</a></h4>
			<p>
				{{ comment.preview }}
			</p>
		</div>
	{% endfor %}
</div>

<div id="article_sidebar" class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>
<div class="clear"></div>
{% endblock content %}