class SitesController < ApplicationController
    def index
        @sites = Site.all
    end
    def show
        @site = Site.find(params[:id])
    end

    def new
        @site = Site.new
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

    private
    def site_params
        params.require(:site).permit(:title, :text)
    end
end
