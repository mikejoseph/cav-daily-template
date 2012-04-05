{% extends "gryphon/base.tpl" %}
{% block title %} :: Recent articles{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}

<div class="grid_8">
	<h2 class="mmb">Recent articles</h2>
	<hr class="mb" />
	
	{% for article in articles %}
		<div class="boot mb">
			<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
			<p>
				{{ article.abstract_formatted }}
				{{ metaRender.dateLine(article.modified) }}
			</p>
		</div>
	{% endfor %}
</div>

<div id="article_sidebar" class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>
<div class="clear"></div>
{% endblock content %}