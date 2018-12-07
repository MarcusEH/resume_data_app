class Api::UsersController < ApplicationController
   def create
    user = User.new(
      student_id: params[:student_id],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: 201
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
