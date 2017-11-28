class LikesController < ApplicationController

  def create
    uid = current_user.id
    sid = params[:like][:secret_id]
    # Like.create like_params
    Like.create(user_id: uid, secret_id: sid)
    redirect_to "/secrets"
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy if current_user == @like.user
    redirect_to "/secrets"  
  end

  private
    def like_params
      params.require(:like).permit(:secret_id).merge(user: current_user)
    end

end
