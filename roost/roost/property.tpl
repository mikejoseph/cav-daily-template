{% extends 'gryphon/base.tpl' %}
{% block title %} :: Housing Guide : {{ property.name }}{% endblock %}
{% block activeNav %}housing{% endblock %}
{% block flag %}Housing Guide{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="{{ 'roost/frontend/javascript/master.js'|url }}"></script>
	<script type="text/javascript" src="{{ 'flash/jwplayer/swfobject.js'|url }}"></script>
	<script type="text/javascript" src="{{ 'gfn-blackletter/js/thickbox-compressed.js'|url }}"></script>
{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'gfn-blackletter/css/thickbox.css'|url }}" />
{% endblock %}

{% block content %}
	{% helper config %}

	{#
	  This fetches related properties by owner. If the owner doesn't have any
	  other properties, this fetches other properties with the same rent level.
	#}
	{% set related = property.getRelated(3) %}
	{% set relatedLabel = 'Related Properties' %}
	
	{% if related.length == 0 %}
		{% set related = property.getSimilar('rent', property.rent, '3') %}
		{% set relatedLabel = 'Similar Properties' %}
	{% endif %}
	
	{% set images = property.propertyAssets.grab('type', 'image') %}
	{% set docs = property.propertyAssets.grab('type', 'document') %}
	{% set videos = property.propertyAssets.grab('type', 'video') %}
	
	{% set amenitiesMap = config.get('roost:amenitiesMap') %}
	
	{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
	<div class="grid_8">
		<h2 class="mmb">Housing Guide</h2>
		
		<div id="listing_header" class="shade hat">
			<h2>{{ property.name }}</h2>
			{{ property.address }}
			| <span class="phone">{{ property.phone }}</span>
			{% if property.email %}
				| <a href="{{ ('roost:roost/contact/'~property.uid)|url }}" class="email">Contact via email</a>
			{% endif %}
			{% if property.url %}
				| <a class="website" href="{{ property.url }}">Visit website</a>
			{% endif %}
		</div>
		
		{% if success %}
			<div id="message">
				<p class="alert"><strong>Message sent</strong></p>
				
				<p>Your message was successfully sent.</p>
			</div>
		{% elseif errors %}
			<div id="message">
				<p class="error"><strong>Oops</strong></p>
				
				<p class="error">
				{% for id, label in errors %}
					{{ label }}<br />
				{% endfor %}
				</p>
			</div>
		{% endif %}
		
		<div class="grid_5 alpha">
			<h6 class="hat mmb">Summary:</h6>
			
			<p>
				<strong>Type:</strong> {{ property.type }}<br />
				<strong>Lease Duration:</strong> {{ property.leaseLabel }}
				{% if property.licensed_for %}
					<br /><strong>Licensed For:</strong> {{ property.licensed_for }}
				{% endif %}	
				<strong>Bedrooms:</strong> {{ property.bedrooms }}<br />
				<strong>Bathrooms:</strong> {{ property.bathrooms }}
				
				<hr />
			</p>
			<hr class="mb" />
			
			<div class="price">{{ property.rentLabel }}<br /><span>per {{ property.rent_modifier }}</div>		
			{{ property.description_formatted }}
			
			<div class="clear mmb">&nbsp;</div>
		
			<h6 class="hat mmb">Photos:</h6>
			{% if images.length %}
				<div id="listing_photos">
				{% for item in images %}
					<a href="{{ item.url }}" name="{{ item.caption_formatted|striptags }}" class="thickbox"><img src="{{ item.urlThumbnail }}" /></a>
					
					{% if loop.index % 3 == 0 %}
						<div class="clear"> </div>
					{% endif %}
				{% endfor %}
				</div>
				<div class="clear mb">&nbsp;</div>
								
			{% else %}
				
				<p>
					Sorry, we don't have any images for this property.
				</p>
				
			{% endif %}
			
			<h6 class="hat mmb">Documents:</h6>
			{% if docs.length %}
				
				<ul id="listing_documents">
				{% for doc in docs %}
					<li>
						{{ doc.caption_formatted }}
						<a href="{{ doc.urlOriginal }}">Download PDF</a>
					</li>
				{% endfor %}
				</ul>
				
			{% else %}
				
				<p>
					Sorry, we don't have any PDF documents for this property.
				</p>
				
			{% endif %}
	
			<hr class="spacer" />
			
			<h6 class="hat mmb">Videos:</h6>
			{% if videos.length %}
				{% import 'macros/render.tpl' as mediaRender %}
								
				<div id="listing_videos">
				{% for video in videos %}
					<div class="jwplayer" id="player-{{ video.uid }}" style="width:380px"></div>
					<script type="text/javascript">
					//<![CDATA[
					window.addEvent('domready', function() {
							var s1 = new SWFObject("{{ 'flash/jwplayer/player.swf'|url }}","ply","380","260","9","#FFFFFF");
							s1.addParam("allowfullscreen","true");
							s1.addParam("allownetworking","all");
							s1.addParam("allowscriptaccess","always");
							s1.addParam("flashvars","file={{ video.urlOriginal }}&image=&logo=");
							s1.write("player-{{ video.uid }}");
					
						});
						//]]>
					</script>
					{% if video.caption %}
						<div class="small">
							{{ video.caption_formatted }}
						</div>
					{% endif %}
					<hr class="mmb" />
				{% endfor %}
				</div>
				
			{% else %}
				
				<p>
					Sorry, we don't have any videos for this property.
				</p>
				
			{% endif %}
			
			<hr />
			
			<p class="small">
				Continued use of this service implies acceptance of the <a href="{{ 'roost:roost/tos'|url }}">Terms of Service</a>.
			</p>
			
		</div>
		<div class="grid_3 omega">
		
			<h6 class="hat mmb">Amenities:</h6>

			{% set half = amenitiesMap|length//2 %}
			<ul class="listing_features" id="left">
			{% for amenity, label in amenitiesMap %}
				{% if loop.index0 == half %}
					</ul>
					<ul class="listing_features" id="right">
				{% endif %}
				<li{% if property[amenity] %} class="pos"{% endif %}>{{ label }}</li>				
			{% endfor %}
			</ul>
			<div class="clear"></div>
	
			<h5 class="bordered">Map:</h5>
	
			<a href="{{ property.urlMap }}"><img id="listing_map" src="{{ property.urlStaticMapBig }}" alt="{{ property.urlStaticMapBig }}" /></a>
			<a href="{{ property.urlMap }}" class="button">Get Driving Directions &#187;</a>
	
			<hr class="spacer" />
	
			<div id="mailform">
				<strong>Email listing:</strong>
				<form method="post" action="{{ ('roost:roost/send/'~property.uid )|url }}">
				
				<p class="mmb">
					<label for="input_mailName">Your name:</label><br />
					<input type="text" name="sender_name" id="input_mailName" value="" />
				</p>
				
				<p class="mmb">
					<label for="input_mailSender">Your email:</label><br />
					<input type="text" name="sender" id="input_mailSender" value="" />
				</p>
				
				<p class="mmb">
				<label for="input_mailReceiver">To email:</label><br />
				<input type="text" name="receiver" id="input_mailReceiver" value="" />
				
				<input type="hidden" name="mailKey" value="{{ mailKey }}" />
				
				<p class="mmb">
					<input type="submit" value="Send" />
				</p>
				
				</form>
			</div>
		</div>
	
		<div class="clear mmb"> </div>
	
		{#
		<div class="mb">
			<a href="{{ 'roost/mobile'|url }}"><img src="{{ 'roost/frontend/style/images/mobile-banner.png'|url }}" alt="The Housing Guide mobile version" /></a>
		</div>
		#}
		
		<hr class="spacer" />
		
		<div class="grid_8 alpha omega">
			{% if related.length %}
			
				<h6 class="hat mmb">{{ relatedLabel }}</h6>
				<div id="search_results">
					<ul>
					{% for prop in related %}
						<li>
							{% if prop.name == prop.street %}
								{% set useName = prop.street %}
							{% else %}
								{% set useName = prop.name~', '~prop.street %}
							{% endif %}

							<h4><a href="{{ prop.listingUrl }}">{{ useName }} {{ prop.city }}</a></h4>
							<div class="info_wrap">
								<div class="price">{{ prop.rentLabel }}<br /><span>per {{ prop.rent_modifier }}</div>		
								<div class="description">
									{{ prop.summary_formatted }}
								</div>
							</div>
							<a href="{{ prop.urlMap }}"><img src="{{ prop.urlStaticMap }}" /></a>
							<div class="contact_info">
								<span class="phone">{{ prop.phone }}</span>
								{% if prop.email %}
									<a class="email" href="{{ ('roost/contact/'~prop.uid)|url }}" class="email">Contact via email</a>
								{% endif %}
								{% if prop.url %}
									<a class="website" href="{{ prop.url }}">Visit website</a>
								{% endif %}
								<a class="listing_link" href="{{ prop.listingUrl }}">View Full Listing &rarr;</a>
							</div>
		
						</li>
					{% endfor %}
					</ul>
				</div>
			{% endif %}	
		</div>
	
	</div>
	<div class="grid_4">
		{% include 'roost/roost/owners_box.tpl' %}
		{% include 'gryphon/main/sidebar/default.tpl' %}
	</div>
	
	<div class="clear"></div>
{% endblock %}