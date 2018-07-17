class SitesController < ApplicationController
    def index
        @sites = Site.where("user_id = ?", current_user.id) # pega todos os sites que o usuario logado criou
    end
    def show
        @site = Site.find(params[:id])
    end

    def new
        @site = Site.new
    end

    def edit
        @site = Site.find(params[:id])
      end

    def create
        @site = Site.new(site_params)
        @site.user_id = current_user.id

        if @site.save
            redirect_to @site
        else
            flash
            render 'new'
        end
    end

    def update
        @site = Site.find(params[:id])
       
        if @site.update(site_params)
          redirect_to @site
        else
          render 'edit'
        end
      end

    private
    def site_params
        params.require(:site).permit(:title, :text)
    end
end
