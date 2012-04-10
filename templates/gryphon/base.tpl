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
<title>The Cavalier Daily</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />

	<link rel="stylesheet" type="text/css" href="{{ 'assets/dist/master.css'|asset }}" />

	<script src="{{ 'assets/js/modernizr.min.js' }}"></script>

</head>
<body class="container">
<!--Header-->
	<header id="main-header">

		<div class="row">
			<div class="span12" id="top-ticker">
				<div class="row">
					<div class="span6"><div class="half box">
						<time>February 15, 2012 | Rain 35 F | 7-Day Forecast | Charlotesville, VA</time>
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
			<div>
				<a href="{{ '/'|url }}"><img src="{{ 'assets/images/flag.png'|asset }}" alt="Banner" id="main-flag" class="flex-image" /></a>
			</div>
		</div>

		<div class="row">
			<nav class="span12">
				<div id="main-navigation"><div class="row">
					<div class="span9">
						<ul>
							<li><a href="#"><i class="icon-home icon-white"></i></a></li>
							<li><a href="#">News</a></li>
							<li class="selected"><a href="#">Sports</a>
								<ul>
									<li><a href="#">Cross Country</a></li>
									<li><a href="#">Field Hockey</a></li>
									<li><a href="#">Football</a></li>
									<li><a href="#">Men's Soccer</a></li>
									<li><a href="#">Volleyball</a></li>
									<li><a href="#">Women's Basketball</a></li>
									<li><a href="#">Women's Soccer</a></li>
								</ul>
							</li>
							<li><a href="#">Opinion</a>
								<ul>
									<li><a href="#">Lead Editorial</a></li>
									<li><a href="#">Letters to the Editor</a></li>
								</ul>
							</li>
							<li><a href="#">Tableau</a>
								<ul>
									<li><a href="#">Tableau Articles</a></li>
									<li><a href="#">Tableau's Blog</a></li>
								</ul>
							</li>
							<li><a href="#">Life</a>
								<ul>
									<li><a href="#">Love Connection</a></li>
									<li><a href="#">Love Connection Survey</a></li>
								</ul>
									</li>
							<li><a href="#">Weeklies</a>
								<ul>
									<li><a href="#">Focus</a></li>
									<li><a href="#">Health &amp; Science</a></li>
								</ul>
									</li>
							<li><a href="#">Comics</a></li>
							<li><a href="#">Blogs</a></li>
							<li><a href="#">Multimedia</a>
								<ul>
									<li><a href="#">Video</a></li>
									<li><a href="#">Audio</a></li>
									<li><a href="#">Photos</a></li>
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

	<div class="row">
		<div class="span3">
			<h3>Recent News:</h3>
			<article class="three-column abstract">
				<h2><a href="#">I am a headline</a></h2>
				<aside class="by-line">
				 by Testy Testerson | minutes ago | <a href="#"><i class="icon-comment"></i></a>
				</aside>
				<p>
					<a href="#"><img src="http://placekitten.com/100" /></a>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
					<br />
					<a href="#">read more <i class="icon-chevron-right"></i></a>
				</p>
			</article>

			<hr class="spacer" />

			<article class="three-column abstract">
				<h2><a href="#">I am a headline</a></h2>
				<aside class="by-line">
				 by Testy Testerson | minutes ago | <a href="#"><i class="icon-comment"></i></a>
				</aside>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
					<br />
					<a href="#">read more <i class="icon-chevron-right"></i></a>
				</p>
			</article>

			<hr class="spacer" />

			<article class="three-column abstract">
				<h2><a href="#">I am a headline</a></h2>
				<aside class="by-line">
				 by Testy Testerson | minutes ago | <a href="#"><i class="icon-comment"></i></a>
				</aside>
				<p>
					<a href="#"><img src="http://placekitten.com/100" /></a>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
					<br />
					<a href="#">read more <i class="icon-chevron-right"></i></a>
				</p>
			</article>

			<hr class="spacer" />

			<article class="three-column abstract">
				<h2><a href="#">I am a headline</a></h2>
				<aside class="by-line">
				 by Testy Testerson | minutes ago | <a href="#"><i class="icon-comment"></i></a>
				</aside>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
					<br />
					<a href="#">read more <i class="icon-chevron-right"></i></a>
				</p>
			</article>


			<div id="calendar">
				<!--Calender-->
				<h3>CALENDAR:</h3>
					<ul>
						<li>Event 10</li>
						<li>Event 11</li>
						<li>Event 12</li>
						<li>Event 13</li>
						<li>Event 14</li>
						<li>Event 15</li>
					</ul>
			</div>
			<!--Social media-->
			<div id="follow">
				<h3 id="recent">FOLLOW:</h3>
					<a href="#"><img src="icons/twitter.png" alt="twitter" width="32" height="32" /></a>
					<a href="#"><img src="icons/facebook.png" alt="facebook" width="32" height="32" /></a>
					<a href="#"><img src="icons/rss.png" alt="rss" width="32" height="32" /></a>
					<a href="#"><img src="icons/rss.png" alt="rss" width="32" height="32" /></a>
			</div>
		</div>
		<div class="span5">
			<article class="abstract five-column">
				<div class="box">
					<a href="#"><img src="http://placekitten.com/500" class="flex-image" /></a>
					<aside>
						<a href="http://placekitten.com">Photo Credit</a> - The Cavalier Daily
					</aside>
				</div>
				<hr class="spacer" />
				<h1><a href="#">People love kitties, film at 11</a></h1>
				<aside class="by-line">
				 by Testy Testerson | minutes ago | <a href="#"><i class="icon-comment"></i></a>
				</aside>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
					<br />
					<a href="#">read more <i class="icon-chevron-right"></i></a>
				</p>
			</article>

			<hr class="hairline double spacer" />

			<article class="abstract five-column">
				<h2><a href="#">UVA was founded by Thomas Jefferson</a></h2>
				<aside class="by-line">
				 by Testy Testerson | minutes ago | <a href="#"><i class="icon-comment"></i></a>
				</aside>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
					<br />
					<a href="#">read more <i class="icon-chevron-right"></i></a>
				</p>
			</article>

			<hr class="spacer" />

			<article class="abstract five-column">
				<h2><a href="#">That is very cool</a></h2>
				<aside class="by-line">
				 by Testy Testerson | minutes ago | <a href="#"><i class="icon-comment"></i></a>
				</aside>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
					<br />
					<a href="#">read more <i class="icon-chevron-right"></i></a>
				</p>
			</article>

			<hr class="hairline double spacer" />

			<div class="row-fluid">
				<div class="span6">
					<h3><a href="#">Sports</a></h3>
						<ul class="item-list">
							<li><h4><a href="#">Cavs Crush Georgia Tech, 70-38</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Fan Code</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Team Travels North to Carolina</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Matmen Eye Duke, UNC</a><span> | Jan. 20</span></h4></li>
						</ul>

					<h3><a href="#">Opinion</a></h3>
						<ul class="item-list">
							<li><h4><a href="#">Citizen Power</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Rushing to Pledge</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">A Fairer Vote</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Shooting in the Dark</a><span> | Jan. 20</span></h4></li>
						</ul>
				</div>

				<div class="span6">
					<h3><a href="#">tableau</a></h3>
						<ul class="item-list">
							<li><h4><a href="#">A Spark of Pinterest</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Year of the 'Dragon'</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Bet on this 'War Horse'</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Who's House? 'Safe House'</a><span> | Jan. 20</span></h4></li>
						</ul>

					<h3><a href="#">Life</a></h3>
						<ul class="item-list">
							<li><h4><a href="#">A Hulaba Time</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Money Saving App</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Something to Complain About</a><span> | Jan. 20</span></h4></li>
							<li><h4><a href="#">Dirty Little Secret</a><span> | Jan. 20</span></h4></li>
						</ul>
				</div>
			</div>

			<hr class="hairline double spacer" />

	<!-- Features media sections-->
			<h3><a href="#">Featured Multimedia:</a></h3>

			<hr class="spacer" />

			<ul class="thumbnails">
				<li class="span5">
					<a href="#" class="thumbnail"><img src="http://placekitten.com/500/250" class="flex-image" /></a>
				</li>
				<li class="span1">
					<a href="#" class="thumbnail"><img src="http://placekitten.com/50" class="flex-image" /></a>
				</li>
				<li class="span1">
					<a href="#" class="thumbnail"><img src="http://placekitten.com/50" class="flex-image" /></a>
				</li>
				<li class="span1">
					<a href="#" class="thumbnail"><img src="http://placekitten.com/50" class="flex-image" /></a>
				</li>
				<li class="span1">
					<a href="#" class="thumbnail"><img src="http://placekitten.com/50" class="flex-image" /></a>
				</li>
				<li class="span1">
					<a href="#" class="thumbnail"><img src="http://placekitten.com/50" class="flex-image" /></a>
				</li>
			</ul>

		</div>

		<div class="span4">
			<div id="activitybox">
				POPULAR | COMMENTS | BLOGS
			</div>
			<div id="twitterfeed">
				tweets
			</div>
			<div id="printedition">
				PRINT EDITION
			</div>

		</div>
	</div>
<!-- Footer -->

<hr class="double spacer" />

<footer>
	<div class="row-fluid">
		<div class="span3">
			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">News</a></h3></li>
				<li><a href="#" class="footer-regular">Focus</a></li>
				<li><a href="#" class="footer-regular">Grounds</a></li>
				<li><a href="#" class="footer-regular">Health and Sciences</a></li>
				<li><a href="#" class="footer-regular">Local</a></li>
				<li><a href="#" class="footer-regular">State</a></li>
				<li><a href="#" class="footer-regular">National</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">Life</a></h3></li>
				<li><a href="#" class="footer-regular">Columns</a></li>
				<li><a href="#" class="footer-regular">Love Connections</a></li>
				<li><a href="#" class="footer-regular">Love Connections Survey</a></li>
			</ul>
		</div>

		<div class="span3">
			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">Opinion</a></h3></li>
				<li><a href="#" class="footer-regular">Cartoons</a></li>
				<li><a href="#" class="footer-regular">Columns</a></li>
				<li><a href="#" class="footer-regular">Lead Editorials</a></li>
				<li><a href="#" class="footer-regular">Letters to the Editor</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">Blogs</a></h3></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">Tableau</a></h3></li>
				<li><a href="#" class="footer-regular">Art</a></li>
				<li><a href="#" class="footer-regular">Movies</a></li>
				<li><a href="#" class="footer-regular">Music</a></li>
			</ul>
		</div>

		<div class="span3">
			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">Sports</a></h3></li>
				<li><a href="#" class="footer-regular">Cross Country</a></li>
				<li><a href="#" class="footer-regular">Field Hockey</a></li>
				<li><a href="#" class="footer-regular">Football</a></li>
				<li><a href="#" class="footer-regular">Men's Basketball</a></li>
				<li><a href="#" class="footer-regular">Men's Lacrosse</a></li>
				<li><a href="#" class="footer-regular">Men's Soccer</a></li>
				<li><a href="#" class="footer-regular">Swimming</a></li>
				<li><a href="#" class="footer-regular">Volleyball</a></li>
				<li><a href="#" class="footer-regular">Women's Basketball</a></li>
				<li><a href="#" class="footer-regular">Women's Lacrosse</a></li>
				<li><a href="#" class="footer-regular">Women's Soccer</a></li>
			</ul>
		</div>

		<div class="span3">
			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">Multimedia</a></h3></li>
				<li><a href="#" class="footer-regular">Audio</a></li>
				<li><a href="#" class="footer-regular">Photo Gallery</a></li>
				<li><a href="#" class="footer-regular">Video Reports</a></li>
			</ul>

			<ul class="unstyled">
				<li><h3><a href="#" class="footer-header">About</a></h3></li>
				<li><a href="#" class="footer-regular">Contact</a></li>
				<li><a href="#" class="footer-regular">Corrections</a></li>
				<li><a href="#" class="footer-regular">History</a></li>
				<li><a href="#" class="footer-regular">Join</a></li>
			</ul>
		</div>
	</div>

	<div class="text-center">
		<a href="http://detroitsoftworks.com"><img src="{{ 'assets/images/gear.png'|asset }}" alt="Detroit Softworks"/></a>
		<br />
		<p>All Content &copy; Copyright {{ now|date('Y') }}, The Cavalier Daily</p>
	</div>
</footer>
<!-- End of footer-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="{{ 'assets/js/bootstrap.min.js'|asset }}"></script>
{# include 'gryphon/main/tracker.tpl' #}
</body>
</html>
