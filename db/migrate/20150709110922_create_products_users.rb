class CreateProductsUsers < ActiveRecord::Migration
  def change
    create_table :products_users, id: false do |t|
      t.integer :product_id, null: false
      t.integer :user_id, null: false
    end

    # # Add an unique index for better join speed!
    add_index(:products_users, [:product_id, :user_id], :unique => true)
  end
end