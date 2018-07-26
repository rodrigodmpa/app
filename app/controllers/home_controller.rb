class HomeController < ApplicationController
  def index
    if user_signed_in?
      @sites = Site.where("user_id = ?", current_user.id) # pega todos os sites que o usuario logado criou
      if current_user.is_admin?
        @users = User.all
      end
    end
  end
end