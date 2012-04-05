{% extends "gryphon/base.tpl" %}
{% block title %} :: Event Calendar : {{ event.title }}{% endblock %}
{% block activeNav %}events{% endblock %}
{% block flag %}Events{% endblock %}

{% block scripts %}
<script type="text/javascript" src="{{ 'http://maps.google.com/maps?file=api&amp;v=2&amp;key=' ~ config.get('google:maps_api') }}"></script>
<script type="text/javascript" src="http://gmaps-utility-library.googlecode.com/svn/trunk/mapiconmaker/1.1/src/mapiconmaker_packed.js"></script>
{% endblock %}

{% block content %}
{% include 'google/calendar/map.tpl' %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<div class="calendarcolor" style="background-color:{{ event.calendar.color }};"><a href="{{ event.calendar.url }}">{{ event.calendar.title }}</a></div>
		
	<h2 class="mmb">{{ event.title }}
		<span class="aside2">
			{% if event.allDay %}
				All day
			{% elseif event.start_time == event.end_time %}
				{{ event.start_time|date('g:ia m/d/y') }}
			{% else %}
				{{ event.start_time|date('g:ia') }} - {{ event.end_time|date('g:ia m/d/y') }}
			{% endif %}
		</span>
	</h2>
	
	<hr class="mb" />
	
	{{ event.content_formatted }}

	{# <!--
		PLEASE NOTE: The $event->location extended property will attempt to
		Geocode the location. If it is unable to properly code the address, the
		raw location string will be returned.
		
		In any case, because the Geocode object supports 'toString' you can say:
			echo $event->location
		no matter what is returned.
		
		Geocoded addresses are required to place the location on a map.
	--> #}
	<p><strong>Where:</strong> {{ event.location }}</p>
	
	{#
	<p><strong>Vote:</strong> Rating: <span id="event-rating">{{ event.rating }}</span>
	<form method="post" action="<?php echo $event->voteURL ?>" id="vote-form">
		<select name="vote">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<input type="submit" value="Rate it!" />
	</form></p>
	<p>
		<?php Foundry::import( 'GCalendar:gCalendar/vote' ) ?>
	</p>
	#}
	
	<hr />
	
	<div id="google-map" class="mb" style="width:620;height:400px;">
		Loading...
	</div>
	
	{#
	<?php if( $event->related->length ) : ?>
		<p><strong>Releated events:</strong></p>
		
		<ul class="mb">
			<?php foreach( $event->related as $evt ) : ?>
				<li><a href="<?php echo $evt->url ?>"><?php echo $evt->title ?></a> - <?php echo date( 'm/d g:ia', $evt->start_time ) ?></li>
			<?php endforeach ?>
		</ul>
		
	<?php endif ?>
	#}
</div>

<div class="grid_4" id="gcal-sidebar">
	{% include 'google/calendar/calendar.tpl' %}
	
	<hr class="mb" />
	<p>Are we missing something? <a href="{{ 'google:calendar/submit'|url }}"><strong>Submit an event listing</strong></a>.</p>
	<hr class="mb" />
	
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear"></div>
<hr class="grid_12 double mmb" />


<div class="grid_8" id="comments">
	{% import 'macros/comment.tpl' as comment %}
	<div class="grid_3 alpha">
		<h5 class="mmb">{{ event.commentTotal|int2noun('comment') }}</h5>
	</div>
	<div class="grid_5 omega">
		{{ comment.pagers(event) }}
	</div>
	<div class="clear"></div>
	
	{% if event.commentTotal > 0 %}
		{{ comment.list(event) }}
	{% else %}
		<p class="body-copy">Be the first to comment on this event!</p>
	{% endif %}
	
	<div class="grid_3 alpha">
		<h5 class="mmb">&nbsp;</h5>
	</div>
	<div class="grid_5 omega">
		{{ comment.pagers(event) }}
	</div>
	<div class="clear"></div>
</div>

<div class="grid_4" id="comments_right">
	{% if event.shouldAllowComments %}
		{% set commentItem = event %}
		{% include 'gryphon/comment/form.tpl' %}
	{% else %}
		<p><strong>Comments are closed for this item.</strong></p>
	{% endif %}
	
	{% include 'gryphon/main/modules/fb_fan.tpl' %}
</div>

<div class="clear mbb"> </div>
{% endblock content %}