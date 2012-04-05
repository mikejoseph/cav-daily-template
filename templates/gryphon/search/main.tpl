{% extends "gryphon/base.tpl" %}
{% block title %} :: Search{% endblock %}
{% block flag %}Search{% endblock %}


{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<div class="right"><a href="{{ 'search/?a=1'|url }}">Advanced Search</a></div>
	<h2 class="mmb">{{ pagination.total|int2noun('result') }} for <em>{{ query }}</em></h2>

	<hr class="mmb" />

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

	{% for item in hits %}
		{% if item.type == 'media' %}
			<div class="thumb mb" style="overflow:hidden;"><a href="{{ item.url|url }}">
				<img src="{{ item.misc.urlThumbnail }}" alt="{{ item.title }}" />
			</a></div>
		{% endif %}
		<div>
			<h3 class="mmb"><a href="{{ item.url|url }}">{{ item.title }}</a></h3>

			<p>{{ item.description }}</p>

			<div class="aside mmb"><em><a href="{{ item.url|url }}">{{ item.url|qualifiedUrl }}</a></em></div>
		</div>
		<div class="caption mb">Published {{ item.created|date('F j, Y') }}</div>

		<div class="clear"> </div>
		<hr class="mmb" />
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
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear mbb"></div>
{% endblock content %}