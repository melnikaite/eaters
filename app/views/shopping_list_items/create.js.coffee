<%- if @shopping_list_item.is_a?(Array) %>
window.location.href = '<%= shopping_list_shopping_list_items_path(@shopping_list_item[0].shopping_list_id) %>'
<%- else %>
row = $('.row').not('[id]').eq(1)
row.attr('id', 'shopping_list_item-<%= @shopping_list_item.id %>')
row.find('[data-method="delete"]').attr('href', '<%= shopping_list_shopping_list_item_path(@shopping_list_item.shopping_list_id, @shopping_list_item.id) %>').removeClass('hide')
form = row.find('form')
form.attr('action', '<%= shopping_list_shopping_list_item_path(@shopping_list_item.shopping_list_id, @shopping_list_item.id) %>')
form.attr('method', 'put')
form.data('waiting-response', false)
if row.siblings('.row').not('[id]').length == 1
  newRow = row.clone().appendTo(row.parent())
  newRow.find('.select2-container').remove()
  newRow.find('input').not('[type="checkbox"]').val('')
  newRow.find('input').filter('[type="checkbox"]').attr('checked', false)
  $.each newRow.find('[data-source]'), ->
    initSelect2 $(this)
  newRow.removeAttr('id')
  newForm = newRow.find('form')
  newForm.attr('action', '<%= shopping_list_shopping_list_items_path(@shopping_list_item.id) %>')
  newForm.attr('method', 'post')
<%- end %>
