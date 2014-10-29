$.extend $.fn.editable.defaults, {
  mode: 'inline',
  showbuttons: false,
  onblur: 'submit',
  emptytext: 'Select'
}

$(document).ready ->
  $('[data-name]').editable()
  $('.prepend[data-name]').editable 'option', 'prepend', ['']
  $('.float[data-name]').editable 'option', 'emptytext', 0
  $('.float[data-name]').editable 'option', 'validate', (value) ->
    unless /^(\d+(\.\d+)?|)$/.test $.trim(value)
      'Use following format: 0.5'
