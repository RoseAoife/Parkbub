class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.datetime :time

      t.references :parking_spaces
      t.references :users
        
      t.timestamps
    end
  end
end
