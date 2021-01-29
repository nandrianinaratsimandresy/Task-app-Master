class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      # current_user.locale
      # request.env["HTTP_ACCEPT_LANGUAGE"]
    end

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end

    # def authenticate_user
        # if @current_user == nil
    #       flash[:notice] = t('notice.login_needed')
    #        redirect_to new_session_path
    #     end
    #   end

    def authenticate_user
        unless logged_in?
          flash[:warning] = 'Please login first!'
          redirect_to new_session_path
        end
      end





end
