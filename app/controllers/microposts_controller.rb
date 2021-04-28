class MicropostsController < ApplicationController
    before_action :only_loggedin_users, only: [:create, :destroy]

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Successfully saved!"
            redirect_to root_url
        else
            @feed_item = []
            flash[:danger] = "Invalid content. Try again."
            redirect_to root_url
        end
    end
    def destroy
        Micropost.find(params[:id]).destroy
        redirect_to root_url
    end


    private
    def micropost_params
        params.require(:micropost).permit(:content)
    end
end
