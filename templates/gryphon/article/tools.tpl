{% if shortUrl %}
	{% set url = shortUrl %}
{% else %}
	{% set url = article.url %}
{% endif %}
<script type="text/javascript">
function fbs_click() {
	u = '{{ url }}';
	t = '{{ article.headline|urlencode }}';
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
		<a href="#print" title="Print article"><img src="{{ 'gfn-blackletter/assets/tools/print.gif'|url }}" style="position:relative;top:3px;" /></a>&nbsp;&nbsp;<a id="email_link" href="#TB_inline?height=200&width=350&inlineId=emailbox" class="thickbox"  title="Email this article"><img src="{{ 'gfn-blackletter/assets/tools/email.gif'|url }}" style="position:relative;top:3px;" alt="Email this article" /></a> &nbsp;|&nbsp; <a href="{{ article.url }}.xml" title="Article comments feed"><img src="{{ 'gfn-blackletter/assets/tools/feed.png'|url }}" style="position:relative;top:4px;" /></a>&nbsp;&nbsp;<a href="http://twitter.com/home?status=Just read {{ url }}" target="_blank" title="Share on Twitter"><img src="{{ 'gfn-blackletter/assets/tools/twitter.png'|url }}" style="position:relative;top:4px;" /></a>&nbsp;&nbsp;<a href="http://www.facebook.com/share.php?u={{ url }}" onclick="return fbs_click();" target="_blank" title="Share on Facebook"><img src="{{ 'gfn-blackletter/assets/tools/facebook.png'|url }}" style="position:relative;top:4px;" /></a>&nbsp;&nbsp;<a href="http://del.icio.us/post" onclick="window.open('http://del.icio.us/post?v=4&amp;noui&amp;jump=close&amp;url='+encodeURIComponent('{{ url }}')+'&amp;title='+encodeURIComponent('{{ article.headline }}'), 'delicious','toolbar=no,width=700,height=400'); return false;" title="Share on Delicious"><img src="{{ 'gfn-blackletter/assets/tools/delicious.png'|url }}" style="position:relative;top:4px;" alt="Share on Delicious" /></a>&nbsp;&nbsp;<a href="http://digg.com/submit?phase=2&amp;url={{ url|urlencode }}&amp;title={{ article.headline|urlencode }}&amp;bodytext={{ article.abstract|urlencode }}" title="Share on Digg"><img src="{{ 'gfn-blackletter/assets/tools/digg.png'|url }}" style="position:relative;top:4px;" alt="Share on Digg" /></a>
	</div>
	<h6>Tools</h6>
</div>
{#

<hr class="mmb" />
<div class="right aside">
	<div id="tsizers">
		<a id="tup" href="#" class="tsize" title="Increase text size"></a>
		<a id="tdn" href="#" class="tsize" title="Decrease text size"></a>
	</div>
	<a id="tres" href="#" title="Reset text size">Text size</a>
</div>
<div class="aside mmb" style="line-height:16px;">
	<img src="{{ 'gfn-blackletter/assets/icons/comment.gif'|url }}" /> <a href="#comments" title="Jump to comments">{{ article.commentTotal|int2noun('comment') }}</a>
</div>
<div class="clear"></div>
#}