class CreateArticals < ActiveRecord::Migration
  def change
    create_table :articals do |t|
      t.string :title
      t.string :category
      t.text :content
      t.integer :user
      t.integer :read_number, default: 0
      t.integer :thumber_up_number

      t.timestamps
    end
  end
end
