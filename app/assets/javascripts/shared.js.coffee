@timeouts = {}
$(document).ready ->
  $(document).on 'keyup change', 'input', (e) ->
    form = $(this).closest('form')
    handleSubmit(form)

  handleSubmit = (form) ->
    id = form.data('waiting-response')
    if @timeouts[id]
      clearTimeout @timeouts[id]
      delete @timeouts[id]

    if form.valid()
      if id
        @timeouts[id] = setTimeout ->
          handleSubmit(form)
        , 1000
      else
        form.data('waiting-response', (new Date()).getTime())
        form.submit()

  $(document).on 'keyup', '.form-group input:first-child', (e) ->
    row = $(this).closest('.row')
    if $.trim($(this).val()) && row.siblings('.row').not('[id]').length == 1
      row.clone().appendTo(row.parent()).find('input').val('')

  @validate = (form) ->
    form.validate
      highlight: (element) ->
        $(element).closest('form').find('.form-group').addClass 'has-error'
      unhighlight: (element) ->
        $(element).closest('form').find('.form-group').removeClass 'has-error'
  @validate $('form')

  $.each $('[data-source]'), ->
    url = $(this).data('source')
    $(this).select2
      initSelection: (element, callback) ->
        callback $(element).data('value') if $(element).data('value')
      ajax:
        url: url
        dataType: 'json'
        quietMillis: 100
        results: (data) ->
          $.each data, (id, option) ->
            data[id] =
              id: option.id
              text: option.title
          results: data
          more: false
      allowClear: true
      placeholder: ' '
      width: '100%'
