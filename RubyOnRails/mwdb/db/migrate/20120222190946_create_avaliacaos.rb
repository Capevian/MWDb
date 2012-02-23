class CreateAvaliacaos < ActiveRecord::Migration
  def change
    create_table :avaliacaos do |t|
      t.integer :avaliacao
      t.integer :user_id
      t.integer :miniatura_id

      t.timestamps
    end
  end
end
