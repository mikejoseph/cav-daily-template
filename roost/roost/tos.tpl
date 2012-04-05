{% extends 'gryphon/base.tpl' %}
{% block title %} :: Housing Guide : Terms of Service{% endblock %}
{% block activeNav %}housing{% endblock %}
{% block flag %}Housing Guide{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
{% helper config %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h2 class="mmb">Terms of Service: Housing Guide</h2>
	
	<div class="body-copy boot mmb">
		<p>
			Property listings and associated files are provided and maintained by the individual property owners listed. {{ config.get('gryphon:publication:name') }} takes no responsibility for the content thereof. Users are solely responsible for reviewing and making decisions and agreements or contracts based on the information provided in this Online Housing Guide and agree to hold {{ config.get('gryphon:publication:name') }} harmless and waive any liability of {{ config.get('gryphon:publication:name') }} for any and all disputes involving information provided in this guide.
		</p>
		
		<p>
			 Although most changes are likely to be minor, {{ config.get('gryphon:publication:name') }} may change its Housing Guide Terms of Service from time to time, and in {{ config.get('gryphon:publication:name') }}'s sole discretion. {{ config.get('gryphon:publication:name') }} encourages visitors to frequently check this page for any changes to its Housing Guide Terms of Service. Your continued use of this site after any change in this Terms of Service policy will constitute your acceptance of such change. 	
		</p>
	</div>
	
	<div class="caption mmb">
		Updated September 14, 2010
	</div>
	
</div>
<div class="grid_4">
	{% include 'roost/roost/owners_box.tpl' %}
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>
<div class="clear mb"></div>
{% endblock content %}