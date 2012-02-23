class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :texto
      t.boolean :publicado
      t.integer :user_id

      t.timestamps
    end
  end
end
