class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :item_id
      t.integer :classid
      t.string :title
      t.string :icon_url
      t.boolean :tradable
      t.integer :price

      t.timestamps
    end
  end
end
