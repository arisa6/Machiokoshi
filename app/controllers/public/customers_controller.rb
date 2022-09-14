class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!,except: :withdrawl
  
    def show
        @customer = current_customer
        # @customer = Customer.find(params[:id])
    end
    
    def edit
        @customer = current_customer 
        # @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = current_customer
       if @customer.update(customer_params)
        redirect_to customer_path(current_customer)
        flash[:notice] = "お客様情報を更新しました。"
       else
        render :edit
        flash[:notice] = "お客様情報の更新に失敗しました。"
       end
    end
    
    def unsubscribe
    end
    
    def withdrawl #(退会)
      @customer = Customer.find(current_customer[:id])
      # is_deletedカラムをtrueに変更することで削除フラグを
      @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
      flash[:notice] = "退会が完了しました。"
    end
    
    
    private
      def customer_params
        params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email,:is_deleted)
      end
end
