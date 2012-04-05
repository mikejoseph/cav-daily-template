{% helper config %}
<h5>Join the discussion</h5>

<form method="post" action="{{ commentUrl }}" id="commentform">
	<input type="hidden" name="key" value="{{ commentKey }}" />
	<input type="hidden" name="type" value="{{ commentItem.myNS~':'~commentItem.modelString }}" />
	<input type="hidden" name="id" value="{{ commentItem.uid }}" />

	<fieldset id="comment-userinfo">
		<input type="text" name="name" id="comment_name" value="Your Name" class="clearMeFocus" />
		<input type="text" name="email" id="comment_email" value="Your Email (won't be published)" />
	</fieldset>
	<fieldset>
		<textarea name="comment" id="comment_body" rows="7">Your Comment</textarea>
		<script type="text/javascript">
		var RecaptchaOptions = {
			theme : 'custom',
			custom_theme_widget : 'recaptcha_widget'
		};
		</script>
		<div id="recaptcha_widget" style="display:none">
			<hr />
			<div id="recaptcha_image"></div>
			<hr class="mmb" />
			<div class="recaptcha_only_if_incorrect_sol" class="attn">Incorrect please try again</div>
			<span class="recaptcha_only_if_image">Enter the words above:</span>
			<span class="recaptcha_only_if_audio">Enter the numbers you hear:</span>
			
			<input type="text" id="recaptcha_response_field" name="recaptcha_response_field" />
			
			<div class="aside mmb"><a href="javascript:Recaptcha.reload()">Get another CAPTCHA</a> | 
			<span class="recaptcha_only_if_image"><a href="javascript:Recaptcha.switch_type('audio')">Get an audio CAPTCHA</a></span>
			<span class="recaptcha_only_if_audio"><a href="javascript:Recaptcha.switch_type('image')">Get an image CAPTCHA</a></span> | 
			<span><a href="javascript:Recaptcha.showhelp()">Help</a></span></div>
		 </div>
		
		{% if turing %}
			{{ turing }}
		{% endif %}
	</fieldset>

	<input type="submit" id="comment_submit" value="Add Comment" />			
</form>

<h6 class="mmb">You Should Know</h6>

<p class="aside2">{{ config.get('gryphon:publication:name') }} reserves the right to remove any comment deemed racially derogatory, inflammatory, or spammatory. Repeat offenders may have their IP address banned from posting future comments. Please be nice.</p>

{% if config.get('gryphon:comments:moderation') %}
	<p>Comments will not appear until approved by a site moderator.</p>
{% elseif config.get('gryphon:comments:emailVerification') %}
	<p>If this is the first time you've commented, your comment won't appear until you've verified your email address.</p>
{% endif %}

<h6>Formatting Options:</h6>
<ul id="format_options" class="mb">
	<li>Links: "my link":http://my.url.com</li>
	<li>Bold: *something!*</li>
	<li>Italic: _OMG!_</li>
</ul>