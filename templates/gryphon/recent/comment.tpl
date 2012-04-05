{% extends "gryphon/base.tpl" %}
{% block title %} :: Recent comments{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}

<div class="grid_8">
	<h2 class="mmb">Recent comments</h2>
	<hr class="mb" />
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