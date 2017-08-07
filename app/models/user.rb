class User < ApplicationRecord
  include CustomCurl

  has_many :messages

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, allow_blank: false, length: {minimum: 2, maximum: 50}
  validates :email, presence: true, allow_blank: false, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  @@SIO_ROOT      = "https://stage.skipio.com/api/v2/"
  #Reads the token in from a file so that the file can be excluded from the GIT repo. I have this here for now because it's a demo and the token was provided. In a real life scenario the token would be unique to each user.
  @@SIO_API_TOKEN = File.read('skipio_token.txt')

  def get_token
    @@SIO_API_TOKEN
  end

  #TODO: Ideally, this data would only be retrieved from Skipio once, or on some interval, and saved to our database. This way, loading is much faster, and we don't tax the Skipio servers.
  def fetch_sio_data
    sio_get_me = "#{@@SIO_ROOT}users/me?token=#{@@SIO_API_TOKEN}"
    curl_get(sio_get_me).with_indifferent_access[:data]
  end

  def fetch_sio_contacts
    sio_get_contacts = "#{@@SIO_ROOT}contacts?token=#{@@SIO_API_TOKEN}"
    curl_get(sio_get_contacts) #.with_indifferent_access[:data]
  end

  def send_sio_message message = "", sio_contact_id = nil
    sio_post_message = "#{@@SIO_ROOT}messages?token=#{@@SIO_API_TOKEN}"
    curl_post(sio_post_message,
      {
        "recipients" => [sio_contact_id],
        "message"    => {
          "body" => message
        }
      }, 'application/json'
    )
  end

end
