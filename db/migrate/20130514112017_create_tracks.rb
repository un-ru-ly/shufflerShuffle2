class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :shufflerId
      t.string :title
      t.integer :order

      t.timestamps
    end
  end
end
