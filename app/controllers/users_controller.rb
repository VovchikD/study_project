class UsersController < ApplicationController
    def index
      @user = User.find_by(params[:id])
    end
    def new
        @user = User.new
      end

      def show
        @user = User.find_by(params[:id])
      end

      def create
        @user = User.new(user_params)
          if @user.save
            session[:user_id] = @user_id
            redirect_to root_url
          else
            redirect_to signup_url
        end
      end

      def update
        @user = User.find_by(params[:id])
        if @user.update(user_params)
          redirect_to @user
        else
          flash[:notice] = "message"
          render 'index'
        end
      end
      
      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
end
