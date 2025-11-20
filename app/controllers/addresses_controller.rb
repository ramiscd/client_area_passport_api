class AddressesController < ApplicationController
    def index
        @addresses = Address.all
        render :index
    end

    def show
        @address = Address.find(params[:id])
        render show
    end
end
