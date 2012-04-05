{#
<?php
/**
 * Quick and dirty 'star rater' for GCalendar events
 *
 * Please note that I've only written jQuery once before (I'm a Mootooler),
 * so there may be a better way to do this. It seems overly verbose to me.
 *
 * @author Mike Joseph <josephm5@msu.edu>
 * @package Plugins
 * @subpackage GCalendar
 * @copyright Copyright &copy; 2009, The State News
 * @license http://opensource.org/licenses/gpl-2.0.php GNU GPL 2.0
 */
?>
<script type="text/javascript">
<!--
$(document).ready( function() {

// determine the base url (e.g. http://demo.detroitsoftworks.com/)
var basePath = window.location.toString();
if( basePath.indexOf( 'index.php' ) != -1 ) {
	basePath = basePath.substr( 0, basePath.indexOf( 'index.php' ) );
}


var form = $('#vote-form');
var rating = parseInt( $('#event-rating').text() );

var container = $('<div id="star-rate-container"></div>').bind(
	'mouseleave', function() {
		// reset the stars after mouse leaves container div
		$('.star-rate').each( function( i ) {
			$(this).attr( 'src', basePath+'gfn-lobo/assets/'+
				$(this).attr('rel')+'.png' );

		});
	}
);

form.before( container );

var baseStar = 'star';
for( var i=1; i<=5; i++ ) {
	if( i > rating ) {
		baseStar = 'star_grey';
	}
	// add the stars
	var img = $('<img src="'+basePath+'gfn-lobo/assets/'+baseStar+
		'.png" class="star-rate" id="star-rate-'+i+'" rel="'+baseStar+
		'" />').bind(
			'mouseenter', function() {
				var current = parseInt( this.id.substr( 10 ) );
				$('.star-rate').each( function( i ) {
					// change star state, anything *before* this star
					// is gold
					var star = 'star_grey';
					if( i < current ) {
						star = 'star_gold';
					}
					
					$(this).attr( 'src', basePath+'gfn-lobo/assets/'+
						star+'.png' );

				});
			}
		).bind(
			'click', function() {
				var current = parseInt( this.id.substr( 10 ) );
				// we have to append .json so Gryph knows to return a 
				// properly encoded JSON encoded string
				var url = form.attr( 'action' ).replace( /\/vote/,
					"/vote.json" );
				$.ajax({
					type: "POST",
					url: url,
					data: ({'vote': current}),
					dataType: "json",
					success: function( data ) {
						if( data.isError ) {
							alert( data.message );
							return;
						}
						// reset the defaults so the 'mouseleave' callback
						// above displays the correct number of stars
						$('.star-rate').each( function( i ) {
							var star = 'star_grey';
							if( i < data.rating ) {
								star = 'star';
							}
							
							$(this).attr( 'rel', star );
		
						});
						$('#event-rating').text( data.rating );
					}
				});
			}
		);
	
	container.append( img );
}

// hide the form
form.css( 'display', 'none' );

});
//-->
</script>
#}