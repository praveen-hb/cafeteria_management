class AdminController < ApplicationController
  def index
    if current_user.role == "owner"
      render "index"
    else
      render "/admin/error"
    end
  end

  def clerk
    if current_user.role == "clerk"
      render "clerk"
    else
      render "/admin/error"
    end
  end

  def reports
    @orders = []
    render "report"
  end
end

#<%= submit_tag order.user.first_name,class: "Menu-name",onclick: "location.href='/orders/#{order.id}'" %></h2>
