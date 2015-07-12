module Spree
  User.class_eval do
    has_and_belongs_to_many :products, :class_name => 'Spree::Product', :join_table => 'products_users'
  end
end