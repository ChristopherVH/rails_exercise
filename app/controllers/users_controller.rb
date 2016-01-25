# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#

class UsersController < ApplicationController
  def index
    render json: User.all
  end


  def show
    render json: User.find_by_id(params[:id])
  end

  def edit
    render text: "i'm edited"
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    render json: User.find_by_id(params[:id]).destroy
  end

  def update
    render json: User.find_by_id(params[:id]).update(safe_params)
  end

  protected
  def safe_params
    params[:user].permit(:email)
  end

end
