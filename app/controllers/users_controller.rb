# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show update destroy]

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user), status: :created
    else
      render json: @user.errors.as_json, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.first
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
