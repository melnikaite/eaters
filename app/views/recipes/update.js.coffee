form = $('#recipe-<%= @recipe.id %> form')
form.data('waiting-response', false)
$('h1 .badge').replaceWith('<%= last_updated([@recipe]) %>')
