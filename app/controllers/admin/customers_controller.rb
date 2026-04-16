class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.all.page(params[:page])

  end

  def show
  end

  def edit
  end

  def update
  end
end
