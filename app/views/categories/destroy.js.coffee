$('#category-<%= @category.id %>').remove()
$('h1 .badge').replaceWith('<%= last_updated([@category]) %>')
