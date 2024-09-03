class ColaboradoresController < ApplicationController
    def index
        @colaboradores = Colaborador.where(sucursal_id: params[:sucursal_id]).all
    end
end
