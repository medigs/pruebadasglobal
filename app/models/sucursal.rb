class Sucursal < ApplicationRecord
    self.table_name = "sucursales"
    has_many :colaboradores
    belongs_to :empresa
end