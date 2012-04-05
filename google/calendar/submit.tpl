{% extends "gryphon/base.tpl" %}
{% block title %} :: Event Calendar : Submit{% endblock %}
{% block activeNav %}events{% endblock %}
{% block flag %}Events{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>Submit an event listing</h1>
	
	<div class="mmb"> </div>
	
	<div class="body-copy boot mb">
		{% if error %}
			<ul class="error mb">
			{% for item in error %}
				<li>{{ item }}</li>
			{% endfor %}
			</ul>
			<hr class="mb" />
		{% elseif success %}
			<p><strong class="alert">Thanks!</strong></p>
			
			<p>This event will be reviewed for addition to the Event Calendar.</p>
			<hr class="mb" />
		{% endif %}
		
		<p>Submit your event listings using the form below. Events will be held for approval by an administrator before appearing on the site.</p>
		
		<p>If you have a big list of events you'd like considered, or to provide an iCal-formatted feed for us to import, please <a href="{{ 'page/about_us'|url }}">contact us</a> for more information.</p>
	</div>

	<form method="post" action="{{ 'google:calendar/submit'|url }}" class="contact" id="form_eventSubmit">
		<table class="formwrap">
			<tr>
				<th><label for="title">Event title</label></th>
				<td><input type="text" name="title" size="30" value="{{ posted.title }}" /></td>
			</tr>
			
			<tr>
				<th><label for="start">Start date</label></th>
				<td><input name="start" type="text" size="12" id="input_dateStart" class="DatePicker" value="{{ posted.start }}" /> <span>mm/dd/yyyy</span></td>
			</tr>
			
			<tr>
				<th><label for="end">End date</label></th>
				<td><input name="end" type="text" size="12" id="input_dateEnd" class="DatePicker" class="full" value="{{ posted.end }}" /> <span>mm/dd/yyyy</span></td>
			</tr>
			
			<tr>
				<th><label for="starttime">Start time</label></th>
				<td>
					<select name="startHour">
						<option value="false"></option>
					{% for i in 1..12 %}
						<option value="{{ i }}"{% if i == posted.startHour %} selected="selected"{% endif %}>{{ i }}</option>
					{% endfor %}
					</select>
					:
					<select name="startMinute">
						<option value="false"></option>
						<option value="00">00</option>
						<option value="15"{% if posted.startMinute == 15 %} selected="selected"{% endif %}>15</option>
						<option value="30"{% if posted.startMinute == 30 %} selected="selected"{% endif %}>30</option>
						<option value="45"{% if posted.startMinute == 45 %} selected="selected"{% endif %}>45</option>
					</select>
					<select name="startAP">
						<option value="false"></option>
						<option value="a"{% if posted.startAP == 'a' %} selected="selected"{% endif %}>am</option>
						<option value="p"{% if posted.AP == 'p' %} selected="selected"{% endif %}>pm</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th><label for="endtime">End time</label></th>
				<td>
					<select name="endHour">
						<option value="false"></option>
						{% for i in 1..12 %}
							<option value="{{ i }}">{{ i }}</option>
						{% endfor %}
					</select>
					:
					<select name="endMinute">
						<option value="false"></option>
						<option value="00">00</option>
						<option value="15"{% if posted.endMinute == 15 %} selected="selected"{% endif %}>15</option>
						<option value="30"{% if posted.endMinute == 30 %} selected="selected"{% endif %}>30</option>
						<option value="45"{% if posted.endMinute == 45 %} selected="selected"{% endif %}>45</option>
					</select>
					<select name="endAP">
						<option value="false"></option>
						<option value="a"{% if posted.endAP == 'a' %} selected="selected"{% endif %}>am</option>
						<option value="p"{% if posted.endAP == 'p' %} selected="selected"{% endif %}>pm</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th><label for="description">Description</label></th>
				<td><textarea name="description" cols="50" rows="5" style="width:100%;">{{ posted.description }}</textarea>
				Tell us about it. Does it repeat? How often?</td>
			</tr>
			
			<tr>
				<th><label for="location">Location</label></th>
				<td><textarea name="location" cols="50" rows="5" style="width:100%;">{{ posted.location }}</textarea>
				Include the address if possible.</td>
			</tr>
			
			<tr><td colspan="2"><hr /></td></tr>
			
			<tr>
				<th></th>
				<td><span class="error">*</span> <em>These fields are required, but will not be published.</em></td>
			</tr>
			
			<tr>
				<th><label for="sendername">Your name</label><span class="error">*</span></th>
				<td><input type="text" name="sendername" size="30" value="{{ posted.sendername }}" /></td>
			</tr>
			
			<tr>
				<th><label for="senderemail">Your email</label><span class="error">*</span></th>
				<td><input type="text" name="senderemail" size="30" value="{{ posted.senderemail }}" /></td>
			</tr>
			
			<tr>
				<th><label for="answer">Verification</label><span class="error">*</span></th>
				<td>
					<script type="text/javascript">
					var RecaptchaOptions = {
						theme : 'white'
					};
					</script>
					{% if turing %}
						{{ turing }}
					{% endif %}
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>	
	</form>
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