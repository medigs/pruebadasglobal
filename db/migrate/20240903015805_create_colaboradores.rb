class CreateColaboradores < ActiveRecord::Migration[7.2]
  def change
    create_table :colaboradores do |t|
      t.references :sucursal, null: false, foreign_key: { to_table: :sucursales }
      t.string :nombre
      t.string :cui

      t.timestamps
    end
  end
end
