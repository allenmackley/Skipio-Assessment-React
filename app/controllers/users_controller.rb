class UsersController < ApplicationController

  def index
    #Since the demo only has one user, just grab the first one in the database
    @user = User.first
    @sio_data = @user.fetch_sio_data
  end

  def show
    @user = User.find(params[:id])
    @sio_contacts = @user.fetch_sio_contacts
  end

  # An alternate way to POST to the API using CURL from the server.
  # def sio_send_sms
  #   p = sio_send_sms_params
  #   @user = User.find(p[:user_id])
  #   res = @user.send_sio_message p[:message], p[:recipient]
  #   render :json => res.to_json
  # end

  # private
  #   def sio_send_sms_params
  #     params.permit(:user_id, :recipient, :message)
  #   end

end
