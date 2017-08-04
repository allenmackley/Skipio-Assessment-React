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
    #Normally, the token would be fetched from the API service, but since it's already been provided for the assessment in this case, I just grabbed it off of the DOM. Normally I don't think it would be the best idea to store the token on the DOM because you never know what kind of malware might reside on the client's machine. Ideally, it wouldn't be handled on the client side. It would be possible to handle the token enirely on the server, construct the URL there, then send the reaquest to the Skipio API.
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
