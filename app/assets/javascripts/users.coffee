class App.Users
  constructor: () ->
    $('.sio-message-form').on('submit', @.send_message.bind(@))
  send_message: (e) ->
    e.preventDefault()
    $form        = $(e.target).closest('.sio-message-form')
    $title_h1    = $(".sio-contact-list-title")
    user_id      = $title_h1.data('user-id')
    $textarea    = $form.find('.sio-message-text')
    message      = $textarea.val()
    $contact     = $form.find("input[name='contact']:checked")
    contact_id   = $contact.val()
    contact_name = $contact.next().find('.sio-contact-name').text()
    SIO_ROOT     = "https://stage.skipio.com/api/v2/"
    token        = $title_h1.data('token')
    url          = "#{SIO_ROOT}messages?token=#{token}"
    data =
      recipients: [
        "contact-#{contact_id}"
      ]
      message:
        body: message
    $.ajax
      url: url
      method: 'POST'
      dataType: 'text'
      data: data
      complete: (jqXHR, status) ->
        switch jqXHR.status
          when 201
            log 'success', jqXHR, status
            $textarea.val('')
            $('.sio-message-log').append("<li>Sent to #{contact_name}: #{message}</li>")
          when 422
            console.error 'failed', jqXHR, status
          else
            console.error 'Connection Error', jqXHR, status
$(document).on "turbolinks:load", ->
  # return unless $('.sio-users').length > 0
  users = new App.Users
