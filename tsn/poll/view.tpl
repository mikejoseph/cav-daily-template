{% extends "gryphon/base.tpl" %}

{% block title %} :: Poll : {{ poll.title }} {% endblock %}
{% block activeNav %}opinion{% endblock %}
{% block flag %}Poll{% endblock %}

{% block scripts %}
	<script src="{{ 'gfn-blackletter/js/json2.js'|url }}" type="text/javascript"></script>
	<script src="{{ 'gfn-blackletter/js/swfobject.js'|url }}" type="text/javascript"></script>
{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h1>Poll: {{ poll.title }}</h1>
	
	<div class="mmb"> </div>
	
	<div class="body-copy boot mmb"><p>{{ poll.question_formatted }}</p></div>
	
	<div class="body-copy">
		<script type="text/javascript">
			swfobject.embedSWF("/flash/open_flash_charts/open-flash-chart.swf", "archive_chart", "620", "400", "9.0.0");
		</script>
		
		<script type="text/javascript">
		
		function ofc_ready()
		{
	
		}
		
		function open_flash_chart_data()
		{
			return JSON.stringify(data);
		}
		
		function findSWF(movieName) {
		  if (navigator.appName.indexOf("Microsoft")!= -1) {
			return window[movieName];
		  } else {
			return document[movieName];
		  }
		}
		
		function wordwrap (str, int_width, str_break, cut) {
			var m = ((arguments.length >= 2) ? arguments[1] : 40   );
			var b = ((arguments.length >= 3) ? arguments[2] : "\n" );
			var c = ((arguments.length >= 4) ? arguments[3] : false);
		
			var i, j, l, s, r;
		
			str += '';
		
			if (m < 1) {
				return str;
			}
		
			for (i = -1, l = (r = str.split(/\r\n|\n|\r/)).length; ++i < l; r[i] += s) {
				for (s = r[i], r[i] = ""; s.length > m; r[i] += s.slice(0, j) + ((s = s.slice(j)).length ? b : "")){
					j = c == 2 || (j = s.slice(0, m + 1).match(/\S*(\s)?$/))[1] ? m : j.input.length - j[0].length || c == 1 && m || j.input.length + (j = s.slice(m).match(/^\S*/)).input.length;
				}
			}
			
			return r.join("\n");
		}
			
		var data = {
			"bg_colour": "#FFFFFF",
			  "elements":[
				{
				  "type":      "pie",
				  "colours":   ["#d01f3c","#356aa0","#C79810", "#1FC710", "#9310C7"],
				  "alpha":     0.6,
				  "border":    2,
				  "font-size": 14,
				  "start-angle": 45,
				
				"values" :   [
					{% for item in poll.getResponses() %}
						{"value":{{ item.votes }},"label":"{{ item.percent }}%","tip":"({{ item.votes }} out of {{ poll.responses }}) <br>" + wordwrap("{{ item.answer }}")},
					{% endfor %}
				] 
				}
			  ]
		};
		</script>
	
	
		<div id="archive_chart">
			<ul id="poll-questions">
			{% for response in poll.getResponses() %}
				<li><strong>{{ response.percent }}%</strong> {{ response.answer }}</li>
			{% endfor %}
			</ul>
		</div>
	
		<p><em>Out of {{ poll.responses }} total responses.</em></p>
		
		<hr class="mmb" />
		
		<a href="{{ 'section/opinion'|url }}">Return to Opinion</a>
		|
		<a href="{{ 'tsn:poll/archive'|url }}">Return to Poll Archive</a>
	
	</div><!-- .body-copy -->
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear mbb"> </div>
{% endblock content %}
