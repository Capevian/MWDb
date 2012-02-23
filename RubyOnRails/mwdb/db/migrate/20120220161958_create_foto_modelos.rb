class CreateFotoModelos < ActiveRecord::Migration
  def change
    create_table :foto_modelos do |t|
      t.integer :modelo_id

      t.timestamps
    end
    execute 'ALTER TABLE foto_modelos ADD COLUMN foto LONGBLOB'
    add_index :foto_modelos , :modelo_id
  end
end
