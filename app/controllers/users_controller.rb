class UsersController < ApplicationController

    #POST /signup
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: user, status: :created
        else 
            render json: { errors: "Invalid username or password" }, status: :unprocessable_entity
        end
    end 

    #GET /me
    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: :ok
        else
            render json: { error: "User not found" }, status: :unauthorized
        end
    end

    #Private Methods
    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

end
