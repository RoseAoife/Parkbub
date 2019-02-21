class RecreateModels < ActiveRecord::Migration[5.2]
  def change

    drop_table :bookings

    remove_column :users, :bookings_id

    create_table :parking_spaces do |t|
      t.string 'name', allow_nil: false, allow_blank: false
      t.float 'cost', allow_nil: false, allow_blank: false
      t.string 'address', allow_nil: false, allow_blank: false
      t.string 'description', allow_nil: true, allow_blank: false

      t.references :user, allow_nil: false, allow_blank: false

      t.timestamps
    end

    create_table :bookings do |t|
      t.datetime :start_time, allow_nil: false, allow_blank: false
      t.datetime :end_time, allow_nil: false, allow_blank: false

      t.float :price, allow_nil: false, allow_blank: false

      t.references :parking_space, allow_nil: false, allow_blank: false
      t.references :user, allow_nil: false, allow_blank: false

      t.timestamps
    end
  end
end
