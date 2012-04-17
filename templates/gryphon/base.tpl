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

<!DOCTYPE html>
<head>
<title>The Cavalier Daily{{ title|default(' University of Virginia\'s Student Newspaper') }} </title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />

	<link rel="stylesheet" type="text/css" href="{{ 'assets/dist/master.css'|asset }}" />

	<script src="{{ 'assets/dist/modernizr.min.js'|asset }}"></script>

</head>
<body class="container">
<!--Header-->

<hr class="half spacer" />

{% include 'gryphon/main/ads/leaderboard.tpl' %}

<hr class="half spacer" />

<header id="main-header">

	<div class="row">
		<div class="span12" id="top-ticker">
			<div class="row">
				<div class="span6"><div class="half box">
					<time>February 15, 2012 | Rain 35 F | 7-Day Forecast | Charlottesville, VA</time>
				</div></div>
				<div class="span6"><div class="half box text-right">
					<ul>
						<li><a href="#">Advertise</a></li>
						<li><a href="#">Classifieds</a></li>
						<li><a href="#">Buy a Photo</a></li>
						<li><a href="#">Find a Paper</a></li>
						<li><a href="#"><img src="{{ 'assets/images/rss.png'|asset }}" style="width:12px;" />RSS</a></li>
					</ul>
				</div></div>
			</div> {# / .row #}
		</div> {# / .span12 #}
	</div> {# / .row #}

	<div id="flag">
		<div class="row">
			<div class="span6">
				<a href="{{ '/'|url }}"><img src="{{ 'assets/images/flag.png'|asset }}" alt="Banner" id="main-flag" class="flex-image" /></a>
			</div>
			<div class="span6"><div class="text-right">
				{% include 'gryphon/main/ads/fullbanner.tpl' %}
			</div></div>
		</div>
	</div>

	<div class="row">
		<nav class="span12">
			<div id="main-navigation"><div class="row">
				<div class="span9">
					<ul>
						<li{% if not active or active == 'home' %} class="selected"{% endif %}><a href="#"><i class="icon-home icon-white"></i></a>
							<ul>
								<li><span>Serving the University of Virginia community since 1890</span></li>
							</ul>
						</li><li{% if active == 'news' %} class="selected"{% endif %}><a href="#">News</a>
							<ul>
								<li><a href="#">Grounds</a></li>
								<li><a href="#">Local</a></li>
								<li><a href="#">State</a></li>
							</ul>
						</li><li{% if active == 'sports' %} class="selected"{% endif %}><a href="#">Sports</a>
							<ul>
								<li><a href="#">Baseball</a></li>
								<li><a href="#">Football</a></li>
								<li><a href="#">Men's Basketball</a></li>
								<li><a href="#">Men's Lacrosse</a></li>
								<li><a href="#">Men's Soccer</a></li>
								<li><a href="#">Women's Basketball</a></li>
								<li><a href="#">Women's Lacrosse</a></li>
								<li><a href="#">Women's Soccer</a></li>
								<li><a href="#">Wrestling</a></li>
							</ul>
						</li><li{% if active == 'opinion' %} class="selected"{% endif %}><a href="#">Opinion</a>
							<ul>
								<li><a href="#">Columns</a></li>
								<li><a href="#">Editorial Cartoons</a></li>
								<li><a href="#">Lead Editorials</a></li>
								<li><a href="#">Letters to the Editor</a></li>
							</ul>
						</li><li{% if active == 'tableau' %} class="selected"{% endif %}><a href="#">Tableau</a>
							<ul>
								<li><a href="#">Art</a></li>
								<li><a href="#">Movies</a></li>
								<li><a href="#">Music</a></li>
								<li><a href="#">Tableau's Blog</a></li>
							</ul>
						</li><li{% if active == 'life' %} class="selected"{% endif %}><a href="#">Life</a>
							<ul>
								<li><a href="#">Columns</a></li>
								<li><a href="#">Love Connection</a></li>
								<li><a href="#">Love Connection Survey</a></li>
							</ul>
						</li><li{% if active == 'weeklies' %} class="selected"{% endif %}><a href="#">Weeklies</a>
							<ul>
								<li><a href="#">Focus</a></li>
								<li><a href="#">Health &amp; Science</a></li>
							</ul>
						</li><li{% if active == 'comics' %} class="selected"{% endif %}><a href="#">Comics</a></li><li{% if active == 'blogs' %} class="selected"{% endif %}><a href="#">Blogs</a></li><li><a href="#"{% if active == 'news' %} class="multimedia"{% endif %}>Multimedia</a>
							<ul>
								<li><a href="#">Video</a></li>
								<li><a href="#">Photos</a></li>
								<li><a href="#">Audio</a></li>
							</ul>
						</li>
					</ul>
				</div> {# /.span10 #}
				<div class="span3 text-right">
					<form class="form-inline">
						<div class="input-append">
							<input type="text" class="input-medium" placeholder="Search..." />
							<a href="#" class="btn"><i class="icon-search"></i></a>
						</div>
					</form>
				</div> {# /.span2 #}
			</div></div> {# /.span12 /.row #}
		</nav>
	</div> {# /.row #}
<!--End - Bottom Two Navigation Bars-->
</header>
<!-- End of header -->

{% block content %}{% endblock %}

<!-- Footer -->

<hr class="double spacer" />

<footer>
	<div class="row-fluid">
		<div class="span2">
			<ul class="unstyled">
				<li><h3><a href="#">News</a></h3></li>
				<li><a href="#">Grounds</a></li>
				<li><a href="#">Local</a></li>
				<li><a href="#">State</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#">Life</a></h3></li>
				<li><a href="#">Columns</a></li>
				<li><a href="#">Love Connection</a></li>
				<li><a href="#">Love Connection Survey</a></li>
			</ul>
		</div>

		<div class="span2">
			<ul class="unstyled">
				<li><h3><a href="#">Opinion</a></h3></li>
				<li><a href="#">Columns</a></li>
				<li><a href="#">Editorial Cartoons</a></li>
				<li><a href="#">Lead Editorials</a></li>
				<li><a href="#">Letters to the Editor</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">Blogs</a></h3></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#">Tableau</a></h3></li>
				<li><a href="#">Art</a></li>
				<li><a href="#">Movies</a></li>
				<li><a href="#">Music</a></li>
				<li><a href="#">Tableau's Blog</a></li>
			</ul>
		</div>

		<div class="span2">
			<ul class="unstyled">
				<li><h3><a href="#">Sports</a></h3></li>
				<li><a href="#">Baseball</a></li>
				<li><a href="#">Football</a></li>
				<li><a href="#">Men's Basketball</a></li>
				<li><a href="#">Men's Lacrosse</a></li>
				<li><a href="#">Men's Soccer</a></li>
				<li><a href="#">Women's Basketball</a></li>
				<li><a href="#">Women's Lacrosse</a></li>
				<li><a href="#">Women's Soccer</a></li>
				<li><a href="#">Wrestling</a></li>
			</ul>
		</div>

		<div class="span2">
			<ul class="unstyled">
				<li><h3><a href="#">Weeklies</a></h3><li>
				<li><a href="#">Focus</a></li>
				<li><a href="#">Health &amp; Science</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#">Multimedia</a></h3></li>
				<li><a href="#">Video</a></li>
				<li><a href="#">Photos</a></li>
				<li><a href="#">Audio</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#">About</a></h3></li>
				<li><a href="#"">Contact</a></li>
				<li><a href="#"">Corrections</a></li>
				<li><a href="#"">History</a></li>
				<li><a href="#"">Join</a></li>
			</ul>
		</div>

		<div class="span2">
			<p>
				The Cavalier Daily is the independent student newspaper of the University of Virgina, published since 1890.
			</p>
			<p>
				Please see our <a href="#">about page</a> for more information.
			</p>
		</div>

		<div class="span2"><div class="text-center">
			<a href="#"><img src="http://placehold.it/120x200" class="flex-image" /></a>
			<br />
			<span class="small"><a href="#">Download PDF</a></span>
		</div></div>
	</div>

	<div class="text-center">
		<p>All Content &copy; Copyright {{ now|date('Y') }}, The Cavalier Daily</p>
		<hr class="spacer" />
		<a href="http://detroitsoftworks.com"><img src="{{ 'assets/images/gear.png'|asset }}" alt="Detroit Softworks"/></a>
	</div>
</footer>
<!-- End of footer-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="{{ 'assets/dist/bootstrap.min.js'|asset }}"></script>
<script type="text/javascript" src="{{ 'assets/dist/cavdaily.js'|asset }}"></script>
{# include 'gryphon/main/tracker.tpl' #}
</body>
</html>
