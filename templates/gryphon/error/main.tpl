{% extends 'gryphon/base.tpl' %}

{% block content %}
	{% helper config %}
	<div class="grid_8">
		<p class="error">Something has gone awry</p>
		
		<p>
			Ahh man, looks like we've encountered an error. Don't worry it wasn't your fault. Try hitting your browser's back button and trying again.
		</p>
		
		{#
		<p>
			If you think something has gone very, very wrong, please contact our <a href="#">web team</a> and let give them the following info:
		</p>
			
		<p><code>
			Type: {{ type|default('unknown') }}
			Query: {{ query }}
			Time: {{ now|date('c') }}
			UA: {{ ua }}
		</code></p>
		#}
		
		<hr class="mb" />
		
		{% if config.get('debug') %}
		<div class="mb">
			<h5>Extended debug</h5>
			{{ message }}<br /><br />

			Backtrace:<br /><br />
			{% for item in backtrace %}
				{{ item.file }}[:{{ item.line }}] {{ item.function }}<br />
			{% endfor %}
		</div>
		{% endif %}
		
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>
	
	<div class="clear mb">&nbsp;</div>
{% endblock %}