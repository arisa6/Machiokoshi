class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  #会員のページにアクセスする前にconfigure_permitted_parametersを実行する
  
  def after_admin_sign_in_path_for(resource_or_scope)　#複数のdeviceがある場合この記述をする
    if resource.is_a?(Admin)
       admin_orders_path
    else
       root_path
    end
  end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])   
    #sign_upの際に許可するメソッド
  end
end
