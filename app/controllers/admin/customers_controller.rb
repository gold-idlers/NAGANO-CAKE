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
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email_address, :is_active)
  end

end
