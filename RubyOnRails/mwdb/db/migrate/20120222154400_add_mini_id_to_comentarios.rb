class AddMiniIdToComentarios < ActiveRecord::Migration
  def change
    execute 'ALTER TABLE comentarios ADD COLUMN miniatura_id INTEGER'
  end
end
