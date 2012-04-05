{% import "macros/render.tpl" as render %}
{% helper config %}
{% helper weather %}
{% helper utilityHelper as util %}
{% helper adpilotHelper as ads %}
{% import "macros/disqus.tpl" as disqus %}
{% set title %}{% block title %}{% endblock %}{% endset %}

{% set active %}{% block activeNav %}{% endblock %}{% endset %}
{% if not active %}
	{% set active = 'home' %}
{% endif %}

{% set subActive %}{% block subActive %}{% endblock %}{% endset %}
{% set description %}{% block description %}{% endblock %}{% endset %}
{% set siteSlogan = config.get('dsw:siteslogan') %}

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />

	{% if noIndex %}
		<meta name="robots" content="noindex, nofollow" />
	{% endif %}

	<meta name="title" content="{{ config.get('publication:name') }}{{ title }}" />
	<title>{{ config.get('publication:name') }}{{ title }}</title>

	<link rel="stylesheet" type="text/css" href="{{ 'gfn-blackletter/css/master.css'|url }}" media="screen, projection" />
	{# <link rel="stylesheet" type="text/css" href="{{ 'gfn-blackletter/css/print.css'|url }}" media="print" /> #}
	{% block styles %}{% endblock %}

	<link rel="shortcut icon" href="{{ 'favicon.ico'|url }}" />
	<link rel="alternate" type="application/rss+xml" title="{{ config.get('publication:name') }} : Top Stories" href="{{ 'section/pageone.xml'|url }}" />
	{% block links %}{% endblock %}

	<script type="text/javascript" src="{{ 'gfn-blackletter/js/jquery.js'|url }}"></script>
	<script type="text/javascript" src="{{ 'gfn-blackletter/js/jquery-ui.js'|url }}"></script>
	<script type="text/javascript" src="{{ 'gfn-blackletter/js/jquery.cookie.js'|url }}"></script>
	<script type="text/javascript" src="{{ 'gfn-blackletter/js/jquery.fontscale.js'|url }}"></script>

	{% block scripts %}{% endblock %}

	<script type="text/javascript" src="{{ 'gfn-blackletter/js/functions.js'|url }}"></script>


	{% set tabMap = [
		'home' 		: 0,
		'news' 		: 1,
		'sports' 	: 2,
		'ae'		: 3,
		'opinion'	: 4,
		'multimedia'	: 5,
		'blogs'		: 6,
		'events'	: 7
	] %}
	{% set tab = tabMap[active] %}

	<script type="text/javascript">
		$(document).ready(function(){
			// Main navigation tabs
			var tab_timeout;

			var $tabs = $('#navbar > ul').tabs({ event: 'mouseover', selected: {{ tab }} });

			$('#navbar > ul > li > a,#subnav').bind('mouseover', function() {
				clearTimeout(tab_timeout);
			});

			$('#navbar > ul > li > a,#subnav').bind('mouseout', function() {
				tab_timeout = setTimeout(function() {
					$tabs.tabs('select', {{ tab }});
					return false;
				}, 500);
			});

			$('#navbar > ul > li > a').click(function(){
				window.location = $(this).attr('rel');
			});
			$('#navbar > ul > li > a').bind('mouseover', function(e) {
				var id = $(this).attr('href');

				if( !id ) {
					return;
				}

				// copies the content of the home tab into an empty tab
				// keeps the subnav from making the page jump
				if( !$(id).length || !$(id).children().length ) {
					$(id).html($('#tab-home').html());
				}
			});
		});
	</script>


</head>
<body>

<div id="wrapper" class="container_12">
	<div class="grid_12">
		<div id="header" class="aside mb">
			<div class="right">
				<form method="get" id="searchform" class="right" action="{{ 'search'|url }}" >
					<input type="text" name="q" size="20" value="{{ query_escaped }}" /> <input type="submit" id="searchsubmit" value="Search" />
				</form>
			</div>
			<a href="{{ 'page/about'|url }}">About Us</a> |
			<a href="{{ 'page/work_for_us'|url }}">Work for Us</a> |
			<a href="{{ 'page/advertising'|url }}">Advertise</a> |
			<a href="{{ 'page/wocc_schedule'|url }}">WOCC Schedule</a> |
			<a href="{{ 'search?a=1'|url }}">Archive</a> |
			<a href="{{ 'tsn:mail/opinion/1'|url }}">Letters</a> |
			<!-- <a href="{{ 'classified'|url }}">Classifieds</a> | -->
			<!-- <img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" /> <a href="#">Photo reprints</a> | -->
			<img src="{{ 'gfn-blackletter/assets/49.png'|url }}" style="position:relative;top:2px;" /> <a href="{{ 'page/feeds'|url }}">RSS</a>
		</div>

		<h1 id="flag"><a href="{{ '/'|url }}"><img src="{{ 'gfn-blackletter/assets/otterbein_450.png'|url }}" alt="{{ config.get('publication:name') }}" /></a>
		{% set flag %}{% block flag %}{% endblock %}{% endset %}
		{% if flag %}
			| {{ flag }}
		{% endif %}
		</h1>


		<div id="navbar">
			<ul>
				<li><a href="#tab-home" rel="{{ '/'|url }}">HOME</a></li>
				<li><a href="#tab-news" rel="{{ 'section/news'|url }}">NEWS</a></li>
				<li><a href="#tab-sports" rel="{{ 'section/sports'|url }}">SPORTS</a></li>
				<li><a href="#tab-ae" rel="{{ 'section/ae'|url }}">A&amp;E</a></li>
				<li><a href="#tab-opinion" rel="{{ 'section/opinion'|url }}">OPINION</a></li>
				<li><a href="#tab-multimedia" rel="{{ 'multimedia'|url }}">MULTIMEDIA</a></li>
				<li><a href="#tab-blogs" rel="{{ 'blog'|url }}">BLOGS</a></li>
				<li><a href="#tab-events" rel="{{ 'google:calendar'|url }}">EVENTS</a></li>
				<!--<li><a href="#tab-hg" rel="{{ 'roost:roost'|url }}">HOUSING</a></li>-->

			</ul>
			<div class="clear"> </div>
		</div><!-- #navbar -->

		<div id="subnav" class="snavtmp mb">
			<div id="tab-home">
				<div id="weather" class="right">
					<strong>{{ now|date('F j, Y') }}</strong> | {{ weather }}, {{ weather.temp }}&deg; F <img src="{{ ('gfn-blackletter/assets/weathericons/'~weather.icon)|url }}" alt="{{ weather }}" style="position:relative;top:3px;" /> <a href="{{ weather.url }}" target="_blank">7-Day Forecast</a>
				</div>

				<div>
					<span>Last updated:</span> <span id="lastUpdate">{{ util.lastUpdate()|timeSince }}</span>

					{% if siteSlogan %}
						<span> | <em>{{ siteSlogan }}</em></span>
					{% endif %}
				</div>
			</div>

			<div id="tab-news">
				{% fetch newssub from section with [
					'limit': 30,
					'order': 'name asc',
					'where': 'status = 1 AND sidebar = "news"'
				] %}
				{% for section in newssub %}
					<a href="{{ section.url }}">{{ section.name }}</a>
				{% endfor %}&nbsp;
			</div>

			<div id="tab-sports">
				{% fetch sportssub from section with [
					'limit': 30,
					'order': 'name asc',
					'where': 'status = 1 AND sidebar = "sports"'
				] %}
				{% for section in sportssub %}
					<a href="{{ section.url }}">{{ section.name }}</a>
				{% endfor %}&nbsp;
			</div>

			<div id="tab-ae">
				{% fetch entsub from section with [
					'limit': 30,
					'order': 'name asc',
					'where': 'status = 1 AND sidebar = "ae"'
				] %}
				{% for section in entsub %}
					<a href="{{ section.url }}">{{ section.name }}</a>
				{% endfor %}&nbsp;
			</div>

			<div id="tab-opinion">
				<a href="{{ 'search/?a=1&amp;tg=editorial'|url }}">Editorials</a>
				<a href="{{ 'search/?a=1&amp;tg=cartoon'|url }}">Cartoons</a>
				<a href="{{ 'search/?a=1&amp;tg=column'|url }}">Columns</a>
				<a href="{{ 'search/?a=1&amp;tg=letters'|url }}">Letters</a>
				<a href="{{ 'poll/archive'|url }}">Polls</a>
				<a href="{{ 'section/cardinal_complaints'|url }}">Cardinal Complaints</a>
			</div>

			<div id="tab-multimedia">
				<a href="{{ 'multimedia/video'|url }}">Video</a>
				<a href="{{ 'multimedia/audio'|url }}">Audio</a>
				<a href="{{ 'gallery'|url }}">Photo galleries</a>
			</div>

			<div id="tab-blogs">
				{% fetch blogs from blog with [
					'limit': 30,
					'order': 'name asc',
					'where': 'status = 1'
				] %}
				{% for item in blogs %}
					<a href="{{ item.url }}">{{ item.name }}</a>
				{% endfor %}
			</div>

			<div id="tab-events">
				{% fetch cals from google:calendar with [
					'limit': 20,
					'order': 'title asc'
				] %}
				{% for cal in cals %}
					<a href="{{ cal.url }}">{{ cal.title }}</a>
				{% endfor %}
			</div>

			<!--<div id="tab-hg">
				<a href="{{ 'roost:roost/account'|url }}">Request account</a>
				<a href="/roost">Manage properties</a>
				<a href="{{ 'roost:roost/tos'|url }}">Terms of Service</a>
			</div>-->
		</div><!-- #subnav -->
	</div><!-- .grid_12 -->

	{# THIS IS THE MAIN CONTENT BLOCK #}
	{% block content %}{% endblock %}

	{# // FOOTER  ################################### #}
	<div class="grid_12" id="footer">
		<div class="right">
			<p>Copyright &copy;{{ now|date('Y') ~ ' ' ~config.get('publication:name') }}</p>

			<p><a href="{{ 'page/privacy'|url }}">Privacy policy</a></p>
		</div>
		<p><a href="{{ '/'|url }}">Home</a> |
		<a href="{{ 'section/news'|url }}">News</a> |
		<a href="{{ 'section/sports'|url }}">Sports</a> |
		<a href="{{ 'section/ae'|url }}">A&amp;E</a> |
		<a href="{{ 'section/opinion'|url }}">Opinion</a> |
		<a href="{{ 'multimedia'|url }}">Multimedia</a> |
		<a href="{{ 'blog'|url }}">Blogs</a> |
		<a href="{{ 'google:calendar'|url }}">Events</a><!-- |
		<a href="{{ 'roost:roost'|url }}">Housing</a> --></p>

		<p><a href="{{ 'page/about'|url }}">About Us</a> |
                <a href="{{ 'page/work_for_us'|url }}">Work for Us</a> |
                <a href="{{ 'page/advertising'|url }}">Advertise</a> |
		<a href="{{ 'page/wocc_schedule'|url }}">WOCC Schedule</a> |
		<a href="{{ 'search'|url }}?a=1">Archive</a> |
		<a href="{{ 'tsn:mail/opinion/1'|url }}">Letters</a> |
		<!-- <a href="{{ 'classified'|url }}">Classifieds</a> | -->
		<!-- <img src="{{ 'gfn-blackletter/assets/icons/photo.png'|url }}" /> <a href="#">Photo reprints</a> | -->
		<img src="{{ 'gfn-blackletter/assets/49.png'|url }}" style="position:relative;top:2px;" /> <a href="{{ 'page/feeds'|url }}">RSS</a></p>

		<a href="http://detroitsoftworks.com" target="_blank" class="icn">Powered by Detroit Softworks</a>
	</div>

</div><!-- #wrapper -->

{% include 'gryphon/main/tracker.tpl' %}
</body>
</html>
