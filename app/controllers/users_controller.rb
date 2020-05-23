class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      role: "customer",
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
    if current_user.role == "owner"
      @users_customer = User.get_customers
      @users_clerk = User.get_clerks
      render "users/users_info"
    else
      render "/admin/error"
    end
  end

  def adding_user_page
    if current_user.role == "owner"
      render "users/add_user"
    else
      render "/admin/error"
    end
  end

  def adding_user
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      role: params[:role],
      password: params[:password],
    )
    new_user.save!
    redirect_to admin_page_path
  end

  def destroy
    user = User.find(params[:id])
    @not_delivered_orders = Order.not_delivered_user(user.id)
    if @not_delivered_orders.length() != 0
      flash[:notice] = "Deliver the pending orders to delete user #{@not_delivered_orders.length()}"
    else
      user.destroy
    end
    redirect_to users_info_path
  end
end
