$('#product-<%= @product.id %>').remove()
$('h1 .badge').replaceWith('<%= last_updated([@product]) %>')
