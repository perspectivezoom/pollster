class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :maker_key
      t.string :taker_key
      t.string :name

      t.timestamps
    end
  end
end
