{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ blog.name }} : {{ post.headline }}{% endblock %}
{% block activeNav %}blogs{% endblock %}
{% block flag %}Blogs{% endblock %}
{% block styles %}
<link rel="stylesheet" type="text/css" href="{{ 'gfn-blackletter/css/thickbox.css'|url }}" media="screen, projection" />
{% endblock %}

{% block scripts %}
<script type="text/javascript" src="{{ 'gfn-blackletter/js/thickbox-compressed.js'|url }}"></script>
{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ post.headline }} : Comments" href="{{ post.url }}.xml" />
{% endblock %}

{% block content %}
{% helper dswSync %}
{% import "macros/meta.tpl" as metaRender %}

{% set mugShot = post.media.grab('meta', 'mugshot', true) %}
{% set images = post.media.grab('type', 'image', true) %}

{% set video = post.media.grab('type', 'video', true) %}
{% set audio = post.media.grab('type', 'audio', true) %}
{% set slides = post.media.grab('type', 'soundSlide', true) %}
{% set interactives = post.media.grab('type', 'flash', true) %}
{% set pdfs = post.media.grab('type', 'pdf', true) %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}

<div class="grid_8">
	<h1>{{ post.headline }}</h1>
	
	<div class="mmb"> </div>
	
	<div>{{ metaRender.byLine(post) }}</div>
	
	<div class="mb"><em>Updated:</em> {{ post.modified|timeSince }}</div>
	
	<div id="story-sidebar" class="grid_4 omega">
		<div class="hat">
			<div class="right"><a href="{{ blog.url }}">Home</a> | <img src="{{ 'gfn-blackletter/assets/49.png'|url }}" style="position:relative;top:2px;" /> <a href="{{ blog.url }}.xml">RSS</a></div>
			<h3 class="mmb">{{ blog.name }}</h3>
			
			<div class="caption">
				{{ blog.description_formatted }}
			</div>
		</div>
	
		{% set article = post %}
		{% include 'gryphon/article/tools.tpl' %}
		
		{% for image in images %}
			<div class="mmb"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" /></div>
			
			{% if config.get('fotobroker:url') %}
				{% if not 'skip import'|in(image.meta) %}
					{% if dswSync.buyURL(image) %}
						<a href="{{ dswSync.buyURL(image) }}" class="reprints-button"></a>
					{% else %}
						<a href="{{ config.get('dsw:fotourl')|url }}" class="reprints-button"></a>
					{% endif %}
				{% endif %}
			{% endif %}
			
			{{ metaRender.smCred(image) }}
		
			<div class="clear mmb"> </div>
			<div class="caption mmb">
				{{ image.caption_formatted }}
			</div>
		{% endfor %}
	
		
		{% if video.length or audio.length or slides.length or interactives.length or pdfs.length %}
			<div class="wrap mmb">
				<h6>Multimedia</h6>
			</div>
			{% for item in video %}{{ render.section(item) }}{% endfor %}
			{% for item in audio %}{{ render.section(item) }}{% endfor %}
			{% for item in slides %}{{ render.section(item) }}{% endfor %}
			{% for item in interactives %}{{ render.listItem(item) }}{% endfor %}
			{% for item in pdfs %}{{ render.section(item) }}{% endfor %}
		{% endif %}
		
		<div class="mb">
			<div class="wrap mmb">
				<h6>Latest Entries</h6>
			</div>
			
			<ul class="boot">
				{% set latest = blog.posts.shift(5) %}
				{% for item in latest %}
					<li><h4><a href="{{ item.url }}">{{ item.headline }}</a></h4> {{ metaRender.dateLine(item.created) }}</li>
				{% endfor %}
			</ul>
		</div>
	</div><!-- #story-sidebar -->
	
	
	
	{% for item in mugShot %}
		<div class="thumb">
			<img src="{{ item.urlThumbnail }}" alt="{{ item.base_name }}" />
			<div class="aside"><strong>{{ item.caption_formatted }}</strong></div>
		</div>
	{% endfor %}

	<div class="body-copy boot mmb">
		{{ post.copy_formatted }}
		<div class="clear"> </div>
	</div>
	
	<div class="caption mmb">
		Published {{ post.created|date('F j, Y') }} in <a href="{{ blog.url }}">{{ blog.name }}</a>
	</div>
	
	
	<div id="emailbox" style="display:none">
		<form id="emailarticle" style="margin-top:10px;" method="post" action="{{ mailUrl }}">
			<input type="hidden" name="mailKey" value="{{ mailKey }}" />
			<input type="hidden" name="mailitem" value="gryphon:blogPost" />
			<input type="hidden" name="mailid" value="{{ post.uid }}" />
		
			<div class="mmb aside2">
				<div style="width:100px;float:left;"><label for="mailname">Your name</label></div>
				<div style="width:200px;float:left;">
					<input type="text" size="15" id="mailname" name="from" />
				</div>
				<div class="clear"> </div>
			</div>
			
			<div class="mmb aside2">
				<div style="width:100px;float:left;"><label for="mailfrom">Your email</label></div>
				<div style="width:200px;float:left;">
					<input type="text" size="15" id="mailfrom" name="from" />
				</div>
				<div class="clear"> </div>
			</div>
		
			<div class="mmb aside2">
				<div style="width:100px;float:left;"><label for="mailto">To email</label></div>
				<div style="width:200px;float:left;">
					<input type="text" size="15" id="mailto" name="to" />
				</div>
				<div class="clear"> </div>
			</div>
			
			<div class="mmb aside2">
				<div style="width:100px;float:left;"><label for="mailmessage">Message</label></div>
				<div style="width:200px;float:left;">
					<textarea rows="5" name="mailmessage" style="width:100%"></textarea>
				</div>
				<div class="clear"> </div>
			</div>
			
			<div style="width:100px;float:left;">&nbsp;</div>
			<div style="width:200px;float:left;">		
				<input type="submit" value="Submit" />
			</div>
			<div class="clear"> </div>
		</form>
	</div>
	
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear"> </div>
<hr class="grid_12 double" />


<div class="grid_6" id="comments">
	{% import 'macros/comment.tpl' as comment %}
	
	<h5 class="mmb">{{ post.commentTotal|int2noun('comment') }}</h5>
	
	{{ comment.pagers(post) }}

	{% if post.commentTotal > 0 %}
		{{ comment.list(post) }}
	{% else %}
		<p class="body-copy">Be the first to comment on this post!</p>
	{% endif %}
	
	{{ comment.pagers(post) }}
	<div class="clear"></div>
</div>

<div class="grid_4">
	{% if post.shouldAllowComments %}
		{% set commentItem = post %}
		{% include 'gryphon/comment/form.tpl' %}
	{% else %}
		<p><strong>Comments are closed for this item.</strong></p>
	{% endif %}
</div>

<div class="grid_2">
	<div class="mmb"> </div>
	{#{% include 'gryphon/ads/comment_skyscraper_140x600.tpl' %}#}
</div>

<div class="clear mbb"> </div>
{% endblock content %}