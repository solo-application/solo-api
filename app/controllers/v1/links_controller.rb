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
      if @links
        render 'v1/links/index', status: :ok
      else
        render json: { status: 'Links not found' }, status: :not_found
      end
    end

    private

    def link_params
      params.require(:link).permit(:traveller_id, :companion_id)
    end
  end
end
