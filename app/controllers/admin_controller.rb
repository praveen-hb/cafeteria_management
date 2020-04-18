class AdminController < ApplicationController
  def index
    if current_user.role == "owner"
      render "index"
    else
      render "/admin/error"
    end
  end
end
