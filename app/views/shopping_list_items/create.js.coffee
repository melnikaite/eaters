<%- if @shopping_list_item.is_a?(Array) %>
window.location.href = '<%= shopping_list_shopping_list_items_path(@shopping_list_item[0].shopping_list_id) %>'
<%- else %>
row = $('.row').not('[id]').eq(1)
$('.row#shopping_list_item-<%= @shopping_list_item.id %>').remove()
row.find('[name="shopping_list_item[done]"]').prop('checked', <%= @shopping_list_item.done %>)
row.find('[name="shopping_list_item[required]"]').val(<%= @shopping_list_item.required.to_i %>)
row.find('[name="shopping_list_item[unit_id]"]').select2('data', {id: '<%= @shopping_list_item.unit_id || "" %>', text: '<%= @shopping_list_item.unit.try(:title) || "" %>'})
row.attr('id', 'shopping_list_item-<%= @shopping_list_item.id %>')
row.find('[data-method="delete"]').attr('href', '<%= shopping_list_shopping_list_item_path(@shopping_list_item.shopping_list_id, @shopping_list_item.id) %>').removeClass('hide')
form = row.find('form')
form.attr('action', '<%= shopping_list_shopping_list_item_path(@shopping_list_item.shopping_list_id, @shopping_list_item.id) %>')
form.attr('method', 'put')
form.data('waiting-response', false)
if row.siblings('.row').not('[id]').length == 2
  newRow = row.clone().insertAfter(row)
  newRow.find('.select2-container').remove()
  newRow.find('input').not('[type="checkbox"]').val('')
  newRow.find('input').filter('[type="checkbox"]').attr('checked', false)
  $.each newRow.find('[data-source]'), ->
    initSelect2 $(this)
  newRow.removeAttr('id')
  newForm = newRow.find('form')
  newForm.attr('action', '<%= shopping_list_shopping_list_items_path(@shopping_list_item.shopping_list_id) %>')
  newForm.attr('method', 'post')
<%- end %>
