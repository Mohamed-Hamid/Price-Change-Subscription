module Spree
  Product.class_eval do
    has_and_belongs_to_many :users, :class_name => 'Spree::User', :join_table => 'products_users', dependent: :destroy

  	before_save :notify_subscribers

    def subscribers_emails product
      product.users.select(:email).map(&:email)
    end

  	private
    
	  #send emails to subscribers
    def notify_subscribers
        if (self.master.default_price.amount_changed? && self.master.default_price.amount_was > self.master.default_price.amount)
	        Spree::NotificationMailer.mail_to_subscriber(self).deliver_now
    	  end
    end
  end
end