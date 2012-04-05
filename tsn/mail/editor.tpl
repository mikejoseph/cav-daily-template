{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ form.subject }}{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>Letter to the Editor</h1>
	
	<div class="mmb"> </div>
	
	<div class="body-copy boot mmb">

		<p>We would love to hear from you. Write a letter to the Editor and tell us what you're thinking.</p>
		
		<p>Letters to the Editor are letters responding to an article published in the Tan & Cardinal or online at Otterbein360.com.</p>
		
		<p>Please keep your letter to 300 words or less. It is at the discretion of the Tan & Cardinal and/or the Otterbein360 staff. Letters attacking an individual will not be accepted.</p>
		
		<p>If your letter is in response to a specific article, please include the article title in the Subject line, and a link to the article if possible. We will contact you if your letter is chosen to be published. Thank you! </p>
		
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