class ApartmentsController < ApplicationController
    before_action :find_apartment, only: [:show, :update, :destroy]

    def index
        apartment = Apartment.all
        render json: apartment
    end

    def show
        render json: @apartment
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        @apartment.update(apartment_params)
        render json: @apartment, status: :created
    end

    def destroy
        @apartment.destroy
        head :no_content
    end

    private

    def apartment_params
        params.permit(:number)
    end

    def find_apartment
        @apartment = Apartment.find(params[:id])
    end
end
