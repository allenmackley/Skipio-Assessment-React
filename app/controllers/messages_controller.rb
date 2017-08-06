class MessagesController < ApplicationController

  def index
    #Since the demo only has one user, just grab the first one in the database
    @user = User.find(1)
    # @sio_data = @user.fetch_sio_data
    @sio_contacts = @user.fetch_sio_contacts['data']
    @messages = Message.order('created_at DESC')
    @message = Message.new

    # Rails.logger.warn "MESSAGES: #{@messages}"
    # Rails.logger.warn "CONTACTS: #{@sio_contacts}"
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render :json => @message
    else
      render :json => @message.errors, status: :unprocessable_entity
    end
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :skipio_contact_user_id, :text)
    end
end
