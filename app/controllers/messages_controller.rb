class MessagesController < ApplicationController

  def index
    #Since the demo only has one user, just grab the first one in the database
    @user = User.find(1)
    @sio_data = @user.fetch_sio_data
    @sio_contacts = @user.fetch_sio_contacts
    @messages = Message.order('created_at ASC')
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save

    @messages = Message.order('created_at ASC')
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :skipio_contact_user_id, :text)
    end
end
