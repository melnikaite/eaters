$('#recipe-<%= @recipe.id %>').remove()
$('h1 .badge').replaceWith('<%= last_updated([@recipe]) %>')
