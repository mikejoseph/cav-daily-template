{% extends "gryphon/base.tpl" %}
{% block title %} :: Comment : Flag{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
<div class="grid_8">
	{% if flagged %}
		<h1>Comment flagged for moderation</h1>
		
		<div class="body-copy boot mmb">
			<p>Our editors have been notified of this comment.</p>
		</div>
		
		Return to <a href="{{ comment.item.getURL() }}">{{ comment.item.getTitle() }}</a>
	{% else %}
	
		<h1>Flag comment for moderation</h1>
		
		<div class="mmb"> </div>
		
		<div class="body-copy boot mmb">
			{% if error %}
				<p class="error">{{ error }}</p>
			{% endif %}
			
			<p class="mmb">You are flagging the following comment:</p>
			
			<blockquote>{{ comment.comment_formatted }}</blockquote>
			
			<div class="aside2 mmb">&mdash; <em>{{ comment.created|date('g:i A F j, Y') }},</em> by <strong>{{ comment.name }}</strong></div>
		</div>

		<form method="post" action="{{ ('gryphon:comment/flag/'~comment.hash)|url }}">
		
		<table class="formwrap">
			<tr>
				<th><label>Spam</label></th>
				<td><input type="checkbox" name="spam" value="1" id="input_spam" />&nbsp; <label for="input_spam" style="display:inline;">This comment is spam</label></td>
			</tr>
			
			<tr>
				<th><label for="input_description">Remarks</label></th>
				<td>
					<textarea rows="8" cols="50" name="description" id="input_description" style="width:100%;">{{ note }}</textarea>
					<div class="aside">Is there anything you want to let the editor know about this comment?</div>
				</td>
			</tr>
			
			
			{% if turing %}
			<tr>
				<th><label>Verify</label></th>
				<td>
					{{ turing }}
					<div class="aside">We also need to verify that you are, in fact, human.</div>
				</td>
			</tr>
			{% endif %}
			
			<tr>
				<th></th>
				<td><input type="submit" value="Flag this comment" /></td>
			</tr>
		</table>
		</form>
		<hr class="mmb" />
		
		<p>Return to: <a href="{{ comment.item.getURL() }}">{{ comment.item.getTitle() }}</a></p>
	{% endif %}
</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>
<div class="clear mb"></div>
{% endblock content %}