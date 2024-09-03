class ColaboradoresController < ApplicationController

    def index
        @colaboradores = Colaborador.where(sucursal_id: params[:sucursal_id]).all
        @sucursal = Sucursal.find(params[:sucursal_id])
    end

    def edit
        @colaborador = Colaborador.find(params[:id])
    end

    def new
        @colaborador = Colaborador.new
        @sucursal = Sucursal.find(params[:sucursal_id])
    end

    def create
        @colaborador = Colaborador.new(colaborador_params)
        @colaborador.sucursal_id = params[:sucursal_id]
        if @colaborador.save
            redirect_to colaboradores_path
        else
            render :new
        end
    end

    def update
        @colaborador = Colaborador.find(params[:id])
        if @colaborador.update(colaborador_params)
            redirect_to colaboradores_path
        else
            render :edit
        end
    end

    private
    def colaborador_params
        params.require(:colaborador).permit(:nombre, :cui)
    end

end
