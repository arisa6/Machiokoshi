class Public::AddressesController < ApplicationController
 before_action :authenticate_customer!
 
 def index
  @address = Address.new
  @addresses = current_customer.addresses
 end
 
 def create
  @address = Address.new(address_params)
  @address.customer_id = current_customer.id
  @addresses = current_customer.addresses
    if @address.save  #←ここでバリデーションエラーか否か判断する。
       redirect_to addresses_path
       flash[:notice] = '新しい住所を登録しました'
    else  #エラーのとき、saveが上手く行かなかったときの記述
       render 'index'
       flash[:notice] = '住所の登録に失敗しました'
    end
 end
 
 def edit
  @address = Address.find(params[:id])
 end
 
 def update
  @address = Address.find(params[:id])
  @address.update(address_params)
    redirect_to addresses_path
    flash[:notice] = '住所を編集しました。'
 end
 
 def destroy
  address = Address.find(params[:id])
  address.destroy
   redirect_to addresses_path
   flash[:notice] = '住所を削除しました。'
 end

private
  
 def address_params
   params.require(:address).permit(:postal_code, :address, :name, :customer_id)
 end

end
