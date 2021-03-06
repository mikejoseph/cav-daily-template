{% extends "gryphon/base.tpl" %}
{% block title %} :: Event Calendar{% endblock %}
{% block activeNav %}events{% endblock %}
{% block flag %}Events{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<div class="wrap mb">
		<h5>{% if timestamp %}Events for {{ timestamp|date('l, F d, Y') }}{% else %}Upcoming Events{% endif %}</h5>
	</div>
	
	{#
	{% if calendar.uid %}
		<p class="mmb">Showing events in <strong style="color:{{ calendar.color }}">{{ calendar.title }}</strong> | <a href="<?php echo Foundry::link( 'calendar' ).'?time='.$data['day']->timestamp() ?>">show all</a></p>
		<hr class="mb" />
	{% endif %}
	#}
	
	{% if events.length %}
		{% for event in events %}
			<div class="calendarcolor" style="background-color:{{ event.calendar.color }};"><a href="{{ event.calendar.url }}">{{ event.calendar.title }}</a></div>
			
			<h3 class="mmb"><a href="{{ event.url }}">{{ event.title }}</a>
				<span class="aside">
					{% if event.allDay %}
						All day
					{% elseif event.start_time == event.end_time %}
						{{ event.start_time|date('g:ia m/d/y') }}
					{% else %}
						{{ event.start_time|date('g:ia') }} - {{ event.end_time|date('g:ia m/d/y') }}
					{% endif %}
				</span>
			</h3>
			
			<div><p>{{ event.abstract }}</p></div>
			
			<span class="right"><a href="{{ event.url }}">{{ event.commentTotal|int2noun('comment') }} &raquo;</a></span>
			
			<p class="mmb"><strong>Where:</strong> {{ event.location }}</p>
			
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
	{% else %}
		<p>No events found for this day and/or category.</p>
	{% endif %}
	
	<div class="mb"></div>
</div>

<div class="grid_4" id="gcal-sidebar">
	
	{% include 'google/calendar/calendar.tpl' %}
	
	<hr class="mb" />
	<p>Are we missing something? <a href="{{ 'google:calendar/submit'|url }}"><strong>Submit an event listing</strong></a>.</p>
	<hr class="mb" />
	
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear"></div>


{% endblock content %}
