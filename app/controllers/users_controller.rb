class UsersController < ApplicationController
    def my_portfolio
        @user = current_user
        @user_stocks = current_user.stocks
    end

    def my_friends
        @friendship = current_user.friends
    end

    def search
        if params[:search_param].blank?
            flash.now[:danger] = "You have entered empty string."
        else
            @users = User.search(params[:search_param])
            @users = current_user.except_current_user(@users)
            flash.now[:danger] = "No users match this search criteria." if @users.blank?
        end
        respond_to do |format|
            format.js {render partial: 'friends/result'}
        end
    end

    def add_friend
    end
end