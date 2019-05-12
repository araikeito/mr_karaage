# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    homes_top_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(_resource)
    homes_top_path # ログアウト後に遷移するpathを設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
  end
end
