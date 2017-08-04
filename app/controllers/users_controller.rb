class UsersController < ApplicationController

  def index
    @user = User.first

    @user.skipio_api_token = File.read('skipio_token.txt')
  end

end
