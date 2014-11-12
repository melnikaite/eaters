$('#shopping_list_item-<%= @shopping_list_item.id %>').remove()
$('h1 .badge').replaceWith('<%= last_updated([@shopping_list_item]) %>')
