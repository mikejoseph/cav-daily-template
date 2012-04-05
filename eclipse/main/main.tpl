{% extends "gryphon/base.tpl" %}
{% block title %} :: Classifieds{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>{{ config.get('gryphon:publication:name') }} Classifieds</h1>
	
	<div class="mmb"> </div>
	
	<div class="body-copy">
		<p>Choose a category from the panel at left or use the form below to search classified ads.</p>
		
		<p><strong>To submit a classified ad for publication</strong>, please fill out our <a href="{{ 'tsn:mail/2'|url }}">online form</a>. A member of our staff will contact you to confirm details and arrange payment.</p>
	</div>
	
	<hr class="mmb" />
	
	<div class="grid_2 alpha">
		<ul>
		{% for category in categories %}
			{% if '_'|in(category.name) %}
				<li><div class="wrap mmb"><h6 class="ind classified-header" style="display:block;line-height:1.5;">{{ category.name }}</h6></div></li>
			{% else %}
				<li class="ind"><a href="{{ category.url }}">{{ category.name }}</a></li>
			{% endif %}
		{% endfor %}
		</ul>
	</div>
	
	<div class="grid_6 omega">
		{% include 'eclipse/main/form.tpl' %}
		<hr class="mb" />
		
		
		{% if featured.length %}
			<h3 class="mmb">Featured Classifieds</h3>
			{% for ad in featured %}
				<div class="body-copy">
					<p>{{ ad.copy }} &mdash; <a href="{{ ad.category.url }}"><strong>{{ ad.category.name }}</strong></a></p>
				</div>
				
				<hr class="mb" />
			{% endfor %}
		{% elseif category.uid %}
			<h3 class="mmb">{{ category.name }}</h3>
			{% for ad in category.ads %}
				<div class="body-copy">
					<p>{{ ad.copy }}</p>
				</div>
				
				<hr class="mb" />
			{% endfor %}
		{% elseif token %}
			<h3 class="mmb">Search results for "{{ token }}"</h3>
			{% for ad in results %}
				<div class="body-copy">
					<p>{{ ad.copy }} &mdash; <a href="{{ ad.category.url }}"><strong>{{ ad.category.name }}</strong></a></p>
				</div>
				
				<hr class="mb" />
			{% endfor %}
			</ul>
		{% endif %}
	</div>
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}