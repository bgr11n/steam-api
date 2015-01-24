class ChangePriceFormatInBid < ActiveRecord::Migration
  def up
    change_column :bids, :price, :decimal
  end

  def down
    change_column :bids, :price, :integer
  end
end
