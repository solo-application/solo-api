module V1
  class TripsController < ApplicationController
    before_action only: [:create, :show, :update] do
      validate_user
    end

    def create
      @user = User.find_by_id(params[:user_id])
      @trip = @user.trips.new(trip_params)
      if @trip.save
        render 'v1/trips/create', status: :created
      else
        render json: @trip.errors, status: :bad_request
      end
    end

    def index
      @user  = User.find_by_id(params[:user_id])
      @trips = @user.trips.where(complete: false).order(created_at: :desc)
      @trips = [@trips[0]] if @trips.any? && params[:current_only]
      if @trips
        render 'v1/trips/index', status: :ok
      else
        render json: { status: 'Trips not found' }, status: :not_found
      end
    end

    def destroy
      @trip = Trip.find_by_id(params[:trip_id])
      if @trip && @trip.destroy
        render json: { status: 'success' }, status: :ok
      else
        render json: { status: 'Trips not found' }, status: :not_found
      end
    end

    private

    def trip_params
      params.require(:trip).permit(:hotel, :country_name, :complete, :transport)
    end
  end
end
