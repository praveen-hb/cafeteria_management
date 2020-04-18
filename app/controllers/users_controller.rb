class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      role: params[:role],
      password: params[:password],
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      flash[:notice] = "You've signed-up successfully!"
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def info
    @users_customer = User.get_customers
    @users_clerk = User.get_clerks
    render "users/users_info"
  end

  def adding_clerk_page
    render "users/add_clerk"
  end

  def adding_clerk
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      role: "clerk",
      password: params[:password],
    )
    new_user.save
    redirect_to admin_page_path
  end
end
