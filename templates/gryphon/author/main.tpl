{% extends "gryphon/base.tpl" %}
{% block title %} :: Staff : {{ author.name }}{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}
{% import "macros/render.tpl" as render %}

<div class="grid_8">
	<h1>{{ author.name }}</h1>
	
	{{ author.tagline }}
	<div class="mmb"> </div>
	<hr class="mb" />
	
	<h2 class="mmb">Recent articles</h2>
	<hr class="mb" />
	{% for article in author.articles %}
		<div class="boot mb">
			<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
			<p>
				{{ article.abstract_formatted }}
				{{ metaRender.dateLine(article.modified) }}
			</p>
		</div>
	{% endfor %}

	<h2 class="mmb">Recent posts</h2>
	<hr class="mb" />
	
	{% for item in author.blogPosts %}
		<div class="boot mb">
			<h3><a href="{{ item.url }}">{{ item.headline }}</a></h3>
			<p>
				{{ item.abstract_formatted }}
				{{ metaRender.dateLine(item.modified) }}
			</p>
		</div>
	{% endfor %}


	<h2 class="mmb">Recent media</h2>
	<hr class="mb" />
	{% for item in author.media %}
		<div class="mm_item boot mb" style="padding-bottom:10px;">
			{{ render.mm(item) }}
			
			<div>
				{{ item.description_formatted }}
				{{ metaRender.dateLine(item.created) }}
			</div>
			<div class="clear"></div>
		</div>
	{% endfor %}
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear"> </div>
{% endblock content %}
