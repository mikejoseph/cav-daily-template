<div class="wrap shade mb">
	<h6 class="ind mmb">Search multimedia</h6>
	
	<div class="ind mb">
		<form id="mm-search " method="get" action="{{ 'search'|url }}">
			<input type="hidden" name="a" value="1" />
			<input type="hidden" name="ty" value="media" />
			<input type="hidden" name="tg" value="multimedia" />
			<input type="hidden" name="o" value="date" />
			
			<input type="text" name="s" size="30" /> <input type="submit" value="Search" />
		</form>
	</div>
</div>

{% include 'gryphon/ads/rectangle_300x250.tpl' %}
{% include 'gryphon/main/modules/gallery_box.tpl' with ['tagName': 'pow'] %}