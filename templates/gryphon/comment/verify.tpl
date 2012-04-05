{% extends "gryphon/base.tpl" %}
{% block title %} :: Verify email address{% endblock %}
{% block content %}

<div class="grid_8">
	<p class="alert">Your email address has been verified</p>
	
	<p>
		We won't ask you to re-verify this email address again. <a href="{{ comment.item.url~'#comments' }}">Go to your comment</a>.
	</p>
</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>
{% endblock %}