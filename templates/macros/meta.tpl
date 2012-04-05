{% macro dateLine(item) %}
	{% if (now|date('U') - item) < 7200 %}
		{# less than 2 hours old #}
		<span class="sm attn">{{ item|timeSince }}</span>
	{% elseif (now|date('U') - item) < 43200 %}
		{# less than 12 hours old #}
		<span class="sm dateline">{{ item|timeSince }}</span>
	{% else %}
		<span class="sm dateline">{{ item|date('M j')|upper }}</span>
	{% endif %}
{% endmacro %}

{% macro dateLong(item) %}
	{% if (now|date('U') - item) < 7200 %}
		{# less than 2 hours old #}
		<span class="attn">{{ item|timeSince }}</span>
	{% elseif (now|date('U') - item) < 43200 %}
		{# less than 12 hours old #}
		<span>{{ item|timeSince }}</span>
	{% else %}
		<span>{{ item|date('F j, Y, g:i A') }}</span>
	{% endif %}
{% endmacro %}

{% macro byLine(item) %}
	{% helper config %}
	{% if item.authors.length %}
		{% set author = item.authors.shift() %}
		By <a href="{{ author.url }}">{{ author.name|upper }}</a>
		{% if config.get('dsw:showtaglines') %}
			<span class="article-tagline"> | {{ author.tagline ? author.tagline : config.get('gryphon:publication:name') }}</span>
		{% endif %}
		
		{% for author in item.authors %}
			<br /><span style="visibility:hidden;">By </span><a href="{{ author.url }}">{{ author.name|upper }}</a>
			{% if config.get('dsw:showtaglines') %}
				<span class="article-tagline"> | {{ author.tagline ? author.tagline : config.get('gryphon:publication:name') }}</span>
			{% endif %}
		{% endfor %}
		
	{% endif %}
{% endmacro %}

{% macro domCred(item) %}
	{% helper config %}
	{% if item.authors.length %}
		{% set author = item.authors.shift() %}
		<div class="credit aside">
			<a href="{{ author.url }}">{{ author.name }}</a>
			{% if config.get('dsw:showtaglines') %}
				 | {{ author.tagline ? author.tagline : config.get('gryphon:publication:shortname') }}
			{% endif %}
		</div>
	{% endif %}
{% endmacro %}

{% macro smCred(item) %}
	{% helper config %}
	{% if item.authors.length %}
		{% set author = item.authors.shift() %}
		<div class="right aside">
			<a href="{{ author.url }}">{{ author.name }}</a>
			{% if config.get('dsw:showtaglines') %}
				/ {{ author.tagline ? author.tagline : config.get('gryphon:publication:shortname') }}
			{% endif %}
		</div>
	{% endif %}
{% endmacro %}