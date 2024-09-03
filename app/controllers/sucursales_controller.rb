class SucursalesController < ApplicationController
    def show 
        @sucursal = Sucursal.find(params[:id])

    end

    def index
        @sucursales = Sucursal.where(empresa_id: params[:empresa_id]).all
        @empresa = Empresa.find(params[:empresa_id])
    end

    def edit
        @sucursal = Sucursal.find(params[:id])
    end

    def new
        @sucursal = Sucursal.new
        @empresa = Empresa.find(params[:empresa_id])
    end

    def create
        @sucursal = Sucursal.new(sucursal_params)
        @sucursal.empresa_id = params[:empresa_id]
        if @sucursal.save
            redirect_to empresa_sucursales_path
        else
            render :new
        end
    end

    def update
        @sucursal = Sucursal.find(params[:id])
        if @sucursal.update(sucursal_params)
            redirect_to empresa_sucursales_path
        else
            render :edit
        end
    end

    private
    def sucursal_params
        params.require(:sucursal).permit(:nombre, :direccion,:telefono)
    end
end
