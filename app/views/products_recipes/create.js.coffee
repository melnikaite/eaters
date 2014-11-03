row = $('.row').not('[id]').eq(1)
row.attr('id', 'products_recipe-<%= @products_recipe.id %>')
row.find('[data-method="delete"]').attr('href', '<%= recipe_products_recipe_path(@products_recipe.recipe_id, @products_recipe.id) %>').removeClass('hide')
form = row.find('form')
form.attr('action', '<%= recipe_products_recipe_path(@products_recipe.recipe_id, @products_recipe.id) %>')
form.attr('method', 'put')
form.data('waiting-response', false)
if row.siblings('.row').not('[id]').length == 1
  newRow = row.clone().appendTo(row.parent())
  newRow.find('.select2-container').remove()
  newRow.find('input').val('')
  $.each newRow.find('[data-source]'), ->
    initSelect2 $(this)
  newRow.removeAttr('id')
  newForm = newRow.find('form')
  newForm.attr('action', '<%= recipe_products_recipes_path(@recipe.id) %>')
  newForm.attr('method', 'post')