$('#products_recipe-<%= @products_recipe.id %>').remove()
$('h1 .badge').replaceWith('<%= last_updated([@products_recipe]) %>')
