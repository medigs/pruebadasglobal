class Empresa < ApplicationRecord
    self.table_name = "empresas"
  has_many :sucursales
end