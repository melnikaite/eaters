row = $('.row').not('[id]').eq(1)
row.attr('id', 'category-<%= @category.id %>')
row.find('[data-method="delete"]').attr('href', '<%= category_path(@category) %>').removeClass('hide')
form = row.find('form')
form.attr('action', '<%= category_path(@category) %>')
form.attr('method', 'put')
form.data('waiting-response', false)
if row.siblings('.row').not('[id]').length == 1
  row.clone().appendTo(row.parent()).find('input').val('')
@validate form
