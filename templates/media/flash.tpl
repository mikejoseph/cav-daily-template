<script type="text/javascript" src="{{ 'flash/jwplayer/swfobject.js'|url }}"></script>
<div class="" id="player-{{ media.uid }}" style="width:620px"></div>
<script type="text/javascript">
//<![CDATA[
 $(document).ready(function() {
 var s1 = new SWFObject("{{ media.urlOriginal }}","ply","620","420","9","#FFFFFF");
 s1.addParam("movie","{{ media.urlOriginal }}");
 s1.addParam("allowscriptaccess","always");
 s1.addParam("wmode","opaque");
 s1.addParam("scale","showall");
 s1.addParam("quality","autohigh");
 s1.addParam("allowfullscreen","true");
 s1.addParam("play","true");
 s1.addParam("menu","false");
 s1.addParam("loop","true");
 s1.write("player-{{ media.uid }}");
});
//]]>
</script>