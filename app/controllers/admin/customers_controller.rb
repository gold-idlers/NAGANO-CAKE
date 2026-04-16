class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = if params[:search].present?
      Customer.where("email_address LIKE ?", "%#{params[:search]}%")
    else
      Customer.all
    end.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end
end
