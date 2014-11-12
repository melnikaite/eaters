form = $('#shopping_list_item-<%= @shopping_list_item.id %> form')
form.data('waiting-response', false)
$('h1 .badge').replaceWith('<%= last_updated([@shopping_list_item]) %>')
