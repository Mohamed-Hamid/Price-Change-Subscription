class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :subscriptions, :user, :user_id
  	rename_column :subscriptions, :product, :product_id
  end
end
