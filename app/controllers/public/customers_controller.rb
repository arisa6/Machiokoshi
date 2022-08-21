class Public::CustomersController < ApplicationController
  
    def show
        # @customers = current_customer
        @customer = Customer.find(params[:id])
    end
    
    def edit
        # @customers = current_customer 
        @customer = Customer.find(params[:id])
    end
    
    def update
        # @customer = current_customer
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
          redirect_to public_customer_path(current_customer)
        else
          render "edit"
        end
    end
    
    def unsubscribe
    end
    
    def withdrawl #(退会)
    end
    
    
    private
      def customer_params
        params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email,:is_deleted)
      end
end
