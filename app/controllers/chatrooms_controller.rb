class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    if chatroom_exist?
      redirect_to chatroom_path(@chatroom)
    else
      @chatroom = Chatroom.new
      @chatroom.user_one = current_user
      @chatroom.user_two = User.find(params[:user_id])
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      else
        redirect_to user_path(current_user)
      end
    end
  end

  def index
    @chatrooms = Chatroom.all
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  private

  def chatroom_exist?
    @chatroom = Chatroom.find_by(user_one: current_user, user_two: User.find(params[:user_id]))
  end
end
