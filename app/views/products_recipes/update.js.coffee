form = $('#products_recipe-<%= @products_recipe.id %> form')
form.data('waiting-response', false)
$('h1 .badge').replaceWith('<%= last_updated([@products_recipe]) %>')
