class UsersController < ApplicationController

  def index
    @user = User.first
    @sio_data = @user.fetch_sio_data
  end

  def show
    @user = User.find(params[:id])
    @sio_contacts = @user.fetch_sio_contacts
  end

  #{"recipients"=>["contact-d173752b-cb0c-4602-bdd9-a802023358de"], "message"=>{"body"=>"Type your message here..."}}
  def sio_send_sms
    #Rails.logger.warn sio_send_sms_params
    p = sio_send_sms_params
    @user = User.find(p[:user_id])
    res = @user.send_sio_message p[:message], p[:recipient]
    render :json => res.to_json
  end

  private
    def sio_send_sms_params
      params.permit(:user_id, :recipient, :message)
    end

end
