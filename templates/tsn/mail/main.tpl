{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ form.subject }}{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>{{ form.subject }}</h1>
	
	<div class="mmb"> </div>
	
	<div class="body-copy boot mmb">
		<p>{{ form.instructions }}</p>
		
		{% if status == 'error' %}
			<p class="error"><strong>There was an error sending your message, please try again.</strong></p>
		{% elseif status == 'success' %}
			<p><strong>Sent! Thank you.</strong></p>
		{% endif %}
	</div>
	
	
	<form method="post" action="{{ form.urlSubmit }}" enctype="multipart/form-data">
		<input type="hidden" name="mailkey" value="{{ key }}" />
		
		<table class="formwrap">
			<tr>
				<th><label for="sender_name">Name</label></th>
				<td><input type="text" name="sender_name" value="{{ message.sender_name }}" size="30" /></td>
			</tr>
			
			<tr>
				<th><label for="sender">Email</label></th>
				<td>
					{% if form.sender %}
						{{ form.sender }}
					{% else %}
						<input type="text" size="30" name="sender" value="{{ message.sender }}" />
					{% endif %}
				</td>
			</tr>
			
			<tr>
				<th><label for="message">Message</label></th>
				<td><textarea rows="8" cols="50" name="message" style="width:100%;">{{ message.message }}</textarea></td>
			</tr>
			
			{% if form.allow_uploads %}
				<tr>
					<th><label for="file">Attachment</label></th>
					<td><input id="file" type="file" name="attached" /></td>
				</tr>
			{% endif %}
			
			<tr>
				<th></th>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form>
</div>

<div class="grid_4">
	{% include "gryphon/main/sidebar/default.tpl" %}
</div>

<div class="clear mbb"> </div>
{% endblock content %}