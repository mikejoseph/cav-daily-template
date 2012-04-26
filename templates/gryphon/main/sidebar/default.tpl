
<div id="social-buttons">
	<a href="http://facebook.com"><img src="{{ 'assets/images/icons/facebook-57.png'|asset }}" class="flex-image" /></a>
	<a href="http://twitter.com"><img src="{{ 'assets/images/icons/twitter-57.png'|asset }}" class="flex-image" /></a>
	<a href="http://youtube.com"><img src="{{ 'assets/images/icons/youtube-57.png'|asset }}" class="flex-image" /></a>
	<a href="{{ 'page/feeds'|url }}"><img src="{{ 'assets/images/icons/rss-57.png'|asset }}" class="flex-image" /></a>
</div>

<hr class="double hairline" />

{% include 'gryphon/main/ads/rectangle.tpl' %}

<hr class="double harline" />

{% include 'gryphon/main/modules/recent.tpl' %}

<hr class="double spacer" />

{% include 'gryphon/main/modules/twitter_feed.tpl' %}
