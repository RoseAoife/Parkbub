class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.float :cost
      t.string :address
      t.text :body
      t.string :posted_by

      t.timestamps
    end
  end
end
