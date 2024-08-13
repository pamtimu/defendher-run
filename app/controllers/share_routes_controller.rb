class ShareRoutesController < ApplicationController

  def share
    @users = User.all
  end

  def share_send
    friend = User.find(params[:user_id])
    if Chatroom.where(user_one: current_user, user_two: friend).exists? || Chatroom.where(user_one: friend, user_two: current_user).exists?
      chatroom = Chatroom.where(user_one: current_user, user_two: friend)
                   .or(Chatroom.where(user_one: friend, user_two: current_user))
                   .first
      Message.create!(
        chatroom_id: chatroom.id,
        user_id: current_user.id,
        content: "/routes/#{params[:id]}",
        message_type: "route_share"
        )
    else
      chatroom = Chatroom.create!(
        user_one: current_user,
        user_two: friend
      )
      Message.create!(
        chatroom_id: chatroom.id,
        user_id: current_user.id,
        content: "/routes/#{params[:id]}",
        message_type: "route_share"
        )
    end
    redirect_to chatroom_path(chatroom)
  end

end
