{% fetch poll from tsn:poll with [
	'where': 'status = 1',
	'order': 'created desc',
	'limit': 1
] %}

<div class="wrap shade mb">
<div class="ind">
	<h6>Online Poll: {{ poll[0].title }}</h6>
	
	<h3 class="mmb">{{ poll[0].question_formatted }}</h3>
	
	<form method="post" action="{{ poll[0].urlSubmit }}">
		<a name="poll-{{ poll[0].uid }}"></a>
		
	{% if poll[0].userHasVoted %}
		<script type="text/javascript" src="/gfn-blackletter/js/json2.js"></script>
		<script type="text/javascript" src="/gfn-blackletter/js/swfobject.js"></script>
		<script type="text/javascript">
			swfobject.embedSWF("/flash/open_flash_charts/open-flash-chart.swf", "my_chart", "300", "240", "9.0.0");
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
			"tooltip": {
	//			"shadow": false,
				"stroke": 2,
				"colour": "#666666",
				"background": "#eeeeee",
				"title": "{font-size: 11px; font-weight:bold; color: #000000;}",
				"body": "{font-size: 11px;}"
			  },
	
			  "elements":[
				{
				  "type":      "pie",
				  "colours":   ["#d01f3c","#356aa0","#C79810", "#1FC710", "#9310C7"],
				  "alpha":     0.6,
				  "border":    2,
				  "font-size": 12,
				  "start-angle": 45,
				
				"values" :   [
					{% for item in poll[0].getResponses() %}
						{"value":{{ item.votes }},"label":"{{ item.percent }}%","tip":"({{ item.votes }} out of {{ poll[0].responses }}) <br>" + wordwrap("{{ item.answer }}")},
					{% endfor %}
				] 
				}
			  ]
		};
		</script>
	
		<div id="my_chart" class="mmb">
			<ul id="poll-questions">
			{% for response in poll[0].getResponses() %}
				<li><strong>{{ response.percent }}%</strong> {{ response.answer }}</li>
			{% endfor %}
			</ul>
		</div>
		
		<p><em>Out of {{ poll[0].responses }} total responses.</em></p>
		
		<div class="right mmb"><a href="{{ poll[0].url }}">Results</a> | <a href="{{ 'tsn:poll/archive'|url }}">Poll archive</a></div>
		
		<div class="clear"> </div>
	{% else %}
		<table class="mmb" id="pollster">
			{% for id,response in poll[0].answers %}
			<tr>
				<th><input type="radio" id="answer-{{ id }}" name="answer" value="{{ id }}" /></th>
				<td><label for="answer-{{ id }}">&nbsp;&nbsp;{{ response }}</label></td>
			</tr>
			{% endfor %}
		</table>
		
		<div class="right mmb"><a href="{{ poll[0].url }}">Results</a> | <a href="{{ 'tsn:poll/archive'|url }}">Poll archive</a></div>
		<div class="mmb"><input type="submit" value="Submit" /></div>
	{% endif %}
	</form>
</div>
</div>