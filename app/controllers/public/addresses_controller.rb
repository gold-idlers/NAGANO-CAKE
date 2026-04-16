class Public::AddressesController < Public::ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path, notice: "配送先を追加しました"
    else
      @addresses = current_customer.addresses
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: "配送先を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @address = current_customer.addresses.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: "配送先を削除しました"
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
