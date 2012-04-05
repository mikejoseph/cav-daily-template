{% extends 'gryphon/base.tpl' %}
{% block title %} :: Housing Guide : Contact {{ property.name }}{% endblock %}
{% block activeNav %}housing{% endblock %}
{% block flag %}Housing Guide{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<div id="listing_header" class="shade hat">
		<h2><a href="{{ property.listingUrl }}">{{ property.name }}</a></h2>
		{{ property.address }}
		| <span class="phone">{{ property.phone }}</span>
		{% if property.url %}
			| <a class="website"><a href="{{ property.url }}">Website</a>
		{% endif %}
	</div>
	
	{% if success %}
		<div id="message">
			<p class="alert"><strong>Message sent</strong></p>
			
			<p>Your message was successfully sent.</p>
		</div>
		<hr class="mb" />
	{% elseif errors %}
		<div id="message">
			<p class="error"><strong>Oops</strong></p>
			
			<p class="error">
			{% for id, label in errors %}
				{{ label }}<br />
			{% endfor %}
			</p>
		</div>
		<hr class="mb" />
	{% endif %}
	
	<form method="post" action="{{ ('roost:roost/contact/'~property.uid)|url }}">
	<div class="grid_5 alpha">
		<table class="formwrap">
			<tr>
				<th style="width:100px;"><label for="input_name">Name</label></th>
				<td><input type="text" name="name" id="input_name" value="{{ posted.name }}" size="20" /></td>
			</tr>
			
			<tr>
				<th style="width:100px;"><label for="input_email">Email</label></th>
				<td><input type="text" name="email" id="input_email" value="{{ posted.email }}" size="20" /></td>
			</tr>
			
			<tr>
				<th style="width:100px;"><label for="input_phone">Telephone</label></th>
				<td><input type="text" name="phone" id="input_phone" value="{{ posted.phone }}" size="20" /></td>
			</tr>
			
			<tr>
				<th style="width:100px;"><label for="input_description">Message</label></th>
				<td>
					<textarea rows="10" style="width:100%;" id="input_description" name="description">{{ posted.description }}</textarea>
					<div class="aside2">What do you want to ask? Please be as specific as possible.</div>
				</td>
			</tr>
			
			<tr>
				<th style="width:100px;"></th>
				<td><input type="submit" value="Send message" /> | <a href="{{ property.urlListing }}">Return to property listing</a></td>
			</tr>
		</table>
	
	</div>
	</form>
	<div class="grid_3 omega">
		<h6 class="hat mmb">Summary:</h6>
		
		<p>
			<strong>Type:</strong> {{ property.type }}<br />
			<strong>Lease Duration:</strong> {{ property.leaseLabel }}
			<strong>Bedrooms:</strong> {{ property.bedrooms }}<br />
			<strong>Bathrooms:</strong> {{ property.bathrooms }}
		</p>
		<hr class="mb" />
		
		<div class="price">{{ property.rentLabel }}<br /><span>per {{ property.rent_modifier }}</div>		
		{{ property.description_formatted }}
	</div>

	<div class="clear">&nbsp;</div>
	
</div>
<div class="grid_4">
	{% include 'roost/roost/owners_box.tpl' %}
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear"></div>
{% endblock content %}