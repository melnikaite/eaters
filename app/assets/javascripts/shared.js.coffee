$.get '/users', (data) ->
  Bugsense.initAndStartSession({apiKey: 'd13093e2', userIdentifier: data.id})
Bugsense.on 'crash', ->
  $('h1 .badge').addClass('danger').text('Reload page to make sure everything is saved')

@timeouts = {}

@initSelect2 = (input) ->
  url = input.data('source')
  input.select2
    initSelection: (element, callback) ->
      callback $(element).data('value') if $(element).data('value')
    ajax:
      url: url
      dataType: 'json'
      quietMillis: 100
      results: (data) ->
        $.each data, (id, option) ->
          data[id] =
            id: option.id || option.provider
            text: option.title || option.provider
        results: data
        more: false
      cache: true
    allowClear: true
    placeholder: ' '
    width: '100%'

@toggleShoppingListId = ->
  has_checked_items = $('[name="add_to_shopping_list"]:checked').length > 0
  $('[name="shopping_list_id"]').select2('enable', has_checked_items)

$(document).on 'ready page:load', ->
  $(document).off 'keyup change', 'input'
  $(document).on 'keyup change', 'input', (e) ->
    form = $(this).closest('form')
    handleSubmit(form) if form.hasClass('autosubmit')

  handleSubmit = (form) ->
    id = form.data('waiting-response')
    if @timeouts[id]
      clearTimeout @timeouts[id]
      delete @timeouts[id]

    if form.valid()
      if id
        @timeouts[id] = setTimeout ->
          handleSubmit(form)
        , 250
      else
        form.data('waiting-response', (new Date()).getTime())
        $('h1 .badge').text('Saving...')
        form.submit()

  @validate = (form) ->
    form.validate
      highlight: (element) ->
        $(element).closest('form').find('.form-group').addClass 'has-error'
      unhighlight: (element) ->
        $(element).closest('form').find('.form-group').removeClass 'has-error'
  @validate $('form')

  $.each $('[data-source]'), ->
    initSelect2($(this))

  $(document).off 'change', '[name="add_to_shopping_list"]'
  $(document).on 'change', '[name="add_to_shopping_list"]', ->
    toggleShoppingListId()
  toggleShoppingListId()

  $(document).off 'change', '[name="shopping_list_id"]'
  $(document).on 'change', '[name="shopping_list_id"]', ->
    data = $.map $('[name="add_to_shopping_list"]:checked'), (checkbox, i) ->
      form = $(checkbox).closest('form')
      {
        product_id: $(checkbox).val(),
        required: $(form).find('[name="products_recipe[required]"], [name="product[required]"]').val(),
        unit_id: $(form).find('[name="products_recipe[unit_id]"], [name="product[unit_id]"]').val()
      }
    $.ajax
      method: 'post'
      url: "/shopping_lists/#{$(this).val()}/shopping_list_items"
      dataType: 'script'
      data: {shopping_list_item: data}
