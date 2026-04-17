class Public::ItemsController < Public::ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.where(is_active: true).page(params[:page])
      @genre_name = @genre.name
    else
      @items = Item.where(is_active: true).page(params[:page])
      @genre_name = "商品"
    end
    @items_count = @items.total_count
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
end
