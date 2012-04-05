{% helper calendar %}
{{ calendar.setTime(timestamp) }}

<div id="calendarwrap">
	<div class="calnav"><a href="{{ 'google:calendar'|url(['time': calendar.nextTime]) }}" class="next"></a> <a href="{{ 'google:calendar'|url(['time': calendar.previousTime]) }}" class="prev"></a> <strong>{{ calendar.name }}</strong></div>
	<div class="clear mmb"></div>
	<hr class="light mmb" />
	
	<table id="calendar" cellspacing="0">
		<tbody>
			<tr class="day">
			{% for day in ['Su', 'M', 'Tu', 'W', 'Th', 'F', 'Sa'] %}
				<th{% if loop.index0 == calendar.now|date('w') %} class="selected"{% endif %}>{{ day }}</th>
			{% endfor %}
			</tr>
			{% for week in calendar.weeks %}
				<tr>
				{% for day in week.days %}
					{% if day.isCurrentMonth() %}
						<td{% if day.isCurrent() %} class="active"{% elseif week.isCurrent() %} class="currentweek"{% endif %}><a href="{{ 'google:calendar'|url(['time':day.time]) }}">{{ day.date }}</a></td>
					{% else %}
						<td class="inactive">{{ day.date }}</td>
					{% endif %}
				{% endfor %}
				</tr>
			{% endfor %}
		</tbody>
	</table>
</div>

<div class="eventcats">
	<p class="aside2 mmb"><strong>Categories</strong></p>
	<ul>
		{% fetch calendars from google:calendar with [
			'order': 'title asc'
		] %}
		{% for calendar in calendars %}
			<li><a href="{{ calendar.url }}?time={{ timestamp }}">{{ calendar.name }}</a></li>
		{% endfor %}
	</ul>
</div>

<div style="clear:both"> </div>