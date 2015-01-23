class RemoveTradableFromBids < ActiveRecord::Migration
  def change
    remove_column :bids, :tradable, :boolean
  end
end
