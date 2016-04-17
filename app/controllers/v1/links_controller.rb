module V1
  class LinksController < ApplicationController
    before_action only: [:create, :show, :update] do
      validate_user
    end

    def create
      @link = Link.new(link_params)
      if @link.save
        render 'v1/links/create', status: :created
      else
        render json: @link.errors, status: :bad_request
      end
    end

    def index
      @links = current_user.companion_links
      if params[:type] == 'current'
        @links = @links.where(match_confirmed: true)
      elsif params[:type] == 'pending'
        @links = @links.where(match_confirmed: false)
      end
      if @links
        render 'v1/links/index', status: :ok
      else
        render json: { status: 'Links not found' }, status: :not_found
      end
    end

    def update
      @link = Link.find_by_id(params[:id])
      if @link && @link.update(link_params)
        render 'v1/links/create', status: :ok
      else
        render json: { status: 'Link not found' }, status: :not_found
      end
    end

    def destroy
      @link = Link.find_by_id(params[:link_id])
      if @link && @link.destroy
        render json: { status: 'success' }, status: :ok
      else
        render json: { status: 'Link not found' }, status: :not_found
      end
    end

    private

    def link_params
      params.require(:link).permit(:traveller_id, :companion_id, :match_confirmed)
    end
  end
end
