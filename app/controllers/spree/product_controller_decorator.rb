Spree::ProductsController.class_eval do

	#subscribe to price changes
    def subscribe
    	try_spree_current_user.products << @product
      	respond_to do |format|
		  format.html { redirect_to url_for(params), status: :moved_permanently, notice: 'You have subscribed to price changes successfully.' }
	  	end
    end

    #unsubscribe from price changes
    def unsubscribe
	   	product = Spree::Product.find(params[:id])
	    try_spree_current_user.products.destroy product

	    respond_to do |format|
			format.html { redirect_to url_for(params), status: :moved_permanently, notice: 'You have unsubscribed to price changes successfully.' }
	  	end
    end
end	
