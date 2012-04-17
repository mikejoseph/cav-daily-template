{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ article.headline }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block links %}
<link rel="canonical" type="text/html" href="{{ shortUrl }}" />
<link rel="alternate shorter" type="text/html" href="{{ shortUrl }}" />
<link rel="alternate" type="application/rss+xml" title="{{ article.headline }} : Comments" href="{{ article.url }}.xml" />
{% endblock %}

{% block content %}

	{% helper dswSync %}
	{% import "macros/meta.tpl" as metaRender %}
	{% import "macros/render.tpl" as mediaRender %}

	{% set mugShot = article.media.grab('meta', 'mugshot', true) %}
	{% set images = article.media.grab('type', 'image', true) %}

	{% set video = article.media.grab('type', 'video', true) %}
	{% set audio = article.media.grab('type', 'audio', true) %}
	{% set slides = article.media.grab('type', 'soundSlide', true) %}
	{% set interactives = article.media.grab('type', 'flash', true) %}
	{% set pdfs = article.media.grab('type', 'pdf', true) %}

	{% set sections = article.sections %}

	<div class="row">
		<div class="span8">
			<article class="article">
				<h1>{{ article.headline }}</h1>
				{% if article.subhead %}
					<h3>{{ article.subhead }}</h3>
				{% endif %}

				<aside class="byline">
					By {{ article.authors.splat('name')|join(', ') }} |
					{{ article.created|date('M d') }}
				</aside>

				<div class="media">
				{% for image in images %}
					<a href="{{ image.url }}" rel="article" class="fancybox">
						<img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" />
					</a>

					{% if config.get('fotobroker:url') %}
						{% if not 'skip import'|in(image.meta) %}
							{% if dswSync.buyURL(image) %}
								<a href="{{ dswSync.buyURL(image) }}" class="reprints-button"></a>
							{% else %}
								<a href="{{ config.get('dsw:fotourl')|url }}" class="reprints-button"></a>
							{% endif %}
						{% endif %}
					{% endif %}
					<aside class="byline">
						{{ metaRender.smCred(image) }}
					</aside>
					<div class="caption">
						{{ image.caption_formatted }}
					</div>

					<hr class="spacer" />

				{% endfor %}

					{% if video.length or audio.length or slides.length or interactives.length or pdfs.length %}
						<hr class="half hairline" />

						{% for item in audio %}
							<h5><i class="icon-music"></i> {{ item.title }}</h5>
							{{ mediaRender.media(item) }}
							<hr class="double hairline" />
						{% endfor %}

						{% for item in pdfs %}
							<h5><i class="icon-file"></i> {{ item.title }}</h5>
							<a class="offset" href="{{ item.urlOriginal }}">Download PDF</a>
							<hr class="double hairline" />
						{% endfor %}

						{% for item in video %}
							<h5><i class="icon-film"></i> {{ item.title }}</h5>
							<a href="{{ item.urlDefault }}" class="offset">
								<img src="{{ item.urlPreview }}" />
							</a>
							<hr class="double hairline" />
						{% endfor %}

					{% endif %}

				</div>

				{{ article.copy_formatted }}

				<hr class="double hairline" />

				<div class="well">
					Published {{ article.created|date('F j, Y') }}

					{% if sections.length %}
						{% set limit = sections.length %}
						{% if config.get('gryphon:default:section')|in(sections.splat('slug')) %}
							{% set limit = limit-1 %}
						{% endif %}

						{% if limit %}in {% endif %}

						{% for section in sections %}
							{% if section.slug == config.get('gryphon:default:section') %}
							{% else %}
								<a href="{{ section.url }}">{{ section.name }}</a>{% if loop.index < limit %}, {% endif %}
							{% endif %}
						{% endfor %}
					{% endif %}
				</div>

			</article>
		</div>
		<div class="span4">
			{% include 'gryphon/main/sidebar/default.tpl' %}
		</div>
	</div>

	<hr class="spacer" />

	<div class="row">
		<div class="span8">
			{% if article.shouldAllowComments %}
				{{ disqus.list(article) }}
			{% else %}
				<p><strong>Comments are closed for this item.</strong></p>
			{% endif %}

		</div>
		<div class="span4">

		</div>
	</div>

{% endblock %}

{% block fork %}
	{% helper dswSync %}
	{% import "macros/meta.tpl" as metaRender %}

	{% set mugShot = article.media.grab('meta', 'mugshot', true) %}
	{% set images = article.media.grab('type', 'image', true) %}

	{% set video = article.media.grab('type', 'video', true) %}
	{% set audio = article.media.grab('type', 'audio', true) %}
	{% set slides = article.media.grab('type', 'soundSlide', true) %}
	{% set interactives = article.media.grab('type', 'flash', true) %}
	{% set pdfs = article.media.grab('type', 'pdf', true) %}

	{% set sections = article.sections %}


	<div class="grid_8">
		{% if message %}
			<p><strong class="alert">{{ message.value }}</strong></p>
			<hr class="mb" />
		{% endif %}

		<h1>{{ article.headline }}</h1>
		<h3><em>{{ article.subhead }}</em></h3>

		<div class="mmb"> </div>

		<div>{{ metaRender.byLine(article) }}</div>

		<div class="mb"><em>Updated:</em> {{ article.modified|timeSince }}</div>

			<a href="http://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-via="otterbein360">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>

			<iframe src="http://www.facebook.com/plugins/like.php?href={{ shortUrl }}&amp;layout=button_count&amp;show_faces=false&amp;width=200&amp;action=recommend&amp;font=arial&amp;colorscheme=light&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:200px; height:21px;" allowTransparency="true"></iframe>


		<div id="story-sidebar" class="grid_4 omega">
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

			{% if article.infobox %}
				<div class="wrap mmb">
					<h6>More information</h6>
				</div>

				<div class="infobox">
					{{ article.infobox_formatted }}
				</div>
			{% endif %}

			<div class="mb"> </div>
			<div class="hat">
				<h6>Possibly Related</h6>
			</div>
			<ul class="hat">
				{% for article in article.related %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> {{ metaRender.dateLine(article.created) }}</li>
				{% endfor %}
			</ul>
		</div><!-- #story-sidebar -->



		{% for item in mugShot %}
			<div class="thumb">
				<img src="{{ item.urlThumbnail }}" alt="{{ item.base_name }}" />
				<div class="aside"><strong>{{ item.caption_formatted }}</strong></div>
			</div>
		{% endfor %}

		<div class="body-copy boot mmb">
			{{ article.copy_formatted }}
			<div class="clear"> </div>
		</div>

		<div class="caption mmb">
			Published {{ article.created|date('F j, Y') }}

			{% if sections.length %}
				{% set limit = sections.length %}
				{% if config.get('gryphon:default:section')|in(sections.splat('slug')) %}
					{% set limit = limit-1 %}
				{% endif %}

				{% if limit %}in {% endif %}

				{% for section in sections %}
					{% if section.slug == config.get('gryphon:default:section') %}
					{% else %}
						<a href="{{ section.url }}">{{ section.name }}</a>{% if loop.index < limit %}, {% endif %}
					{% endif %}
				{% endfor %}
			{% endif %}
		</div>


		<div id="emailbox" style="display:none">
			<form id="emailarticle" style="margin-top:10px;" method="post" action="{{ mailUrl }}">
				<input type="hidden" name="mailkey" value="{{ mailKey }}" />
				<input type="hidden" name="mailitem" value="gryphon:article" />
				<input type="hidden" name="mailid" value="{{ article.uid }}" />

				<div class="mmb aside2">
					<div style="width:100px;float:left;"><label for="mailname">Your name</label></div>
					<div style="width:200px;float:left;">
						<input type="text" size="15" id="mailname" name="mailname" />
					</div>
					<div class="clear"> </div>
				</div>

				<div class="mmb aside2">
					<div style="width:100px;float:left;"><label for="mailfrom">Your email</label></div>
					<div style="width:200px;float:left;">
						<input type="text" size="15" id="mailfrom" name="mailfrom" />
					</div>
					<div class="clear"> </div>
				</div>

				<div class="mmb aside2">
					<div style="width:100px;float:left;"><label for="mailto">To email</label></div>
					<div style="width:200px;float:left;">
						<input type="text" size="15" id="mailto" name="mailto" />
					</div>
					<div class="clear"> </div>
				</div>

				<div class="mmb aside2">
					<div style="width:100px;float:left;"><label for="mailmessage">Message</label></div>
					<div style="width:200px;float:left;">
						<textarea rows="5" id="mailmessage" name="mailmessage" style="width:100%"></textarea>
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

		<h5 class="mmb">{{ article.commentTotal|int2noun('comment') }}</h5>

		{{ comment.pagers(article) }}

		{% if article.commentTotal > 0 %}
			{{ comment.list(article) }}
		{% else %}
			<p class="body-copy">Be the first to comment on this article!</p>
		{% endif %}

		{{ comment.pagers(article) }}
		<div class="clear"></div>
	</div>

	<div class="grid_4">
		{% if article.shouldAllowComments %}
			{{ disqus.list(article) }}
		{% else %}
			<p><strong>Comments are closed for this item.</strong></p>
		{% endif %}
	</div>

	<div class="grid_2">
		<div class="mmb"> </div>
		{#{% include 'gryphon/ads/comment_skyscraper_140x600.tpl' %}#}
	</div>

	<div class="clear mbb"> </div>
{% endblock %}