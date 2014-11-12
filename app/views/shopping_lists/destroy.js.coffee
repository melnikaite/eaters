$('#shopping_list-<%= @shopping_list.id %>').remove()
$('h1 .badge').replaceWith('<%= last_updated([@shopping_list]) %>')
