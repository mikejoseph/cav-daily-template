{% extends 'gryphon/base.tpl' %}
{% block title %} :: Housing Guide{% endblock %}
{% block activeNav %}housing{% endblock %}
{% block flag %}Housing Guide{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
{% helper config %}

{% include 'gryphon/ads/leaderboard_728x90.tpl' %}
<div class="grid_8">
	<h2 class="mmb">Create a new account</h2>
	
	<div class="body-copy">
		<p>Already have an account? <a href="/roost">Login here</a>.</p>
		
		<p>New accounts may be subject to review by our staff. If you have any questions about your account status, please do not hesitate to <a href="{{ 'page/about'|url }}">contact us</a>.</p>
	
		{% if error %}
			<p class="error">Oops!</p>
			
			<ul class="bullet">
			{% for item in error %}
				<li><span class="error">{{ item }}</span></li>
			{% endfor %}
			</ul>
		{% elseif success %}
			<p class="alert">Your account request has been submitted.</p>
			
			All new Housing Guide accounts are subject to our mandatory review process. Your account should be active shortly at
			<a href="{{ 'roost'|url }}">{{ 'roost'|qualifiedUrl }}</a>.
		{% endif %}
	</div>
	
	<hr class="mb" />

	<form method="post" action="{{ 'roost:roost/account'|url }}">
		<table class="formwrap">
			<tr><th></th><td><strong class="req">*</strong> <em>Required Fields</em></td></tr>
			
			<tr>
				<th><label for="input_name">Name<span class="req">*</span></label></th>
				<td><input type="text" name="name" id="input_name" value="{{ posted.name }}" size="30" /></td>
			</tr>
			
			<tr>
				<th><label for="input_email">Email<span class="req">*</span></label></th>
				<td><input type="text" name="email" id="input_email" value="{{ posted.email }}" size="30" /></td>
			</tr>
			
			<tr>
				<th><label for="input_pass1">Password<span class="req">*</span></label></th>
				<td><input type="password" name="pass1" id="input_pass1" size="30" /></td>
			</tr>
			
			<tr>
				<th><label for="input_pass2">Re-type password<span class="req">*</span></label></th>
				<td><input type="password" name="pass2" id="input_pass2" size="30" /></td>
			</tr>
			
			<tr>
				<th><label for="input_company">Affiliation</label></th>
				<td><input type="text" name="company" id="input_company" value="{{ posted.company }}"  size="30" />
				<div class="aside2">Do you work for a rental company? If so, which one?</div></td>
			</tr>
			
			<tr>
				<th><label>Verify<span class="req">*</span></label></th>
				<td>
					<script type="text/javascript">
					var RecaptchaOptions = {
						theme : 'white'
					};
					</script>
					{{ turing }}	
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td>
					<p>I hereby consent to submit my property listing(s) to {{ config.get('gryphon:publication:name') }}. My listing(s) may be reproduced by {{ config.get('gryphon:publication:name') }} for the purposes of illustration, trade or publication in any form or matter including print and online. All proofs, prints, negatives, positives, digital files, and reproduction thereof shall be and remain the sole property of {{ config.get('gryphon:publication:name') }}.</p>
					
					<div class="aside2"><input type="checkbox" value="1" id="input_agree" name="agree" /> I agree with the above terms and conditions.<strong class="req">*</strong></div>
				</td>
			</tr>
			
			<tr>
				<th></th>
				<td><input type="submit" value="Request an account" /></td>
			</tr>
		</table>
	</form>
</div>
<div class="grid_4">
	{% include 'roost/roost/owners_box.tpl' %}
	{% include 'gryphon/main/sidebar/default.tpl' %}
</div>

<div class="clear"></div>
{% endblock %}