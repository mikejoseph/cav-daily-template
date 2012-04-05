{% set tags = section.tags.splat('name') %}
{% fetch posts from blogPost with [
	'limit': 5,
	'order': 'created desc',
	'where': 'status = 1',
	'withTags': tags
] %}
{% import "macros/meta.tpl" as metaRender %}

<div class="wrap mmb">
	<h6 class="ind">From the blogs</h6>
</div>

<ul class="ind boot mb">
	{% for item in posts %}
		<li style="margin-bottom:5px;"><a href="{{ item.url }}" class="head4">{{ item.headline }}</a> {{ metaRender.dateLine(item.created) }}
		<div class="aside mmb">{{ item.blog.name }}: <a href="{{ item.blog.url }}">Home</a> | <a href="{{ item.blog.url }}.xml">RSS</a></div></li>
	{% endfor %}
	
	<li><a href="{{ 'blog'|url }}" class="head4">More blogs &raquo;</a></li>
</ul>