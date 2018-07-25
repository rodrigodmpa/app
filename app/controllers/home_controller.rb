class HomeController < ApplicationController
  def index
    @sites = Site.where("user_id = ?", current_user.id) # pega todos os sites que o usuario logado criou
  end
end