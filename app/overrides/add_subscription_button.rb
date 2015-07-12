Deface::Override.new(:virtual_path => 'spree/products/show',
  :name => 'add_subscription_button',
  :insert_after => "#cart-form",
  :text => "
  	<% if try_spree_current_user %>
		<div id = 'price-change-subscription'>
			<% if !try_spree_current_user.products.find_by(id: @product.id) %>
				<%= form_for @product, url: {action: 'subscribe'}, html: {method: 'post', class: 'nifty_form'} do |f| %>
			  		<%= button_tag :class => 'btn btn-success', :id => 'subscribe_to_price_changes-button', :type => :submit do %>
			        	<%= Spree.t(:subscribe_to_price_changes) %>
		 	  		<% end %>
		 		<% end %>
		 	<% else %>
		 		<p>You are subscribed. <%= link_to 'unsubscribe?', { controller: :products, action: :unsubscribe, :id => @product.id}, method: :delete %></p>
		 	<% end %>
		</div>
	<% end %>
  ")