#= require parsleyjs
'use strict'

$ -> 
  $('#form_landlord').parsley()
    .on 'form:error', -> 
      $.each this.fields, (key, field) ->
        if field.validationResult isnt true
          form_group_div = $(this.$element).parent('div.form-group')
          $(this.$element).addClass 'form-control-danger'
          form_group_div.addClass 'has-danger'
          $(this.$element).next('div.form-control-feedback').show()
    .on 'form:validate', ->
      $('div.form-group')
        .removeClass 'has-success'
        .removeClass 'has-danger'
      $('div.form-control-feedback').hide()
      $('.form-control').removeClass 'form-control-danger'
  # Tips to make dure to not call the submit button before javascript loaded
  $('#form_landlord').find('input:submit').attr('disabled', false)
  console.log 'javascript loaded ...'