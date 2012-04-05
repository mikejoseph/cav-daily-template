{% extends "gryphon/base.tpl" %}

{% block title %} :: Poll Archive {% endblock %}
{% block activeNav %}opinion{% endblock %}
{% block flag %}Poll{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h2 class="mmb">Poll Archive</h2>
	
	<div class="body-copy mmb"><p>View results of previous online polls.</p></div>
	
	<hr class="mb" />
	
	{% for poll in polls %}
		<h3 class="mmb"><a href="{{ poll.url }}">{{ poll.title }}</a> &nbsp;<span class="aside2">{{ poll.responses }} total responses</span></h3>
		
		<p>{{ poll.question }}</p>
		
		<hr class="mb" />
	{% endfor %}
	
	<div class="pagination"><ul>
	{% if pagination.getPrevious() %}
		<li><a href="{{ pagination.getPrevious().url }}">&laquo;</a></li>
	{% endif %}
	{% for page in pagination.getPages() %}
		{% if page.isCurrent() %}
			<li class="active"><a href="{{ page.url }}">{{ page.label }}</a></li>
		{% else %}
			<li><a href="{{ page.url }}">{{ page.label }}</a></li>
		{% endif %}
	{% endfor %}
	{% if pagination.getNext() %}
		<li><a href="{{ pagination.getNext().url }}">&raquo;</a></li>
	{% endif %}
	</ul>
	<div class="clear"></div></div>
	
	<div class="clear mb"></div>
</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar/default.tpl" %}
</div>

{% endblock content %}