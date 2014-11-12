form = $('#shopping_list-<%= @shopping_list.id %> form')
form.data('waiting-response', false)
$('h1 .badge').replaceWith('<%= last_updated([@shopping_list]) %>')
