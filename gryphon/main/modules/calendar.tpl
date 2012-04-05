{% set todayStart = 'today 12:00am'|date('U') %}
{% set todayEnd = 'today 12:00am +1 day'|date('U') %}

{% set day2Start = todayEnd %}
{% set day2End = 'today 12:00am +2 days'|date('U') %}

{% set day3Start = day2End %}
{% set day3End = 'today 12:00am +3 days'|date('U') %}

{% set day4Start = day3End %}
{% set day4End = 'today 12:00am +4 days'|date('U') %}

{% set day5Start = day4End %}
{% set day5End = 'today 12:00am +5 days'|date('U') %}

<div class="wrap mb">
	<h6 class="ind mmb">Upcoming events</h6>

	<div class="tabheader">
		<ul id="event-dates">
			<li><span>{{ todayStart|date('D') }}</span><a href="#d-{{ todayStart|date('d') }}">{{ todayStart|date('d') }}</a></li>
		
			<li><span>{{ day2Start|date('D') }}</span><a href="#d-{{ day2Start|date('d') }}">{{ day2Start|date('d') }}</a></li>
			
			<li><span>{{ day3Start|date('D') }}</span><a href="#d-{{ day3Start|date('d') }}">{{ day3Start|date('d') }}</a></li>
			
			<li><span>{{ day4Start|date('D') }}</span><a href="#d-{{ day4Start|date('d') }}">{{ day4Start|date('d') }}</a></li>

			<li><span>{{ day5Start|date('D') }}</span><a href="#d-{{ day5Start|date('d') }}">{{ day5Start|date('d') }}</a></li>

		</ul>
		<div class="clear mmb">&nbsp;</div>
	</div>
	
	<div id="d-{{ todayStart|date('d') }}" class="eventtab aside2">
	{% fetch todayEvents from google:calendarEvent with [
		'limit': 3,
		'order': 'start_time asc, created desc',
		'where': 'status = 1 AND start_time > ' ~ todayStart ~ ' AND start_time < ' ~ todayEnd
	] %}
	{% if todayEvents.length %}
		{% for event in todayEvents %}
			<p><span class="sm dateline">
			{% if event.allDay %}
				All day
			{% else %}
				{{ event.start_time|date('g:i a') }}
			{% endif %}
			| </span><a href="{{ event.url }}">{{ event.title }}</a></p>
		{% endfor %}
	{% else %}
		<p>No events for this date</p>
	{% endif %}
	</div>
	
	<div id="d-{{ day2Start|date('d') }}" class="eventtab aside2">
	{% fetch day2Events from google:calendarEvent with [
		'limit': 3,
		'order': 'start_time asc, created desc',
		'where': 'status = 1 AND start_time > ' ~ day2Start ~ ' AND start_time < ' ~ day2End
	] %}
	{% if day2Events.length %}
		{% for event in day2Events %}
			<p><span class="sm dateline">
			{% if event.allDay %}
				All day
			{% else %}
				{{ event.start_time|date('g:i a') }}
			{% endif %}
			| </span><a href="{{ event.url }}">{{ event.title }}</a></p>
		{% endfor %}
	{% else %}
		<p>No events for this date</p>
	{% endif %}
	</div>
	
	<div id="d-{{ day3Start|date('d') }}" class="eventtab aside2">
	{% fetch day3Events from google:calendarEvent with [
		'limit': 3,
		'order': 'start_time asc, created desc',
		'where': 'status = 1 AND start_time > ' ~ day3Start ~ ' AND start_time < ' ~ day3End
	] %}
	{% if day3Events.length %}
		{% for event in day3Events %}
			<p><span class="sm dateline">
			{% if event.allDay %}
				All day
			{% else %}
				{{ event.start_time|date('g:i a') }}
			{% endif %}
			| </span><a href="{{ event.url }}">{{ event.title }}</a></p>
		{% endfor %}
	{% else %}
		<p>No events for this date</p>
	{% endif %}
	</div>
	
	<div id="d-{{ day4Start|date('d') }}" class="eventtab aside2">
	{% fetch day4Events from google:calendarEvent with [
		'limit': 3,
		'order': 'start_time asc, created desc',
		'where': 'status = 1 AND start_time > ' ~ day4Start ~ ' AND start_time < ' ~ day4End
	] %}
	{% if day4Events.length %}
		{% for event in day4Events %}
			<p><span class="sm dateline">
			{% if event.allDay %}
				All day
			{% else %}
				{{ event.start_time|date('g:i a') }}
			{% endif %}
			| </span><a href="{{ event.url }}">{{ event.title }}</a></p>
		{% endfor %}
	{% else %}
		<p>No events for this date</p>
	{% endif %}
	</div>

	<div id="d-{{ day5Start|date('d') }}" class="eventtab aside2">
	{% fetch day5Events from google:calendarEvent with [
		'limit': 3,
		'order': 'start_time asc, created desc',
		'where': 'status = 1 AND start_time > ' ~ day5Start ~ ' AND start_time < ' ~ day5End
	] %}
	{% if day5Events.length %}
		{% for event in day5Events %}
			<p><span class="sm dateline">
			{% if event.allDay %}
				All day
			{% else %}
				{{ event.start_time|date('g:i a') }}
			{% endif %}
			| </span><a href="{{ event.url }}">{{ event.title }}</a></p>
		{% endfor %}
	{% else %}
		<p>No events for this date</p>
	{% endif %}
	</div>
	
</div>
<p class="inner"><a href="{{ 'google:calendar'|url }}" class="head4">Full calendar &raquo;</a></p>