{% fetch categories from eclipse:category with [
	'order': 'name asc'
] %}
<form id="classifieds-search-form" method="post" action="{{ 'eclipse:main/search'|url }}">
	<table class="formwrap">
		<tr>
			<th><label for="classifieds-search-terms">Find</label></th>
			<td><input type="text" id="classifieds-search-terms" name="token" size="30" value="" /></td>
		</tr>
		
		<tr>
			<th><label>Category</label></th>
			<td>
				<select name="category" id="classifieds-search-category">
					<option value="0">All categories</option>
					{% for category in categories %}
						<option value="{{ category.name_normalized }}">{{ category.name }}</option>
					{% endfor %}
				</select>
			</td>
		</tr>
		
		<tr>
			<th></th>
			<td><input type="submit" id="classifieds-search-submit" value="Search" /></td>
		</tr>
	</table>
</form>
