{% import "macros/meta.tpl" as metaRender %}
<div class="box mb">
	<div class="tabheader hat mmb">
		<ul>
			<li><a class="" href="#tab-posts">Blog Posts</a></li>
			<li><a class="" href="#tab-popular">Popular</a></li>
			<li><a class="" href="#tab-comments">Comments</a></li>
		</ul>
		<div class="clear"> </div>
	</div>

        <div id="tab-posts" class="ui-tabs-hide">
                <ul class="ind aside boot">
                        {% fetch posts from blogPost with [
                                'where': 'status = 1',
                                'order': 'created desc',
                                'limit': 5
                        ] %}
                        {% for post in posts %}
                                <li><a href="{{ post.url }}">{{ post.headline }}</a> &middot; {{ metaRender.dateLine(post.modified) }}
                                <br /><strong>Posted in</strong>: <a href="{{ post.blog.url }}">{{ post.blog.name }}</a></li>
                        {% endfor %}
                </ul>
        </div>

	<div id="tab-popular" class="ui-tabs-hide">
		<ul class="ind aside boot">
			{% set range = config.get('dsw:popularrange') %}
			{% set popular = 'article'|call('popular', [5, range, 'today']) %}
			{% for article in popular %}
				<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;&middot; <strong>{{ article.commentTotal|int2noun('comment') }}</strong></li>
			{% endfor %}
		</ul>
	</div>
	
	<div id="tab-comments" class="ui-tabs-hide">
		<ul class="ind aside boot">
			{% fetch comments from comment with [
				'where': 'status = 1 and item_type = "article"',
				'order': 'created desc',
				'limit': 5,
				'forceCache': true
			] %}
			{% for comment in comments %}
				<li><strong>{{ comment.name }}</strong> on <a href="{{ comment.url }}">{{ comment.item.title }}</a>
				{# <br class="mmb" /><em>{{ comment.preview|clip(45) }}</em> #}</li>
			{% endfor %}
		</ul>
	</div>
	
</div>
