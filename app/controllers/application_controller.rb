class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def curl_post url, form_data
    uri     = URI.parse(url)
    http    = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(form_data)
    response = http.request(request)
    return JSON.parse(response.body)
  end

  def curl_get url, auth_token
    uri     = URI.parse(url)
    # Rails.logger.debug("CURL: #{uri.host} - #{uri.port} - #{uri.request_uri}")
    http    = Net::HTTP.new(uri.host, uri.port)
    # Rails.logger.debug("CURL: #{http}")
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    if auth_token
      request['Authorization'] = "Bearer #{auth_token}"
    end
    # Rails.logger.debug("CURL: #{auth_token}")
    response = http.request(request)
    # Rails.logger.debug("CURL: #{response.body}")
    return JSON.parse(response.body)
  end
end
