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

  def invoice_bills
    session[:orders] = nil
    redirect_to reports_path
  end

  def reports
    @orders = session[:orders]
    render "report"
  end
end
