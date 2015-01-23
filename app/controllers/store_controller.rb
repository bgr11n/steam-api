class StoreController < ApplicationController
  def index
    @bids = Bid.all
  end

  def create
    Bid.create bid_params
    render json: { next: store_index_path }
  end

  private

  def bid_params
    params.require(:bid).permit(:item_id, :classid, :title, :icon_url, :price)
  end

end
