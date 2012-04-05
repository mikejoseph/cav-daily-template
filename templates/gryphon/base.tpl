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

	<link rel="stylesheet" type="text/css" href="{{ 'assets/dist/vendor.css'|asset }}" />
	<link rel="stylesheet" type="text/css" href="{{ 'assets/dist/master.css'|asset }}" />

	<script src="{{ 'assets/js/modernizr.min.js' }}"></script>

</head>
<body id="container">
<!--Header-->
	<header>
<!--Top bar-->
		<nav id="top">
			<time>February 15, 2012 | Rain 35 F | 7-Day Forecast | Charlotesville, VA</time>
			<ul>
				<li><a href="#">Advertise</a></li>
				<li><a href="#">Classifieds</a></li>
				<li><a href="#">Buy a Photo</a></li>
				<li><a href="#">Find a Paper</a></li>
				<li><a href="#"><img src="images/rss.png" />RSS</a></li>
			</ul>
		</nav>
<!--End - top bar-->
		<div><img src="images/banner.png" alt="Banner" /></div>
<!--Bottom two navigation bars-->
		<nav id="bottom">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">News</a></li>
				<li><a href="#">Sports</a>
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
				<li><a href="#">Photos</a></li>
				<li><a href="#">Multimedia</a></li>
			</ul>

			<form id="searchbar">
			<div>
			<input id="searchfield" type="text" value="Search..." />
			<img src="images/searchicon.png" alt="Go"/>
			</div>
			</form>

		</nav>
<!--End - Bottom Two Navigation Bars-->
	</header>
<!-- End of header -->
<!--Left rail - 220px-->
	<div id="col1">
		<div id="recent">
			<h3>RECENT NEWS:</h3>
			<div id="rail">
				<div class="headlines">
					<h3 class="article"><a href="#">ARTICLE 1</a></h3>
						<p class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
						<span class="article"><a href="#">&#8230;more</a></span></p>
						<span class="comments">
						 by WASHINGTON | minutes ago <a href="#">Comments</a>
						</span>
				</div>
				<div class="headlines">
					<h3 class="article"><a href="#">ARTICLE 2</a></h3>
						<a href="#"><img src="images/darth-vader.jpg" alt="darth-vader" width="800" height="600" /></a>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
						<span class="article"><a href="#">&#8230;more</a></span></p>
						<span class="comments">
						 by LINCOLN | 1 hour ago <a href="#">Comments</a>
						</span>
				</div>
				<div class="headlines">
					<h3 class="article"><a href="#"> ARTICLE 3</a></h3>
						<a href="#"><img src="images/Yoda1.jpg" alt="Yoda1" width="1248" height="1200" /></a>
						<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
						<span class="article"><a href="#">&#8230;more</a></span></p>
						<span class="comments">
						 by HAMILTON | 2 hours ago <a href="#">Comments</a>
						</span>
				</div>
				<div class="headlines">
					<h3 class="article"><a href="#"> ARTICLE 4 </a></h3>
						<p>ELorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
						<span class="article"><a href="#">&#8230;more</a></span></p>
						<span class="comments">
						 by GRANT | 4 hours ago	<a href="#">Comments</a>
						</span>
				</div>
				<div class="headlines">
					<h3 class="article"><a href="#"> ARTICLE 5 </a></h3>
						<p>ELorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas
						<span class="article"><a href="#">&#8230;more</a></span></p>
						<span class="comments">
						 by FRANKLIN | 4 hours ago	<a href="#">Comments</a>
						</span>
				</div>
			</div>
		</div>
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
<!--Main column - 380px-->
	<div id="col2">
		<a href="#"><img class="image" id="headline" src="images/49019_yjw_bkc_bigtentrophy_031112f.jpg"></a>
		<div id="topstory">
			<h1 class="article"><a href="#">FRONT PAGE HEADLINE</a></h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi interdum neque et justo ornare eget lobortis quam imperdiet.
			<span class="article"><a href="#">&#8230;more</a></span></p>
			<span class="comments">by MOE | Jan. 20 <a href="#">Comments</a></span>
		</div>
		<div id="topstory">
			<h2 class="article"><a href="#">HEADLINE 1</a></h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi interdum neque et justo ornare eget lobortis quam imperdiet.
			<span class="article"><a href="#">&#8230;more</a></span></p>
			<span class="comments">by LARRY | Jan. 20 <a href="#">Comments</a></span>
		</div>
		<div id="topstory">
			<h2 class="article"><a href="#">HEADLINE 2</a></h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pulvinar ipsum nec nisl mattis convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi interdum neque et justo ornare eget lobortis quam imperdiet.
			<span class="article"><a href="#">&#8230;more</a></span></p>
			<span class="comments">by CURLY | Jan. 20 <a href="#">Comments</a></span>
		</div>
		<img class="image" id="shortbreak" src="images/short break.jpg">
<!--News sections-->
		<div class="sections">
			<div id="TL">
				<h2 class="page"><a href="#">Sports</a></h2>
					<ul class="article">
					<li><a href="#">Cavs Crush Georgia Tech, 70-38</a> | Jan. 20</li>
					<li><a href="#">Fan Code</a> | Jan. 20</li>
					<li><a href="#">Team Travels North to Carolina</a> | Jan. 20</li>
					<li><a href="#">Matmen Eye Duke, UNC</a> | Jan. 20</li>
					</ul>
			</div>
			<div id="TR">
				<h2 class="page"><a href="#">Opinion</a></h2>
					<ul class="article">
					<li><a href="#">Citizen Power</a> | Jan. 20</li>
					<li><a href="#">Rushing to Pledge</a> | Jan. 20</li>
					<li><a href="#">A Fairer Vote</a> | Jan. 20</li>
					<li><a href="#">Shooting in the Dark</a> | Jan. 19</li>
					</ul>
			</div>
			<div id="bottomborder"></div>
			<div id="BL">
				<h2 class="page"><a href="#">tableau</a></h2>
					<ul class="article">
					<li><a href="#">A Spark of Pinterest</a> | Jan. 19</li>
					<li><a href="#">Year of the 'Dragon'</a> | Jan. 19</li>
					<li><a href="#">Bet on this 'War Horse'</a> | Jan. 19</li>
					<li><a href="#">Who's House? 'Safe House'</a> | Feb. 10</li>
					</ul>
			</div>
			<div id="BR">
				<h2 class="page"><a href="#">Life</a></h2>
					<ul class="article">
					<li><a href="#">A Hulaba Time</a> | Jan. 18</li>
					<li><a href="#">Money Saving App</a> | Jan. 18</li>
					<li><a href="#">Something to Complain About</a> | Jan. 18</li>
					<li><a href="#">Dirty Little Secret</a> | Jan. 18</li>
					</ul>
			</div>
			<div id="bottomborder"></div>
		</div>
<!-- Features media sections-->
		<div id="media">
			<h2 class="page"><a href="3">Feadtured Multimedia:</a></h2>
			<iframe width="560" height="315" src="http://www.youtube.com/embed/t3TmFyyB4zI" frameborder="0" allowfullscreen></iframe>
		</div>
	</div>
<!--Right Rail - 300px-->
	<div id="col3">
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
	<img class="image" id="longbreak" src="images/long_break.jpg"/>
<!-- Footer -->
<div id="footer">
	<div id="columns-wrapper">
	<div id="column-1">
		<ul class="footer-links">
		<li><a href="#" class="footer-header">News</a></li>
		<li><a href="#" class="footer-regular">Focus</a></li>
		<li><a href="#" class="footer-regular">Grounds</a></li>
		<li><a href="#" class="footer-regular">Health and Sciences</a></li>
		<li><a href="#" class="footer-regular">Local</a></li>
		<li><a href="#" class="footer-regular">State</a></li>
		<li><a href="#" class="footer-regular">National</a></li>
		</ul>

		<ul class="footer-links">
		<li><a href="#" class="footer-header">Life</a></li>
		<li><a href="#" class="footer-regular">Columns</a></li>
		<li><a href="#" class="footer-regular">Love Connections</a></li>
		<li><a href="#" class="footer-regular">Love Connections Survey</a></li>
		</ul>
	</div>

	<div id="column-2">
		<ul class="footer-links">
		<li><a href="#" class="footer-header">Opinion</a></li>
		<li><a href="#" class="footer-regular">Cartoons</a></li>
		<li><a href="#" class="footer-regular">Columns</a></li>
		<li><a href="#" class="footer-regular">Lead Editorials</a></li>
		<li><a href="#" class="footer-regular">Letters to the Editor</a></li>
		</ul>

		<ul class="footer-links">
		<li><a href="#" class="footer-header">Blogs</a></li>
		</ul>

		<ul class="footer-links">
		<li><a href="#" class="footer-header">Tableau</a></li>
		<li><a href="#" class="footer-regular">Art</a></li>
		<li><a href="#" class="footer-regular">Movies</a></li>
		<li><a href="#" class="footer-regular">Music</a></li>
		</ul>
	</div>

	<div id="column-3">
		<ul class="footer-links">
		<li><a href="#" class="footer-header">Sports</a></li>
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

	<div id="column-4">
		<ul class="footer-links">
		<li><a href="#" class="footer-header">Multimedia</a></li>
		<li><a href="#" class="footer-regular">Audio</a></li>
		<li><a href="#" class="footer-regular">Photo Gallery</a></li>
		<li><a href="#" class="footer-regular">Video Reports</a></li>
		</ul>

		<ul class="footer-links">
		<li><a href="#" class="footer-header">About</a></li>
		<li><a href="#" class="footer-regular">Contact</a></li>
		<li><a href="#" class="footer-regular">Corrections</a></li>
		<li><a href="#" class="footer-regular">History</a></li>
		<li><a href="#" class="footer-regular">Join</a></li>
		</ul>
	</div>
	</div>

	<br>

	<div id="footer-images">
		<img src="images/cavdailyfoot.png" class="right" alt="Bottom Banner"/>
		<img src="images/gear.png" class="centered" alt="Detroit Softworks"/>
	</div>
	<div id="copyright">
		<p>All Content &copy; Copyright 2012, The Cavalier Daily</p>
	</div>
</div>
<!-- End of footer-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="{{ 'assets/js/bootstrap.min.js'|asset }}"></script>
{# include 'gryphon/main/tracker.tpl' #}
</body>
</html>
