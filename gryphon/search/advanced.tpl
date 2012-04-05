{% extends "gryphon/base.tpl" %}
{% block title %} :: Advanced Search{% endblock %}
{% block flag %}Search{% endblock %}

{% block content %}

{% set months = [
	'01': 'January',
	'02': 'February',
	'03': 'March',
	'04': 'April',
	'05': 'May',
	'06': 'June',
	'07': 'July',
	'08': 'August',
	'09': 'September',
	'10': 'October',
	'11': 'November',
	'12': 'December'
] %}

{% set types = [
	'article',
	'media',
	'page',
	'section',
	'comment'
] %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>Archive search</h1>
	
	<div class="mmb"> </div>
	
	<div class="body-copy boot mmb">
		<p>Use the form below to search our archives{% if config.get('dsw:archivedate') %} dating back to {{ config.get('dsw:archivedate') }}{% endif %}.</p>
	</div>
	
	<form method="get" action="{{ 'search'|url }}" class="search-advanced">
		<input type="hidden" name="a" value="1" />
		
		<table class="formwrap">
			<tr>
				<th><label for="input_search">Find</label></th>
				<td><input type="text" id="input_search" name="s" size="30" value="{{ query.subject }}" /></td>
			</tr>
			
			<tr>
				<th><label for="input_title">Headline</label></th>
				<td><input type="text" id="input_title" name="ti" size="30" value="{{ query.title }}" /></td>
			</tr>
			
			<tr>
				<th><label for="input_author">Writer/Photographer</label></th>
				<td><input type="text" id="input_author" name="au" size="30" value="{{ query.author }}" /></td>
			</tr>
			
			<tr>
				<th><label for="input_tag">Tagged</label></th>
				<td><input type="text" id="input_tag" name="tg" size="30" value="{{ query.tag }}" /></td>
			</tr>
			
			<tr>
				<th><label for="input_startDate">From</label></th>
				<td>
					<select name="ts_month">
						<option value="0">Month</option>
						{% for val,label in months %}
							<option value="{{ val }}"{% if query.time_startMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
						{% endfor %}
					</select>
					<select name="ts_day">
						<option value="0">Day</option>
						{% for i in 1..31 %}
							<option value="{{ i }}"{% if query.time_startDay == i %} selected="selected"{% endif %}>{{ i }}</option>
						{% endfor %}
					</select>
					<select name="ts_year">
						<option value="0">Year</option>
						{% if config.get('dsw:archivedate') %}
							{% set b = config.get('dsw:archivedate') %}
						{% else %}
							{% set b = 2000 %}
						{% endif %}
						{% set n = now|date('Y') %}
						
						{% for i in b..n %}
							<option value="{{ i }}"{% if query.time_startYear == i %} selected="selected"{% endif %}>{{ i }}</option>
						{% endfor %}
					</select>
				</td>
			</tr>
			
			<tr>
				<th><label for="input_endDate">To</label></th>
				<td>
					<select name="te_month">
						<option value="0">Month</option>
						{% for val,label in months %}
							<option value="{{ val }}"{% if query.time_endMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
						{% endfor %}
					</select>
					<select name="te_day">
						<option value="0">Day</option>
						{% for i in 1..31 %}
							<option value="{{ i }}"{% if query.time_endDay == i %} selected="selected"{% endif %}>{{ i }}</option>
						{% endfor %}
					</select>
					<select name="te_year">
						{% if config.get('dsw:archivedate') %}
							{% set b = config.get('dsw:archivedate') %}
						{% else %}
							{% set b = 2000 %}
						{% endif %}
						{% set n = now|date('Y') %}
						
						<option value="0">Year</option>
						{% for i in b..n %}
							<option value="{{ i }}"{% if query.time_endYear == i %} selected="selected"{% endif %}>{{ i }}</option>
						{% endfor %}
					</select>
				</td>
			</tr>
			
			<tr>
				<th><label for="input_type">Type</label></th>
				<td>
					<select name="ty" id="input_type">
						<option value="0">Any</option>
						{% for val in types %}
							<option value="{{ val }}"{% if query.type == val %} selected="selected"{% endif %}>{{ val }}</option>
						{% endfor %}
					</select>
				</td>
			</tr>
			
			<tr>
				<th><label for="input_order">Sort by</label></th>
				<td>
					<select name="o" id="input_order">
						<option value="date"{% if query.order == 'date' %} selected="selected"{% endif %}>Date</option>
						<option value="title"{% if query.order == 'title' %} selected="selected"{% endif %}>Title</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form>
	
	<hr class="mb" />

	{% if hits %}
		<h2 class="mmb">{{ pagination.total|int2noun('result') }}</h2>
		
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
		
		<div class="clear"> </div>
	{% elseif query.subject or query.title or query.author or query.tag or query.type or query.time_startMonth %}
		<p class="body-copy">Sorry! No results were found.</p>
	{% endif %}
	
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear mbb"></div>
{% endblock content %}