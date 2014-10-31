row = $('.row').not('[id]').eq(1)
row.attr('id', 'product-<%= @product.id %>')
row.find('[data-method="delete"]').attr('href', '<%= product_path(@product) %>').removeClass('hide')
form = row.find('form')
form.attr('action', '<%= product_path(@product) %>')
form.attr('method', 'put')
form.data('waiting-response', false)
if row.siblings('.row').not('[id]').length == 1
  row.clone().appendTo(row.parent()).find('input').val('')
@validate form
