class CreateModelos < ActiveRecord::Migration
  def change
    create_table :modelos do |t|
      t.string :nome
      t.integer :ano
      t.string :website
      t.integer :marca_id

      t.timestamps
    end
    execute 'ALTER TABLE modelos ADD COLUMN thumb LONGBLOB'
    add_index :modelos , :marca_id
  end
end
