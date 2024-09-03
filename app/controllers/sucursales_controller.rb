class SucursalesController < ApplicationController
    def index
        @sucursales = Sucursal.where(empresa_id: params[:empresa_id]).all
    end
end
