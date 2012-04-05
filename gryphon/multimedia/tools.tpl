{% if toolitem.media_type == 'Gallery' %}
	{% set url = toolitem.urlDefault %}
{% else %}
	{% set url = toolitem.urlMultimedia %}
{% endif %}
<script type="text/javascript">
function fbs_click() {
	u = '{{ url }}';
	t = '{{ toolitem.title }}';
	window.open(
		'http://www.facebook.com/sharer.php?u=' + encodeURIComponent(u) + '&t=' + encodeURIComponent(t),
		'sharer',
		'toolbar=0,status=0,width=626,height=436'
	);
	return false;
}
</script>
<div class="hat mmb">
	<div class="right aside">
		<a href="http://twitter.com/home?status=Just read {{ url }}" target="_blank" title="Share on Twitter"><img src="{{ 'gfn-blackletter/assets/tools/twitter.png'|url }}" style="position:relative;top:4px;" /></a>&nbsp;&nbsp;<a href="http://www.facebook.com/share.php?u={{ url }}" onclick="return fbs_click();" target="_blank" title="Share on Facebook"><img src="{{ 'gfn-blackletter/assets/tools/facebook.png'|url }}" style="position:relative;top:4px;" /></a>&nbsp;&nbsp;<a href="http://digg.com/submit?phase=2&amp;url={{ url|urlencode }}&amp;title={{ toolitem.title|urlencode }}&amp;bodytext={{ toolitem.title|urlencode }}" title="Share on Digg"><img src="{{ 'gfn-blackletter/assets/tools/digg.png'|url }}" style="position:relative;top:4px;" alt="Share on Digg" /></a>
	</div>
	<h6>Share</h6>
</div>