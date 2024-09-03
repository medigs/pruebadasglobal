require 'json'

class CargaJsonController < ApplicationController
  def create
    begin
      if params[:archivo].present?
        file = params[:archivo]
        if File.extname(file.original_filename) == '.json'
          # Leer y analizar el archivo JSON
          contenido = file.read
          contenido_hash = JSON.parse(contenido)
          
          ActiveRecord::Base.transaction do
            # Crear la empresa
            empresa = Empresa.new(
              nombre: contenido_hash['empresa']['nombre'],
              pais: contenido_hash['empresa']['pais']
            )
            empresa.save!

            # Procesar sucursales
            contenido_hash['empresa']['sucursales'].each do |sucursal_data|
              sucursal = Sucursal.new(
                nombre: sucursal_data['nombre'],
                direccion: sucursal_data['direccion'],
                telefono: sucursal_data['telefono'],
                empresa_id: empresa.id
              )
              sucursal.save!

            #   Procesar colaboradores (descomentando si se requiere)
              sucursal_data['colaboradores'].each do |colaborador_data|
                colaborador = Colaborador.new(
                  nombre: colaborador_data['nombre'],
                  cui: colaborador_data['CUI'],
                  sucursal_id: sucursal.id
                )
                colaborador.save!
              end
            end
          end

          flash[:success] = "Archivo JSON cargado exitosamente."
        else
          flash[:notice] = "Solo se permiten archivos JSON."
        end
      else
        flash[:alert] = "No se ha seleccionado ningún archivo."
      end
    rescue JSON::ParserError => e
      flash[:error] = "El archivo JSON no es válido."
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = "Error al guardar los datos: #{e.message}"
    rescue StandardError => e
      flash[:error] = "Se produjo un error inesperado: #{e.message}"
    ensure
      redirect_to new_carga_json_path
    end
  end
end
