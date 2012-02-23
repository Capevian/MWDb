class CreateMarcas < ActiveRecord::Migration
  def change
    create_table :marcas do |t|
      t.string :nome
      t.integer :tipo_id

      t.timestamps
    end
    execute 'ALTER TABLE marcas ADD COLUMN logo LONGBLOB'
    add_index :marcas , :tipo_id
  end
end
