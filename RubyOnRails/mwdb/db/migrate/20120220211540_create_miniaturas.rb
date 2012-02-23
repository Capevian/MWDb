class CreateMiniaturas < ActiveRecord::Migration
  def change
    create_table :miniaturas do |t|
      t.string :descricao
      t.integer :modelo_id
      t.integer :construtor_id
      t.integer :escala_id

      t.timestamps
    end
    execute 'ALTER TABLE miniaturas ADD COLUMN thumb LONGBLOB'
    add_index :miniaturas , :construtor_id
  end
end
