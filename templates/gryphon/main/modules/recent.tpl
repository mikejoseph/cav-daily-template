			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#2" data-toggle="tab">Blogs</a></li>
					<li><a href="#3" data-toggle="tab">Recent</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="2"><div class="well">
						{% fetch posts from blogPost with [
							'where': 'status = 1',
							'order': 'created desc',
							'limit': 10
						]%}
						<ul>
							{% for post in posts %}
								<li><a href="{{ post.url }}">{{ post.headline }}</a></li>
							{% endfor %}
						</ul>
					</div></div>
					<div class="tab-pane" id="3"><div class="well">
						{% fetch articles from article with [
							'where': 'status = 1',
							'order': 'weight desc, created desc',
							'limit': 10
						]%}
						<ul>
							{% for article in articles %}
								<li><a href="{{ article.url }}">{{ article.headline }}</a></li>
							{% endfor %}
						</ul>
					</div></div>
				</div>
			</div>
