class UsersController < ApplicationController
    before_action :authorize_request, only: [:show]

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end
end