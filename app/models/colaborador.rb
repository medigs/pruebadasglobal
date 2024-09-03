class Colaborador < ApplicationRecord
    self.table_name = "colaboradores"
    belongs_to :sucursal
end