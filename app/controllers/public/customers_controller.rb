class Public::CustomersController < Public::ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path, notice: "会員情報を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    terminate_session
    redirect_to root_path, notice: "退会しました"
  end


  private

  def customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postal_code,
      :address,
      :phone_number,
      :email_address
    )
  end
end
