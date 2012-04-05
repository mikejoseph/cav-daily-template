{% extends 'gryphon/base.tpl' %}

{% block title %} :: Housing Guide : Mobile{% endblock %}
{% block activeNav %}housing{% endblock %}
{% block flag %}Housing Guide{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h2 class="mmb">Housing Guide Mobile</h2>

	<div class="grid_3 alpha">
		<img src="{{ 'roost/frontend/style/images/mobile_view.png'|url }}" alt="Housing Guide Mobile" />
	</div>
	<div class="grid_5 omega">
		<div class="body-copy">
			<p>
				<img src="{{ 'roost/javascript/vendor/jqtouch/themes/roost/img/housing-webclip.png'|url }}" style="float:right;margin:0 0 .5em .5em;" />
				With the mobile version of the Housing Guide you'll get quick access to all of our listings, complete with contact info, maps and links to driving directions, from whereever you are. The Housing Guide is designed to work on any internet capable mobile device.
			</p>
			
			<p>
				If you have an iPhone, Android-based phone, a Palm Pre/Pixi or any Mobile Safari based browser, you'll get even more out of the mobile version. The optimized version of the Housing Guide allows you to add notes and store listings on your phone for faster retrieval and offline viewing. 
			</p>
			
			<p>
				If you have an iPod Touch you can access the mobile version of the Housing Guide via WiFi and store listings and notes on your iPod for viewing offline.
			</p>
		</div>
	</div>
</div>

<div class="grid_4">
	{% include 'roost/roost/owners_box.tpl' %}
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear mb"></div>
{% endblock content %}