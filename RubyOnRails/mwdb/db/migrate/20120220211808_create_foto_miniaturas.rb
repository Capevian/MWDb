class CreateFotoMiniaturas < ActiveRecord::Migration
  def change
    create_table :foto_miniaturas do |t|
      t.integer :miniatura_id

      t.timestamps
    end
    execute 'ALTER TABLE foto_miniaturas ADD COLUMN foto LONGBLOB'
    add_index :foto_miniaturas , :miniatura_id
  end
end
