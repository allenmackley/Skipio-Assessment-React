class UsersController < ApplicationController

  def index
    @user = User.first
    @sio_data = @user.fetch_sio_data
  end

  def show
    @user = User.find(params[:id])
    @sio_contacts = @user.fetch_sio_contacts
  end

end
