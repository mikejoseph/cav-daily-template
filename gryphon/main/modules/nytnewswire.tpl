{% import "macros/meta.tpl" as metaRender %}

<div class="grid_12 alpha omega">
	<div class="wrap mmb">
		<h5 class="ind">Nation &amp; World</h5>
	</div>
	
	{% fetch items from nyt:newswireItem with [
		'order': 'updated desc',
		'limit': 8
	] %}
	
	<div class="grid_6 alpha">
		
		<ul class="ind mb">
			{% for item in items.shift((items.length)/2) %}
				<li>
					<a href="{{ item.url }}">{{ item.title }}</a> {{ metaRender.dateLine(item.pubdate) }}
				
					<p>{{ item.abstract }}</p>
				</li>
			{% endfor %}
		</ul>
		
	</div>
	
	<div class="grid_6 omega">
		
		<ul class="ind mb">
			{% for item in items %}
				<li>
					<a href="{{ item.url }}">{{ item.title }}</a> {{ metaRender.dateLine(item.pubdate) }}
				
					<p>{{ item.abstract }}</p>
				</li>
			{% endfor %}
		</ul>
		
	</div>
</div>

<a href="http://nytimes.com"><img src="{{ 'style/gryphon/images/poweredby_nytimes_150a.png'|url }}" alt="Powered by NYTimes" /></a>

<div class="clear mb"> </div>


{# 4-column version
<!--
<div class="grid_12 alpha omega">
	<div class="wrap mmb">
		<h5 class="ind">Nation &amp; World B</h5>
	</div>
	{% fetch items from nyt:newswireItem with [
		'order': 'updated desc',
		'limit': 16
	] %}
	
	<div class="grid_3 alpha">
		
		<ul class="ind mb">
			{% for item in items.shift(4) %}
				<li>
					<a href="{{ item.url }}">{{ item.title }}</a> {{ metaRender.dateLine(item.pubdate) }}
				</li>
			{% endfor %}
		</ul>
		
	</div>
	
	<div class="grid_3">
		
		<ul class="ind mb">
			{% for item in items.shift(4) %}
				<li>
					<a href="{{ item.url }}">{{ item.title }}</a> {{ metaRender.dateLine(item.pubdate) }}
				</li>
			{% endfor %}
		</ul>
		
	</div>

	<div class="grid_3">
		
		<ul class="ind mb">
			{% for item in items.shift(4) %}
				<li>
					<a href="{{ item.url }}">{{ item.title }}</a> {{ metaRender.dateLine(item.pubdate) }}
				</li>
			{% endfor %}
		</ul>
		
	</div>

	<div class="grid_3 omega">
		
		<ul class="ind mb">
			{% for item in items %}
				<li>
					<a href="{{ item.url }}">{{ item.title }}</a> {{ metaRender.dateLine(item.pubdate) }}
				</li>
			{% endfor %}
		</ul>
		
	</div>

</div>

<a href="http://nytimes.com"><img src="{{ 'style/gryphon/images/poweredby_nytimes_150a.png'|url }}" alt="Powered by NYTimes" /></a>
-->
#}