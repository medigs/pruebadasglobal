class CreateSucursales < ActiveRecord::Migration[7.2]
  def change
    create_table :sucursales do |t|
      t.references :empresa, null: false, foreign_key: true
      t.string :nombre
      t.string :direccion
      t.string :telefono

      t.timestamps
    end
  end
end
