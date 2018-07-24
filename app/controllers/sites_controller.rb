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
        
        if !@site.text.start_with?('http')
            @site.text = 'https://'+@site.text
        end
      end

    def create
        @site = Site.new(site_params)
        # add this if you want to force the concatenation of https://
        # if !@site.text.start_with?('http')
        #     @site.text = 'https://'+@site.text
        # end
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
          redirect_to sites_path
        else
          render 'edit'
        end
      end

    def destroy
        @site = Site.find(params[:id])

        @site.destroy
        redirect_to sites_path
    end

    private
    def site_params
        params.require(:site).permit(:title, :text)
    end
end
