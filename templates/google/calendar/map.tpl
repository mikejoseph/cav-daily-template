{% set apiKey = config.get('google:maps_api') %}
{% if event.location %}
	{% set coords = event.coordinates %}
{% endif %}

<script type="text/javascript">
$(document).ready(function(){
{% if coords %}

	if( GBrowserIsCompatible() ) {
		$(window).bind( "unload", function() {
			GUnload();
		});

		var map = new GMap2( document.getElementById('google-map') );
		map.setCenter(new GLatLng( {{ coords }} ), 13);
		map.setUIToDefault();

		GEvent.addListener( map, 'click', function() {
			map.closeInfoWindow();
		});
		
		var baseIcon = MapIconMaker.createMarkerIcon({
			width: 30,
			height: 30,
			primaryColor: "#0066CC",
			cornerColor: "#3399FF"
		});

		var marker = new GMarker(
			new GLatLng( {{ coords }} ),
			{icon: baseIcon}
		);

		map.addOverlay( marker );

		
	
		GEvent.addListener( marker, 'click', function() {
			map.openInfoWindowHtml( marker.getLatLng(),
				'<div style="margin-top:5px;">{{ event.location }}<\/div>'
			)
		});
	}

{% else %}

	$('#google-map').css({
		'height' : 50,
		'width' : '100%'
	});
	$('#google-map').html( 'Sorry, the map is not available for this location' );	

{% endif %}
});
</script>